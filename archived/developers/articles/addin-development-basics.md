---
title: Addin development basics
redirect_from:
  - /Developers/Articles/Addin_development_basics/
---

<span style="color:#ff0000;">**For a more up to date guide, see** </span>**[<span style="color:#ff0000;">Creating a Simple Add-In</span>](/developers/articles/creating-a-simple-add-in/)**

This walkthrough will get you through the basic steps to get started developing addins for MonoDevelop. This is kept as short as possible and will only cover a very basic example.

Introduction
------------

Like all major integrated development environments (IDEs) the functionality of MonoDevelop can be extended. In MonoDevelop this is done with addins. Actually most of MonoDevelops built in functionalities are actually just addins. For instance the welcome screen, version control and C# support are addins.

There are many reasons to extend an IDE and they can range from general purpose expansions to domain specific features. Since MonoDevelop is still a young IDE there are a lot of potential improvements you could do. In this example we will add an item to the tools menu that creates a dialog with the text "Hello World!".

Basic overview
--------------

In addin development for MonoDevelop there is two basic building blocks. The addin xml definition and the code running the addin functionality. Technically speaking an addin can be made by just having the xml and no code, but it would not add any features.

The xml file contains some basic meta informations such as the author, copyright and so forth. It also tells MonoDevelop what parts you want to extend, eg. if you want to create a new menuitem in the edit menu, this is the place to do it.

The code should be very self explanatory to any C# developer, where you just need to dive into the different APIs.

\*.addin.xml and the commands enum
----------------------------------

To get things started create a new C# Library in MonoDevelop. It is important that the root namespace is <span style="color: rgb(51, 102, 255); ">MonoDevelop</span>, since the addin framework calculates its dependencies recursively. For instance you could name this example <span style="color: rgb(51, 102, 255); ">MonoDevelop.HelloWorld</span>*.*

Now create a new xml-file in the root of your project and name it after this syntax "*{Your project name}.addin.xml*", so if your project is named<span style="color: rgb(51, 102, 255); "> MonoDevelop.HelloWorld</span> then the file name would be "*MonoDevelop.HelloWorld.addin.xml*". Technically the file can be named anything as long as it has the "*.addin.xml"* in the end, but the most common thing is to use the project name. This will also make the file easy for you and others to find.

Now make sure that the addin.xml is embedded as a resource. The fastest way to do this is to right click the file, go down to Build Action and select Embed as resource (you can also use the properties pad).

The simplest addin definition will contain something like this:

``` xml
<Addin  id             = "HelloWorld"
        namespace      = "MonoDevelop"
        name           = "Simple hello world"
        author         = "Rohde Fischer"
        copyright      = "MIT X11"
        description    = "Says Hello world to the nice user"
        category       = "Rohde's example"
        version        = "1.0">
</Addin>
```

You can now try and build the addin and then copy the output dll to *~/.config/MonoDevelop/addins,* if the *addins* folder does not exist create it. Restart MonoDevelop. You should be able to find your new addin in the addin manager (Tools -\> Addin Manager).

Before we add our features we want to tell the addin framework what addins we want to depend on. Basically this is what sub-namespaces to the <span style="color: rgb(51, 102, 255); ">MonoDevelop</span> namespace we want to use. So for instance if we want to use <span style="color: rgb(51, 102, 255); ">MonoDevelop.Core</span>, we have a dependency on <span style="color: rgb(51, 102, 255); ">Core<span style="color: rgb(0, 0, 0); "> </span></span>(here it is made clear that addin dependencies are calculated recursively).

In your addin.xml add these two dependencies:

``` xml
<Dependencies>
    <Addin id="Ide" version="2.4" />
    <Addin id="Core" version="2.4" />
</Dependencies>
```

When you want to add a menu item you need to have a corresponding command. For each command you need an entry in an enum identifying it. In most addins this enum is called **Commands**. My *Commands.cs* for this example looks like this:

``` csharp
using System;
namespace MonoDevelop.HelloWorld
{
    public enum Commands
    {
        SayHello,
    }
}
```

