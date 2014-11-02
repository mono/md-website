---
title: Thread Management
redirect_from:
  - /Developers/Articles/Thread_Management/
  - /Thread_Management/
---

### Introduction

This document explains the some basic rules that every addin developer should follow regarding thread management in MonoDevelop.

### What's the issue with the GUI and non-GUI thread?

In general, MonoDevelop code runs in the GUI thread, that is, the thread that created the GTK Application object and that runs the event loop. However, sometimes it is necessary to create secondary threads to perform some background operations (for example, parsing the file being edited, compiling, etc.). Those threads can do whatever they want, but they cannot directly change GUI objects, only the GUI thread can change GUI objects.

### Updating the GUI from secondary threads

Non-GUI threads can't "directly" change GUI objects, but they can do it "indirectly" by dispatching the changes through the GUI thread. You can do it with the **DispatchService**, like in the following example:

``` csharp
public class Clock
{
    Gtk.Window window;
    Gtk.Entry entry;

    public Clock ()
    {
        entry = new Entry ();
        window.Add (entry);
        window.ShowAll ();
        Thread t = new Thread (new ThreadStart (DoBackgroundWork));
        t.Start ();
    }

    public void DoBackgroundWork ()
    {
        for (int n=0; n<1000; n++) {
            Thread.Sleep (1000);
            Runtime.DispatchService.GuiDispatch (new StatefulMessageHandler (UpdateGui), n);
        }
    }

    void UpdateGui (object ob)
    {
        entry.Text = ob + " seconds elapsed";
    }
}
```

### GUI thread safe methods

Let's call GUI thread safe methods to methods that can be safely called from any thread. If that method needs to update the GUI, it will internally do it through the dispatch service.

For example, all methods and objects you can get from Runtime.TaskService are GUI thread safe. Most of those methods update the GUI, but the TaskService takes care of doing it in the GUI thread.

All objects and methods that are accessible from the root Runtime object should be GUI thread safe, with the exception of the objects below Runtime.Gui. I'm saying "should" because some of them may still not be thread safe, but most of them already are (this needs to be fixed).

### Event handlers that need to run in the GUI thread

Sometimes you'll be implementing an object that updates the GUI, and that needs to subscribe to events from GUI thread safe objects. Will those events be raised in the GUI thread? They will not, or being more precise, you can't be sure they will. It is the responsibility of the subscriber to ensure that the handler code is executed in the correct thread.

The DispatchService provides a method that helps in making the transition from non-GUI to GUI thread when dispatching events. The following example is a rewrite of the previous example, but now using events:

``` csharp
public class Clock
{
    Gtk.Window window;
    Gtk.Entry entry;
    Counter counter;

    public Clock ()
    {
        entry = new Entry ();
        window.Add (entry);
        window.ShowAll ();
        counter = new Counter ();
        counter.TimeChanged += (EventHandler) Runtime.DispatchService.GuiDispatch (new EventHandler (UpdateTime));
        counter.Start ();
    }

    void UpdateTime (object sender, EventArgs args)
    {
        entry.Text = counter.CurrentTime + " seconds elapsed";
    }
}



public class Counter
{
    public event EventHandler TimeChanged;
    public int CurrentTime;

    public void Start ()
    {
        Thread t = new Thread (new ThreadStart (DoBackgroundWork));
        t.Start ();
    }

    public void ResetTimer ()
    {
        CurrentTime = 0;
    }

    void DoBackgroundWork ()
    {
        while (true) {
            Thread.Sleep (1000);
            CurrentTime ++;
            if (TimeChanged != null)
                TimeChanged (null, null);
        }
    }
}
```

There are a couple of interesting things in this example:

-   First of all, notice that the Counter class is GUI thread safe, because its methods can be called from any thread. Since Counter does not directly update the GUI, there is no need for special dispatching code.
-   The Clock class needs to run the UpdateTime handler in the GUI thread. One solution could be to handle the event in an intermediary method that would then dispatch the event to the real handler in the GUI thread (using the technique described in the previous example). But there is a much easier way:

    counter.TimeChanged += (EventHandler) Runtime.DispatchService.GuiDispatch (new EventHandler (UpdateTime))

This call to **Runtime.DispatchService.GuiDispatch** will create a wrapper delegate that will automatically dispatch the event through the GUI thread for you.

**WARNING**: events dispatched using Runtime.DispatchService.GuiDispatch are always dispatched asynchronously in the GUI thread. This means that when the GUI object receives the event, the source of the event may already have changed its state.

### How to implement a GUI thread safe object

If the object does not update the GUI, it can be considered GUI thread safe (even if it raises events, see previous section).

If some of the methods need to directly update the GUI, you have two options. The fist option is to implement an intermediary method that will dispatch the call to the real method through the GUI thread. For example, I could add a safe Reset method to the Clock sample class like this:

``` csharp
public class Clock
{
    (...)

    public void Reset ()
    {
        Runtime.DispatchService.GuiDispatch (new MessageHandler (RealReset));
    }

    void RealReset ()
    {
        entry.Text = "";
        counter.ResetTimer ();
    }

    (...)
}
```

The second option is the make the class inherit from the **GuiSyncObject** class. All subclasses of GuiObject will run its methods in the GUI thread. The transition from non-GUI to GUI thread is automatic and transparent. Let's rewrite the clock example in this way:

``` csharp
public class Clock: GuiSyncObject
{
    Gtk.Window window;
    Gtk.Entry entry;
    Counter counter;

    public Clock ()
    {
        entry = new Entry ();
        window.Add (entry);
        window.ShowAll ();
        counter = new Counter ();
        counter.TimeChanged += new EventHandler (UpdateTime);
        counter.Start ();
    }

    void UpdateTime (object sender, EventArgs args)
    {
        entry.Text = ob + " seconds elapsed";
    }

    public void Reset ()
    {
        entry.Text = "";
        counter.ResetTimer ();
    }
}

public class Counter
{
    (same as previous example)
}
```

Notice that:

-   The Reset method can be freely called from any thread, because GuiSyncObject will intercept the call and dispatch it through the GUI thread if necessary.
-   The Clock object can also be created from any thread, since even the class constructor is automatically executed in the GUI thread.
-   The GUI delegate wrapper is not needed any more, since the event handler also benefits from the automatic GUI dispatching.

This way of creating GUI thread safe objects is really easy and reliable, but it has a drawback: performance. GuiSyncObject is implemented using ContextBoundObject and the interception sinks that the remoting infrastructure provides. It means that all calls to the object are converted to messages, go through all the sinks, and are finally dispatched using something like reflection. This is much slower than a normal call, but you only will notice it if the method needs to be called with a very high frequency, and this is not common for methods that update the GUI.

GuiSyncObject subclasses can also make use of some attributes to improve the performance. For example:

``` csharp
public class Clock: GuiSyncObject
{
    (...)

    [FreeDispatch]
    public void Pause ()
    {
        counter.Pause ();
    }

    [AsyncDispatch]
    public void Reset ()
    {
        entry.Text = "";
        counter.ResetTimer ();
    }

    (...)
}
```

When **FreeDispatchAttribute** is applied to a method, that method will be executed in the caller's thread. This is useful to avoid the GUI thread dispatch for a method that does not really need it.

On the other hand, when **AsyncDispatchAttribute** is applied, the method will be asynchronously executed in the GUI thread (this can only be used for methods that do not return values). Notice that by default all methods are executed synchronously.

If you are writing a service and you want to take advantage of the GuiSyncObject features, you can subclass **GuiSyncAbstractService** instead, which works in the same way.
