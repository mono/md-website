---
title: Writing an Add-In (Obsolete)
redirect_from:
  - /Developers/Articles/Obsolete_Articles/Writing_an_Add-In_(Obsolete)/
  - /Writing_an_Add-In_(Obsolete)/
  - /Developers/Obsolete_Articles/Writing_an_Add-In_(Obsolete)/
---

**Note: This page is out of date and the instructions do not work with any recent version of MonoDevelop.**

**For an up to date guide, see [Creating a Simple Add-In](/developers/articles/creating-a-simple-add-in/)**

### Introduction

MonoDevelop (and SharpDevelop) have been written so that they can be easily extended by others. This can be accomplished by doing two simple things. First, by creating an assembly (`.dll`) containing the code for your add-in. Second, providing an `.addin` XML file that maps your code into MonoDevelop. There is a detailed PDF available at SharpDevelop's website [here](http://www.icsharpcode.net/TechNotes/ProgramArchitecture.pdf) that you will want to read for a full understanding of the entire system and possiblities. The SharpDevelop book has information on this as well. This is intended as a simple and quick overview.

### Terms

|----------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| **add-in**           | What many other systems refer to as a plugin. In this case the whole application is also a plugin.                                       |
| **pad**              | Content area like the project browser or output pad.                                                                                     |
| **view**             | Main content area, like the SourceEditor.                                                                                                |
| **language binding** | Compilation, execution, and project management for a programming language.                                                               |
| **service**          | Reponsible for one part of the program, for example the MessageService is delegated the reponsiblity of displaying messages to the user. |

### Add-in assembly

In your code you can extend the IDE at pretty much any point. Some common things would be to extend the menus, pads, views, services, commands, etc. I recommend looking at `src/AddIns/` for a few examples. In most cases you will simply inherit from an abstract class or implement an interface for the various parts you are extending. For example, a new service could be defined as:

     using System;
     using MonoDevelop.Core.Services;

     namespace MonoDevelop.Services;
     {
         public class ExampleService : AbstractService
         {
             // Do stuff here
         }
     }

Here is a list of some of the common classes to extend for an add-in:

-   `./src/Main/Base/Gui/Dialogs/AbstractOptionPanel.cs`
-   `./src/Main/Base/Gui/Dialogs/Wizard/AbstractWizardPanel.cs`
-   `./src/Main/Base/Gui/Pads/ClassScout/BrowserNode/AbstractClassScoutNode.cs`
-   `./src/Main/Base/Gui/Pads/ProjectBrowser/BrowserNode/AbstractBrowserNode.cs`
-   `./src/Main/Base/Gui/AbstractBaseViewContent.cs`
-   `./src/Main/Base/Gui/AbstractPadContent.cs`
-   `./src/Main/Base/Gui/AbstractViewContent.cs`
-   `./src/Main/Base/Gui/AbstractSecondaryViewContent.cs`

### .addin.xml file

|---------------------------------------------------------------------------------------------------------------------------------|
| **Note:** MonoDevelop had to change the extension to `.addin.xml` to use `gettext` in translations. SharpDevelop uses `.addin`. |

The `.addin.xml` file basically maps the "entry" points of your code into the various parts of the IDE. You specify services to load, append menus in a certain place, and virtually everything else.