Now we have to add our command in the addin.xml. To do this you have to extend "<span style="color: rgb(128, 0, 128); ">/MonoDevelop/Ide/Commands</span>". In your addin.xml add the following:

``` xml
<Extension path="/MonoDevelop/Ide/Commands">
    <Command id="MonoDevelop.HelloWorld.Commands.SayHello"
             _label="Say Hello" />
</Extension>
```

The id in the command have to contain the complete path to your commands enum. \_label is the text to show when the command is shown. To place the new command in the tools menu we will extend "<span style="color: rgb(128, 0, 128); ">/MonoDevelop/Ide/MainMenu/Tools</span>" like this:

``` xml
<Extension path="/MonoDevelop/Ide/MainMenu/Tools">
    <CommandItem id="MonoDevelop.HelloWorld.Commands.SayHello" />
</Extension>
```

The **<span style="color: rgb(51, 102, 255); ">CommandItem</span>** id and the <span style="color: rgb(51, 102, 255); ">**Command**</span> id has to be the same, so the addin framework is able to link these two together. If you build the project, copy the dll to the addins folder and restart MonoDevelop you should now be able to see the new command in the tools menu.

Implementing the event
----------------------

Before we do the actual implementation of the event we have to make sure that you have the references needed to do this. For the hello world example you need the following packages: MonoDevelop.Core, MonoDevelop.Ide and gtk-sharp.

Implementing the event is very easy. In the essence what you do is: create a subclass of CommandHandler and override the Run and Update methods. Update is executed every time the command is shown, this is where you set if the command is enabled or even visible. Run is executed when a user activates the command.

When overriding Update make sure to override the one that takes the CommandInfo parameter. For this example the command will always be enabled, so you can just write <span style="color: rgb(128, 0, 0); ">info.Enabled = true;</span> in the method. In the Run method we are going to create an Gtk# dialog that says "Hello World!". I will not cover the Gtk#-code (for that you can read the [Gtk#-tutorial](http://zetcode.com/tutorials/gtksharptutorial/)). The example looks like this:

``` csharp
using System;
using MonoDevelop.Components.Commands;
using Gtk;
using MonoDevelop.Ide;

namespace MonoDevelop.HelloWorld
{
    public class SayHelloHandler : CommandHandler
    {
        protected override void Run ()
        {
            base.Run ();
            var parentWindow = IdeApp.Workbench.RootWindow;
            MessageDialog dialog = new MessageDialog(parentWindow, DialogFlags.DestroyWithParent,
                                      MessageType.Info, ButtonsType.Ok,
                                      "Hello World!");
            dialog.Run ();
            dialog.Destroy ();
        }

        protected override void Update (CommandInfo info)
        {
            base.Update (info);
            info.Enabled = true;
        }
    }
}
```

The interesting part of the code is the class IdeApp, which is used to access the active instance of MonoDevelop. From this class you can access all sorts of interesting features such as the workspace, the services and the workbench.

Here we access the workbench, which can be seen as the IDE itself. From the workbench you got access to things like the active pads, the statusbar and of course as in our example the root window. We use this to tell Gtk# that it should use MonoDevelop as the parent window.

The last step is to make the command aware of the handler. This is done by adding the defaultHandler attribute to the command. In the addin.xml my command  ends up looking like this:

``` xml
<Command id="MonoDevelop.HelloWorld.Commands.SayHello"
    _label="Say Hello"
    defaultHandler="MonoDevelop.HelloWorld.SayHelloHandler" />
```

Now you can build the project and copy the dll to the addin directory, restart MonoDevelop and see your first addin work. If you have trouble you can try to download the MonoDevelop solution for this guide.

Where to go from here
---------------------

There is a limited amount of documentation for addin development at the moment. The best option at the moment is to [download the source](/download/) for MonoDevelop and read the source for the addins there. You could also read the [existing documentation](/developers/articles/), unfortunately the current documentation uses deprecated code.
