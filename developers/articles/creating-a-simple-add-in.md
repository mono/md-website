---
title: Creating a Simple Add-in
redirect_from:
  - /Developers/Articles/Creating_a_Simple_Add-in/
---

This walkthrough will guide you through the process of creating a simple add-in, introducing the fundamentals of the add-in system and some of MonoDevelop's core APIs.

Introduction
------------

The MonoDevelop addin architecture is designed to allow you to extend any part of MonoDevelop, for example supporting a new language or version control system, or custom source editing commands. This walkthrough will take you through the basics of writing addins, by describing the creating of a simple addin that adds a command to insert the current date into the source editor.

MonoDevelop is built around the concept of an extension tree. An addin is a set of extensions that plug into extension points defined in other addins, and can also define new extension points for other addins to extend. The whole of MonoDevelop is built this way, so there are many extension points available, and the core ones are described in the Extension Point Reference. MonoDevelop uses the [Mono.Addins](http://www.mono-project.com/Mono.Addins) addin engine, so for advanced addin questions, refer to the [Mono.Addins Reference Manual](http://www.mono-project.com/Mono.Addins_Reference_Manual). You can also use Mono.Addins in your own applications.

Creating the Addin
------------------

For this tutorial we will use the Addin Maker addin, which simplifies the process of creating, running and debugging an addin. The Addin Maker addin can be installed from the Addin Manager. Once it's installed, you'll see a new *Miscellaneous/General* category in the *New Solution* dialog, with a "IDE Extension" addin template. Visual Studio for Mac is an extended and rebranded version of MonoDevelop, so you can use this to create an addin that will work for Visual Studio for Mac, Xamarin Studio and MonoDevelop. 

Start out by creating a new addin called "DateInserter". This will create an addin that you can build and run/debug. If you run it, a new instance of Visual Studio for Mac / Xamarin Studio / MonoDevelop will be launched, and you will see your DateInserter addin in its Addin Manager.

An addin has metadata about its name, version, dependencies, etc. It also defines any number of extensions that plug into extension points defined by other addins, and can also define extension points that other addins can extend.

The metadata, extensions and extension points can be defined via C# attributes, or in one or more XML files with the extension *.addin.xml*, which are typically embedded resources in the assembly. Attributes are often simpler, but some things can only be done with addin XML, so for simplicity most addins use addin XML so that its extension and extension points are all listed in one place.

The addin created by the Addin Maker uses C# attributes for the metadata in a file called `AddinInfo.cs`, but its also creates an empty `Manifest.addin.xml` file. Both are in the `Properties` folder. 

The `AddinInfo.cs` file should look like this:

``` csharp
using System;
using Mono.Addins;
using Mono.Addins.Description;

[assembly:Addin (
    "DateInserter",
    Namespace = "DateInserter",
    Version = "1.0"
)]

[assembly:AddinName ("DateInserter")]
[assembly:AddinCategory ("DateInserter")]
[assembly:AddinDescription ("DateInserter")]
[assembly:AddinAuthor ("Michael Hutchinson")]

[assembly:AddinDependency ("::MonoDevelop.Core", MonoDevelop.BuildInfo.Version)]
[assembly:AddinDependency ("::MonoDevelop.Ide", MonoDevelop.BuildInfo.Version)]
```

The combined namespace and ID should be unique among all MonoDevelop addins. The other attributes are self-explanatory, and many of them are optional, particularly if the addin does not define extension points, but it is good practice to fill them all out.

Addins must declare dependencies on the addins with the extension points they use. In this case, we have a dependency on the `MonoDevelop.Ide` and `MonoDevelop.Core` addins, which contain many of the IDE's core extension points and APIs. By using a constant for the version string, we automatically ensure that the dependencies' versions match the targeted MonoDevelop version.

Note that the addin engine considers dependencies' full names to be relative to the addin's own namespace. If we had referenced the dependency as "MonoDevelop.Ide", the addin engine would have tried to find an addin called "DateInserter.MonoDevelop.Ide", and failed. To prevent this, we used the "::" qualifier to make it a global reference.

The empty `Manifest.addin.xml` file should look like this:

``` xml
<?xml version="1.0" encoding="UTF-8"?>
<ExtensionModel>
    <Runtime>
    </Runtime>
</ExtensionModel>
```

Some extension points accept resources as arguments, so these can be embedded into the assembly too, and hence many addins consist of a single assembly. However, if the addin requires additional files or assemblies, these should be referenced in the *Runtime* element, so that the addin engine can ensure that they exist, and can package all of the addin's files into an *mpack* file for distribution. This addin requires no extra files, so we can ignore or omit this element.

In this tutorial we will use a few core extension points and APIs, but there are many more. The core addins and their extension points and APIs are described in the [API Overview](/developers/articles/api-overview/) document, though it is not reliably kept up to date. There is also a [MonkeySpace 2013 video](http://vimeo.com/album/2481016/video/84367095) with a high-level overview of core APIs.

Adding Extensions
-----------------

Now that the addin is defined, we can add some extensions.

Each extension point has a unique *path*, so the extension is contained in and *Extension* element with a *path* attribute. This element may contain multiple extension nodes to plug into the extension point. The nodes' names and attributes are defined by the extension point. Some extension nodes can have child nodes, and they then become extension points in their own right. For example, the */MonoDevelop/Ide/Commands* extension point accepts *Command* or *Category* nodes, and category nodes may contain commands or categories. Since MonoDevelop.Ide already has a category with the id "Edit" registered at the */MonoDevelop/Ide/Commands* extension point, we can add a command directly to the resulting */MonoDevelop/Ide/Commands/Edit* Extension point.

``` xml
<Extension path = "/MonoDevelop/Ide/Commands/Edit">
    <Command id = "DateInserter.DateInserterCommands.InsertDate"
             _label = "Insert Date"
             _description = "Insert the current date" />
</Extension>
```

This extension defines a command for the command system. The command ID should correspond to an enum value. The underscore prefixing the label and description attributes indicates that they're translatable using Gettext, but adding a Gettext translation catalog to the addin is beyond the scope of this introduction.

MonoDevelop's command system provides ways to control the availability, visibility and handling of commands depending on context. Commands can also be assigned a keyboard shortcut and an icon. For more details, read the guide to the [Command System](/developers/articles/the-command-system/). We will implement the command later in the walkthrough.

Commands can be bound to keyboard shortcuts and can be inserted into menus. We're going to insert this command into the main Edit menu with another extension.

``` xml
<Extension path = "/MonoDevelop/Ide/MainMenu/Edit">
    <CommandItem id="DateInserter.DateInserterCommands.InsertDate" />
</Extension>
```

The extension manifest is now complete. This is the whole file:

``` xml
<ExtensionModel>
    <Extension path = "/MonoDevelop/Ide/Commands/Edit">
        <Command id = "DateInserter.DateInserterCommands.InsertDate"
                 _label = "Insert Date"
                 _description = "Insert the current date" />
    </Extension>

    <Extension path = "/MonoDevelop/Ide/MainMenu/Edit">
        <CommandItem id="DateInserter.DateInserterCommands.InsertDate" />
    </Extension>
</ExtensionModel>
```

Implementing the Command
------------------------

The command is now registered, but it doesn't do anything. For that, we need a command handler.  The simplest way to use it is with a default handler, which is a class that implements MonoDevelop.Components.Commands.CommandHandler.

Add the following attribute to the **Command** element in the addin manifest:

``` xml
defaultHandler = "DateInserter.InsertDateHandler"
```

So the Command element now looks like this: 

``` xml
<Extension path = "/MonoDevelop/Ide/Commands/Edit">
<Command id = "DateInserter.DateInserterCommands.InsertDate"
         _label = "Insert Date"
         _description = "Insert the current date"
         defaultHandler = "DateInserter.InsertDateHandler"/>
</Extension>
```

The project already references the MonoDevelop.Ide addin. If you look at the project's references, you will see  references to MonoDevelop.Ide.dll and Mono.TextEditor.dll. The "assembly version" of these assemblies may be a little older than the actual addins - this is simply to enable newer MonoDevelop versions to load assemblies of addins that were built against older versions of MonoDevelop, if permitted by the addin manifest's dependencies. When you add more functionality to your addin, you may need to reference additional libraries such as MonoDevelop.Core.dll and gtk-sharp.dll.

Add a new class to the project with the name we assigned as the command's default handler. It doesn't need to be public.

``` csharp
using MonoDevelop.Components.Commands;

namespace DateInserter
{
    class InsertDateHandler : CommandHandler
    {
        protected override void Run ()
        {
        }

        protected override void Update (CommandInfo info)
        {
        }
    }
}
```

We also need to define the enum for the command ID.

``` csharp
namespace DateInserter
{
    public enum DateInserterCommands
    {
        InsertDate,
    }
}
```

Now build and run the addin, and you will see the new command in the edit menu.

The command still doesn't do anything, as the command handler is a stub. First, we want to make sure that the command is only enabled when the active document is an editable text document.

Many important services can be accessed via the MonoDevelop.Ide.Gui.IdeApp static class. The workbench represents the IDE window, including the Documents, which may contain multiple views. We query the active document to see whether any of the views offer the TextEditor instance.

First, import the namespaces:

``` csharp
using MonoDevelop.Editor;
using MonoDevelop.Ide;
using MonoDevelop.Ide.Gui;
using MonoDevelop.Ide.Gui.Content;
using Mono.TextEditor;
```

Then alter the command handler's Update method. This method is queried whenever a command is shown in a menu or executed via keybindings. By changing the info object, you can disable the command or make it invisible, populate array commands, update the state of check or radio commands, and many other things. We are just going to disable it if we can't find an Editor in the active document.

``` csharp
protected override void Update (CommandInfo info)
{
    MonoDevelop.Ide.Gui.Document doc = IdeApp.Workbench.ActiveDocument;
    info.Enabled = doc != null && doc.Editor != null;
}
```

Now we can implement the command's Run method, which, unsurprisingly, is called when the command is run.

``` csharp
protected override void Run ()
{
    MonoDevelop.Ide.Gui.Document doc = IdeApp.Workbench.ActiveDocument;
    string date = DateTime.Now.ToString ();
    doc.Editor.InsertAtCaret (date);
}
```

This uses the Editor directly - we know it's not null, since the Run method could not be called unless our Update method had enabled the command. It simply inserts the current date at the cursor position using one of the convenience methods of the text editor.

Wrapping Up
-----------

It's done! Rebuild the project, and the command should now insert the date, as expected.

Now that you've built your first addin, try adding more features to it. For example, if the text editor has a selection, the addin could use that as a format string for the date. The reference version of the project that's attached to this document implements this feature.<br/>
 When you're ready to try more adventurous addin development, there are more [articles](/developers/articles/) that describe more advanced addin development, and a lot of the API is readily discoverable via code completion, once you know the general areas to look. If you can't work out how best to do something, take a look at an existing addin that does something similar, or email your question to the monodevelop-devel mailing list.
