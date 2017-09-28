---
title: Status Service
redirect_from:
  - /Developers/Articles/StatusService/
  - /StatusService/
---

### Overview 

The `MonoDevelop.Ide.Status` namespace contains classes related to the `StatusService`. The `StatusService` is the model behind the status system. The statusbar in the toolbar is one possible view of this system. Other views could be created. A view which directs status messages to the system notification service might be another, a third might be a log viewer that lists status messages.

### Classes

There are two main classes involved in the `StatusService` system.

1. The `StatusService` class is the main class in the system. Through it, code can create contexts to manage the lifecycle of their status messages, or code can just use the `MainContext` which is managed by the `StatusService` class.

2. The `StatusMessageContext` class is the way client code can set the status message or progress, and any associated image. By creating a new `StatusMessageContext` the client code can control the lifecycle of the status, and the status will remain active until the `StatusMessageContext` is disposed.

The `StatusService` also has a `StatusMessageContext` called `MainContext` which allows client code to set the status details without needing to create a new `StatusMessageContext` but this status will be overwritten and lost as soon as some other code sets the status.

### Statusbar Icons

Statusbar Icons can be set through the `StatusService` class. Examples of these icons are the icons that are visible when there are updates available or when the code is being analysed. 

The method `ShowStatusIcon` takes an `Xwt.Drawing.Image` and returns a `StatusBarIcon` which will be added to the statusbar, and will be removed again when it is disposed.

#### Examples

* Setting the status message using `MainContext`

```csharp
using MonoDevelop.Ide.Status;

...
    // This message will remain active until something else replaces it
    StatusService.MainContext.ShowMessage ("Test status");

```

Warnings and errors can also be shown using `ShowWarning ()` and `ShowError ()`

* Using a custom `StatusMessageContext` to control the lifecycle of the message

```csharp
using MonoDevelop.Ide.Status;

...
    StatusMessageContext context;

    ...

    // This message will remain until the context is disposed.
    // If some other code creates a context it will be replaced, but when that
    // context is disposed, this message will return
    context = StatusService.CreateContext ();
    context.ShowMessage ("Test status");

    ...

    // When you want to remove the status, dispose the context
    context.Dispose ();
```

* Setting the progress

```csharp
using MonoDevelop.Ide.Status;

    ...

    StatusMessageContext context

    ...

    context = StatusService.CreateContext ();
    context.BeginProgress ("Test Progress");

    ...

    for (double p = 0.0; p < 1.0; p += 0.1) {
        DoSomeWork ();
        context.SetProgressFraction (p);
    }

    ...

    context.EndProgress ();
    context.Dispose ();
```

* Adding a StatusBarIcon

```csharp
using MonoDevelop.Ide.Status;

    ...

    StatusBarIcon icon;

    ...

    icon = StatusService.ShowStatusIcon (image);
    icon.Title = "Test Icon";
    icon.Clicked += (o, e) => {
        Console.WriteLine ("Test icon clicked");
    };

    ...

    // To remove the icon when finished with
    icon.Dispose ();