Since the entire application is an add-in there is no limit. It supports conditional directives and other advanced constructs. In the following sample `MonoDevelopNunit.addin.xml` file, you can see it specifies the name of the assembly to load, specifies a service to load into the `/Workspace/Services` node, two views and some menus. Lastly, it is important to note the class attribute that is used to specify the type to instantiate for that part of the add-in.

     <AddIn name        = "MonoDevelop Nunit"
            author      = "John Luke"
            copyright   = "GPL"
            url         = "https://www.monodevelop.com"
            description = "NUnit testing tool"
            version     = "0.2">

         <Runtime>
             <Import assembly="MonoDevelop.Nunit.dll" />
         </Runtime>

         <Extension path="/Workspace/Services">
             <Class id    = "NunitService"
                    class = "MonoDevelop.Services.NunitService" />
         </Extension>

         <Extension path="/SharpDevelop/Workbench/Views">
             <Class id    = "NunitTestTree"
                    class = "MonoDevelop.Nunit.Gui.TestTree" />
             <Class id    = "NunitResultTree"
                    class = "MonoDevelop.Nunit.Gui.ResultTree" />
         </Extension>

         <Extension path="/SharpDevelop/Workbench/MainMenu/Tools">
             <MenuItem id           = "NunitMenu"
                       _label       = "NUnit"
                       insertafter  = "ExternalTools"
                       insertbefore = "Options">
                 <MenuItem id       = "LoadTestAssembly"
                           _label   = "Load Assembly"
                           shortcut = ""
                           class    = "MonoDevelop.Commands.NunitLoadAssembly" />

                 <MenuItem id       = "NunitRunTests"
                           _label   = "Run Tests"
                           shortcut = ""
                           class    = "MonoDevelop.Commands.NunitRunTests" />
             </MenuItem>
         </Extension>
     </AddIn>

### Add-in tree

The various add-ins are loaded and merged into an `AddInTree`, which is how the IDE knows what and where to load. Look at `build/AddIns/SharpDevelopCore.addin.xml` to see the various places to attach your add-in, such as the menu items.

### Add-in XML format

There is an `AddIn.xsd` file that specifies the required/optional XML format. Perhaps someone would like to make a RelaxNG one also. See `data/resources/AddIn.xsd`

### Building and installing

We currently support both running in a self-contained `build/` directory as well as installing to `$(prefix)/lib/monodevelop` so you will want to make sure both your `.addin.xml` and `.dll` files are placed into the `AddIn` directory in both places (this this may change at some point in the future).

For those not familiar with autoconf/automake here is a brief description of what you need to do, if you are wanting to add your add-in to the current build process. This will not be required when we are self-hosting. Have a `Makefile.am` that compiles and installs your `.dll` and `.addin.xml` files. I highly recommend you copy one of the existing ones as a reference. Add `path/to/your/add-in/Makefile` to the `AC_OUTPUT` section of `configure.in`. This creates the `Makefile` from `Makefile.am`. In the parent directory of your add-in add your directory to the `SUBDIRS` variable. If you are especially prudent you can make sure `make distcheck` from the top directory still works.

### Existing add-ins

1.  SourceEditor
2.  CSharpBinding
3.  JavaBinding
4.  NemerleBinding
5.  DebuggerAddin
6.  Monodoc
7.  StartPage (not fully ported)
8.  NUnit (incomplete)

### Caveats

Although SharpDevelop and MonoDevelop currently use the same format this may not always be the case. Also, while non-GUI add-ins could possibly be reused, MonoDevelop and SharpDevelop use different GUI toolkits that will likely prevent sharing many things. Any suggestions on making sharing things as easy as possible would be appreciated.

### Internationalization

Since we are using `gettext` and not resources, you will want to read the [translation guide](/developers/articles/translations/) as that is handled in a different way than SharpDevelop and deserves its own explanation.

### Add-in ideas

There are various things that would be nice to have implemented as add-ins. Here is a brief list of the top of my head:

1.  A viewer for the Mono profiler (`mono --profile`) and Mono coverage tools
2.  Extra languages/compilers support
3.  NUnit and NAnt integration tools
4.  Glade (although a new GUI designer is planned)
5.  Integration with Subversion, CVS, and other version control tools
6.  UML/CASE tools
7.  SQL/database support
8.  An advanced XML editor
9.  Also, there are some additional things that SharpDevelop already has that could be ported to MonoDevelop

### Credits, License, and Errata

Send comments to [jluke](mailto:jluke@cfl.rr.com) or the [MonoDevelop mailing list](mailto:monodevelop-list@lists.ximian.com)

Licensed under the [MIT License](http://opensource.org/licenses/mit-license.php)
