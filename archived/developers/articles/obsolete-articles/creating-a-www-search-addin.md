---
title: Creating a WWW search AddIn
redirect_from:
  - /Developers/Articles/Obsolete_Articles/Creating_a_WWW_search_AddIn/
  - /Creating_a_WWW_search_AddIn/
  - /Articles/Creating_a_WWW_search_AddIn/
  - /Developers/Articles/Creating_a_WWW_search_AddIn/
  - /Developers/Obsolete_Articles/Creating_a_WWW_search_AddIn/
---

[Original version with all images and links](http://projectgo.com/monodevelop/AddInWalkthrough.html "http://projectgo.com/monodevelop/AddInWalkthrough.html")

### Goal

The goal of this project is to create a AddIn which search for a selected term on the web by opening a web-view in MonoDevelop and exploring the MonoDevelop AddIn system while doing so.

### General Description

MonoDevelop (and SharpDevelop) has a powerful AddIn system, which makes it easy to add new functionality without having to edit the source code. It is even possible to distribute these extensions independently of the main editor.

A simple AddIn consist of two files, one ".addin.xml" and a library".dll".

This tutorial requires mono and MonoDevelop installed.

### Step I: Quick start, Creating a Sample AddIn

First we create a file called SampleAddIn.addin.xml where we describe how we want to integrate the addin with MonoDevelop, for instance using gedit:

``` bash
gedit SampleAddIn.addin.xml
```

Content of this file could look like this :

    <AddIn     id         = "MonoDevelop.SampleAddIn"
           name        = "MonoDevelop SampleAddIn"
               author      = "Hemant Kumar"
           copyright   = "GPL"
           url         = "http://salmonsalvo.net/"
           description = "Welcome Page for MonoDevelop"
           category    = "IDE extensions"
               version     = "0.1.2">

        <Runtime>
            <Import assembly="SampleAddIn.dll"/>
        </Runtime>

        <Extension path = "/SharpDevelop/Commands">
            <Command id = "MonoDevelop.SampleAddIn.SampleAddInCommands.SayHello"
                defaultHandler = "MonoDevelop.SampleAddIn.SampleAddInCommandsHandler"
                _label = "Hello"/>
        </Extension>

        <Extension path="/SharpDevelop/Workbench/MainMenu/Help">
            <CommandItem id="MonoDevelop.SampleAddIn.SampleAddInCommands.SayHello"
                insertafter="ViewItemsSeparator1"
                insertbefore="Web" />
        </Extension>
    </AddIn>

Feel free to edit this file as you like.

Then we create another file with the source code SampleAddIn.cs

    using System;
    using MonoDevelop.Core;
    using MonoDevelop.Components.Commands;

    using MonoDevelop.Ide.Gui;

    namespace MonoDevelop.SampleAddIn
    {
        public enum SampleAddInCommands
        {
            SayHello
        }

        public class SampleAddInCommandsHandler: CommandHandler
        {
            protected override void Run()
            {
                Console.WriteLine("Hello world\n");
            }
        }
    }

The result of these two files combined is that the function Run() will be called when the user choose the "Hello World" command in the Help menu. Now we only need to compile the helloworld.cs file into a mono library:

    $ mcs -r:/usr/local/lib/monodevelop/bin/MonoDevelop.Components.dll -target:library SampleAddIn.cs
    Compilation succeeded

where /usr/local/lib/monodevelop/bin is the path where monodevelop store its libraries.

Now we have a file called helloworld.dll and a file called helloworld.addin.xml, these are easy to install by copying them to the MonoDevelop AddIns directory:

    $ su
    # cp SampleAddIn.addin.xml /usr/local/lib/monodevelop/AddIns/
    # cp SampleAddIn.dll /usr/local/lib/monodevelop/AddIns/

or for the rpm version, where the monodevelop library path is /usr/lib/monodevelop/AddIns/ :

$ su

1.  cp SampleAddIn.addin.xml /usr/lib/monodevelop/AddIns/
2.  cp SampleAddIn.dll /usr/lib/monodevelop/AddIns/

 Then we start monodevelop from the console:

    $ monodevelop
    Creating DefaultWorkbench

Hello World menu item After we select Help-\>Hello - we see that "Hello World" is written to the console: <http://projectgo.com/monodevelop/helloworld.png>

    $ monodevelop
    Creating DefaultWorkbench
    Hello World

Congratulations, you have made your first MonoDevelop AddIn. Let us look closer at how the AddIns process work.

First monodevelop read the file SampleAddIn.addin.xml It parses the file since it is in the AddIns directory and has filename ending with .addin.xml.

The Runtime tag in the addin.xml says we want MonoDevelop to import a mono library called SampleAddIn.dll

       <Runtime>
            <Import assembly="SampleAddIn.dll"/>
        </Runtime>

The Extension tag says we want to extend /SharpDevelop/Workbench/MainMenu/Help - which is the Help menu in MonoDevelop, with a MenuItem referencing a class we call MonoDevelop.Commands.MyHelloWorldCommand.

The function Run() in the class MonoDevelop.Commands.M is called every time "Hello World" in the Help menu is chosen. This functions write the words "Hello World" to the console.

### Step II: Create a AddIn-project in MonoDevelop

One of the points of having an IDE (Integrated Development Environment) like MonoDevelop is to be able to develop applications using it. It would be nice to be able to use MonoDevelop to develop AddIns for MonoDevelop. Since MonoDevelop does not have a AddIn project template project, we must create this all by ourselves.

[http://projectgo.com/monodevelop/cre...typroject2.png](http://projectgo.com/monodevelop/createemptyproject2.png "http://projectgo.com/monodevelop/createemptyproject2.png")

Let us create our search AddIn as a project in MonoDevelop. First we start monodevelop and chose File-\>New Solution/Project (Ctrl+Shift+N), the project type C# -\> "C# Library" suits our needs best. Let us call the project for MySearchAddIn. MonoDevelop will then automatically creates a file MyClass.cs with a class called MyClass - for simplicity we might just delete the content of this file and replace it with the content of helloworld.cs, then change the name of the class from MyHelloWorldCommand to MySearchEngineAddIn.

Now we have a file called MyClass.cs with this content:

    using MonoDevelop.Core.AddIns.Codons;

    namespace MonoDevelop.Commands
    {
        public class MySearchEngineAddIn : AbstractMenuCommand
        {
            public override void Run()
            {
                System.Console.WriteLine("Hello World");
            }
        }
    }

If you try to compile it (F8) you will get the error: Cannot find type 'AbstractMenuCommand'(CS0246) We get this error because we haven't added the library with AbstractMenuCommand - this library happens to be .dll. You add it to the project by right clicking references and choose Edit References <http://projectgo.com/monodevelop/editreferences.png>.

<http://projectgo.com/monodevelop/searchaddin.png>

After choosing the tab ".Net Assembly" we get the screen:

[http://projectgo.com/monodevelop/add...t\_assembly.png](http://projectgo.com/monodevelop/addreferences_net_assembly.png "http://projectgo.com/monodevelop/addreferences_net_assembly.png")

Chose Browse and locate the MonoDevelop.Base.dll, located in /usr/local/lib/monodevelop/bin/ (or /usr/lib/monodevelop/bin/ for the rpm version). Press F8 to compile and if you are successful you will see:

    Build: 1 succeeded, 0 failed

The resulting mono library ( .net assembly ) file, MySearchAddIn.dll, is located in the bin/Debug directory below the project directory (default: ~/MonoDevelopProjects/MySearchAddIn/bin/Debug ).

Then we create a addin.xml file to go with it, File-\>New File... (Ctrl+N), you may use Misc -\> Empty XML File. Save it, File-\>Save (Ctrl+S), as mysearch.addin.xml. The file should look something like this:

    <AddIn name      = "MonoDevelop MySearch AddIn"
           author    = "Oyvind Neuman"
           copyright = "GPL"
           url       = "http://projectgo.com"
           description = "An example search addin"
           version   = "0.1">

        <Runtime>
            <Import assembly="MySearchAddIn.dll"/>
        </Runtime>
        <Extension path="/SharpDevelop/Workbench/MainMenu/Help">
        <MenuItem
            id = "MyWebSearch"
            insertafter="Separator2"
            insertbefore="Web"
            _label = "Search Google"
            description="Search google with selected text"
            class="MonoDevelop.Commands.MySearchEngineAddIn"
        />
        </Extension>
    </AddIn>

You have now compiled and completed your first MonoDevelop AddIn using MonoDevelop, now we may install it - by copying it to the monodevelop lib directory (or see permanent solution):

    $ su
    # cd [your project dir]
    # cp mysearch.addin.xml /usr/local/lib/monodevelop/AddIns/
    # cp bin/Debug/MySearchAddIn.dll /usr/local/lib/monodevelop/AddIns/

For the rpm version

    # cp mysearch.addin.xml /usr/lib/monodevelop/AddIns/
    # cp bin/Debug/MySearchAddIn.dll /usr/lib/monodevelop/AddIns/
    <pre>

    Test it by starting another instance of MonoDevelop:
    <pre>
    $ monodevelop

Now you should have another menu item in the Help menu: <http://projectgo.com/monodevelop/searchgoogle.png> It still doesn't do anything more than writing Hello World to the console, now we make it a little more interesting:

### Step III: Modifying the AddIn to open a web-search

Now we finally gotten through all the technical problems with compiling and installing an AddIn. The next step is to make it do something useful. First we need to add references to some of the MonoDevelop mono libraries. Specifically we need:

MonoDevelop.Base.dll (already included in Step II)<br/>
MonoDevelop.Core.dll<br/>
MonoDevelop.Gui.Widget.dll<br/>
MonoDevelop.SourceEditor.dll

It doesn't hurt much to include more of the .dll files in the monodevelop/bin directory, remember that auto completion do not work before you have added a reference to the library (.net assembly). We also need a reference to System.Web which we find in the tab Global Assembly Cache after choosing add references. If you do not remember the process of adding references feel free to refresh you memory.

After adding these references, you should be able to compile this code:

    using MonoDevelop.Core.AddIns.Codons;
    using MonoDevelop.SourceEditor.Gui;
    using MonoDevelop.Gui;
    using MonoDevelop.Services;


    namespace MonoDevelop.Commands
    {
        public class MySearchEngineAddIn : AbstractMenuCommand
        {
            public override void Run()
            {
                // Get active window:
                IWorkbenchWindow window = MonoDevelop.Gui.WorkbenchSingleton.Workbench.ActiveWorkbenchWindow;

                // Check if it is a sourceeditor:
                if (window != null && window.ViewContent is SourceEditorDisplayBindingWrapper)
                {
                    // Get access to the editor control
                    SourceEditor editor = (SourceEditor) ((SourceEditorDisplayBindingWrapper)window.ViewContent).Control;
                    string selectedText = editor.Buffer.GetSelectedText();

                    if (selectedText != null && selectedText.Length > 0)
                    {
                        // Create a search url string with the selected text as query:
                        string search_url = "http://www.google.com/search?q="
                            +System.Web.HttpUtility.UrlEncode(selectedText)
                            +"&start=0&start=0&ie=utf-8&oe=utf-8";

                        // Open the file using a file service
                        IFileService fileService = (IFileService)MonoDevelop.Core.Services.ServiceManager.GetService(typeof(IFileService));
                        fileService.OpenFile(search_url);
                    }

                } // (if window != null)
            } // Run()
        }
    }

The code was pieced together by looking at some of the AddIns in the MonoDevelop source, mostly

MonoDevelop/Core/src/AddIns/prj2make-sharp-lib<br/>
MonoDevelop/Core/src/AddIns/DisplayBindings/SourceEditor/Commands/SearchCommands.cs

but also the rest of the source code of MonoDevelop. The auto completion functionality in MonoDevelop is also invaluable - if auto completion do not work for your references try to restart monodevelop. Compile it with F8 and install it by copying if you do not use the symlink trick. Now the Help-\>Search Google command should open the google search engine with the selected text as the query. If you have not selected anything - nothing will happen.

Now it is time to use your creativity to write some real useful plugins for MonoDevelop.

Please contact me at <tutorial@agurk.com> if you have any comments or suggestions,

Øyvind Neuman

### Appendix I: How to find MonoDevelop path

First we find were monodevelop store the AddIns:

    $ locate monodevelop/AddIns | grep AddIns$
    /usr/local/lib/monodevelop/AddIns
    /usr/local/lib/monodevelop/AddIns/AddIns
    /usr/local/lib/monodevelop/AddIns/AddIns
    /usr/local/lib/monodevelop/AddIns

So now we may assume the path to monodevelop libraries is /usr/local/lib/monodevelop/.

### Appendix II: How to not need to install the AddIn manually between each compile

Instead of installing the AddIn by copying it you may create a symlink:

    $ su
    # cd [your project dir]
    # ln -s $PWD/mysearch.addin.xml /usr/local/lib/monodevelop/AddIns/
    # ln -s $PWD/bin/Debug/MySearchAddIn.dll /usr/local/lib/monodevelop/AddIns/

For the rpm version

    # ln -s $PWD/mysearch.addin.xml /usr/lib/monodevelop/AddIns/
    # ln -s $PWD/bin/Debug/MySearchAddIn.dll /usr/lib/monodevelop/AddIns/

Remember to remove the previous mysearch.addin.xml and MySearchAddIn.dll from the destination directories (if you already have created them with the cp command).


