---
title: Quick Code Generation
redirect_from:
  - /Documentation/Feature_List/Quick_Code_Generation/
---

The quick code generation pop-up can be activated with the `Alt + Insert` shortcut, by default.
This feature allows for the generation of:

-   Constructors
-   Properties
-   Event Handlers
-   `ToString ()`, `Equals (object)`, and `GetHashCode ()` overridden methods.

### Example

Let's start with a small class:

``` csharp
using System;

class Timer
{
    int time;
    string name;

    public event EventHandler TimeChanged;
}
```

Now, using the code generatation pop-up (from the shortcut `Alt + Insert`), the following code can be generated:

``` csharp
using System;

class Timer
{
    int time;
    string name;

    public string Name {
        get {
            return this.name;
        }
    }

    public int Time {
        get {
            return this.time;
        }
        set {
            this.time = value;
            OnTimeChanged (EventArgs.Empty);
        }
    }

    public Timer (string name)
    {
        this.name = name;
    }

    public override string ToString ()
    {
        return string.Format ("[Timer: Name={0}, Time={1}]", Name, Time);
    }

    public override bool Equals (object obj)
    {
        if (obj == null)
            return false;
        if (ReferenceEquals (this, obj))
            return true;
        if (obj.GetType () != typeof(Timer))
            return false;
        Timer other = (Timer)obj;
        return time == other.time && name == other.name;
    }

    public override int GetHashCode ()
    {
        unchecked {
            return time.GetHashCode () ^ (name != null ? name.GetHashCode () : 0);
        }
    }

    protected virtual void OnTimeChanged (EventArgs e)
    {
        if (TimeChanged != null)
            TimeChanged (this, e);
    }

    public event EventHandler TimeChanged;
}
```

_Note:_ A call to `OnTimeChanged` has been added manually in the `Time` property setter.
