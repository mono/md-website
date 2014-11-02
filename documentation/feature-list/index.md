---
title: Feature List
redirect_from:
  - /Documentation/Feature_List/
  - /Feature_List/
---

The following matrix shows which features are available for each platform. MonoDevelop features not shown in the list ara available for all platforms.

| **Feature**              | **Linux**                              | **Mac**                                 | **Windows**                             |
|--------------------------|----------------------------------------|-----------------------------------------|-----------------------------------------|
| C#                       | <span style="color: green;">Yes</span> | <span style="color: green;">Yes</span>  | <span style="color: green;">Yes</span>  |
| Visual Basic             | <span style="color: green;">Yes</span> | <span style="color: green;">Yes</span>  | <span style="color: green;">Yes</span>  |
| Java (IKVM)              | <span style="color: green;">Yes</span> | <span style="color: red;">No</span>     | <span style="color: red;">No</span>     |
| Boo                      | <span style="color: green;">Yes</span> | <span style="color: red;">No</span>     | <span style="color: red;">No</span>     |
| C/C++                    | <span style="color: green;">Yes</span> | <span style="color: green;">Yes</span>  | <span style="color: red;">No</span>     |
| Python                   | <span style="color: green;">Yes</span> | <span style="color: red;">No</span>     | <span style="color: red;">No</span>     |
| Vala                     | <span style="color: green;">Yes</span> | <span style="color: red;">No</span>     | <span style="color: red;">No</span>     |
| ASP.NET Project          | <span style="color: green;">Yes</span> | <span style="color: green;">Yes</span>  | <span style="color: green;">Yes</span>  |
| ASP.NET MVC Project      | <span style="color: green;">Yes</span> | <span style="color: green;">Yes</span>  | <span style="color: green;">Yes</span>  |
| Translation Project      | <span style="color: green;">Yes</span> | <span style="color: green;">Yes</span>  | <span style="color: red;">No</span>     |
| iPhone Project           | <span style="color: red;">No</span>    | <span style="color: green;">Yes</span>  | <span style="color: red;">No</span>     |
| Moonlight Project        | <span style="color: green;">Yes</span> | <span style="color: green;">Yes</span>  | <span style="color: green;">Yes</span>  |
| Gtk# designer            | <span style="color: green;">Yes</span> | <span style="color: green; ">Yes</span> | <span style="color: green;">Yes</span>  |
| Generation of Makefiles  | <span style="color: green;">Yes</span> | <span style="color: green;">Yes</span>  | <span style="color: red;">No</span>     |
| Generation of Tarballs   | <span style="color: green;">Yes</span> | <span style="color: green;">Yes</span>  | <span style="color: red;">No</span>     |
| Makefile Synchronization | <span style="color: green;">Yes</span> | <span style="color: green;">Yes</span>  | <span style="color: red;">No</span>     |
| Database Explorer        | <span style="color: green;">Yes</span> | <span style="color: green;">Yes</span>  | <span style="color: red;">No</span>     |
| NUnit add-in             | <span style="color: green;">Yes</span> | <span style="color: green;">Yes</span>  | <span style="color: green;">Yes</span>  |
| Subversion add-in        | <span style="color: green;">Yes</span> | <span style="color: green;">Yes</span>  | <span style="color: green;">Yes</span>  |
| Help Browser (Monodoc)   | <span style="color: green;">Yes</span> | <span style="color: green;">Yes</span>  | <span style="color: green;">Yes</span>  |
| Debugging (managed)      | <span style="color: green;">Yes</span> | <span style="color: green;">Yes</span>  | <span style="color: green;">Yes</span>  |
| Debugging (C/C++)        | <span style="color: green;">Yes</span> | <span style="color: red;">No</span>     | <span style="color: red;">No</span>     |
| ASP.NET Debugging        | <span style="color: green;">Yes</span> | <span style="color: green;">Yes</span>  | <span style="color: green;">Yes </span> |

IDE Workbench
-------------

#### Solution Pad

-   Shows the file structure of the opened solution. Most of project operations can be done in this pad:
    -   Project building
    -   Management of project files and folders
    -   Version control
    -   Editing project references
    -   Running custom tools
-   Available display options: Show all files, show code-behind files.
-   To display the solution pad, click on the View/Solution menu option.

#### Class Pad

-   Shows namespaces, types and members defined in the solution.
-   Available display options: Nested namespaces, group by access/member type, show public members only.
-   To display the solution pad, click on the View/Classes menu option.

#### Files Pad

-   Allows browsing the file system.
-   Basic file and folder management commands.
-   To display the solution pad, click on the View/Files menu option.

#### Error List Pad

-   Supports message filtering by type.
-   The context menu provides direct access to error documentation.
-   To display the solution pad, click on the "View/Error List" menu option.

#### Task List Pad

-   Support for user defined tasks.
-   It shows tasks specified in source code using comment tags (FIXME, TODO, ...). Comment tags can be customized (Edit/Preferences/Task List).
-   To display the solution pad, click on the "View/Task List" menu option.

#### Build Output

-   Support for output window pinning (avoids overwriting of the output if the project is built again).

#### Application Output

-   Support for output window pinning (avoids overwriting of the output if the project is run again).

#### Message Log Pad

-   Log of internal MonoDevelop messages.

#### Welcome Page

-   Recents list.
-   Documentation links.
-   Create/Open project commands.

Customization
-------------

#### Layouts

-   Supports the definition of new layouts of workspace pads and toolbars (View/Layouts).
-   Quick layout switch using a selector in the toolbar.

#### External tools

-   The user can define custom tools to be shown in the Tools menu (Edit/Preferences/Tools/External Tools).
-   Support for project variables such as project directory, current file name, etc.
-   Prompt for arguments.

#### Configurable Key Bindings

-   Support for configurable key bindings (Edit/Preferences/Key bindings).
-   Emacs and Visual Studio key bindings schemes.
-   User defined key bindings.
-   Support for multi-state key bindings.

Project Management
------------------

#### Building

-   Support for 1.1, 2.0 and Moonlight Mono runtimes (Project/Options/General/Runtime Options).
-   Support for multiple build configurations.
-   Builds required project dependencies.
-   Clean and Rebuild commands.
-   Assembly signing.
-   Command line tool for building: 'mdtool build'.

#### Run

-   Option for running in internal or external console.

#### Export

-   Export a project to a different folder using a different file format:
    -   MonoDevelop native file format.
    -   Visual Studio 2005.
-   Command line tool for exporting projects: 'mdtool project-export'.

#### Custom commands

-   Custom commands can be defined for projects and solutions
-   Command hooks: after/before build, clean, execute
-   Command replacement: build, clean, execute
-   Custom commands: shown in the context menu of the solution pad.

#### Generic project

-   Project type not bound to any language.
-   Can be used together with Makefile Integation and Custom Commands.

Source Code Editing
-------------------

#### Find / Replace

-   Special search strategies: wildcards, regular expressions.
-   Search flags: case sensitive, whole word.
-   Search / Replace in files.
-   Support for search results list pinning (allows keeping several search results lists at once).

#### Code Completion

-   Code completion of namespaces, types and members.
-   'as' and 'new' completion.
-   Method parameter Completion.
-   C# compilation directives.

#### Source Code Tooltips

#### On-the-fly Error Underlining

#### Indent Strategies

-   Auto indent
-   Smart indent for C#

#### Standard Header

-   Allows adding a header to all new files.
-   Templates for common licences.

#### Code templates

-   Bind keywords to code templates.
-   Keywords can be expanded by pressing TAB in the text editor.
-   Different sets of templates can be assigned to different file extensions.

#### Refactory Operations

-   Rename class, field, method, property, event
-   Implement interface (explicit or implicit)
-   Implement overridable method, property, event

#### Source Code Navigation

-   Go to base class
-   Go to declaration of class or member
-   Find references to class or member
-   Find subclasses
-   Quick search of file or type
-   Quick navigation of build errors and search results using the Browse Next/Previous command.

#### Navigation History

-   History of source code location.
-   Easy navigation through the history.

Visual Design
-------------

#### Gtk# Designer

Integrated visual designer for building Gtk# interfaces.

-   Allows targeting Gtk# 2.4, 2.6 and 2.8.
-   Supports visual design of custom widgets.
-   Support for reusable widget libraries. Custom widgets are shown in the toolbox.
-   Dynamic reloading of custom widgets. After compiling a change in a custom widget, all design windows where the widget is being used will be automatically updated.
-   Widget library reference tracking. When new widgets are added to a design surface, the required assembly references will be added to the project.
-   Visual editing of stock icon factory.
-   Glade project import.

#### Toolbox

-   One single toolbox for all designers (Gtk#, ASP.NET, etc.)
-   New items can be added by registering new assemblies.
-   The toolbar is dynamically updated to show the items available for the active file and project.
-   Two display modes: normal and compact (with no labels).
-   Widget search

#### Property grid

-   One single property grid for all designers (Gtk#, ASP.NET, etc.)
-   Allows editing project file properties.

Packaging and Deployment
------------------------

#### Package Generation

-   Sources package: MD and Visual Studio formats (zip or tarball).
-   Binary package: Linux and Windows targets (zip or tarball).
-   Tarball based on Autotools
-   Tarball w/o Autotools (simple makefile with a basic configuration script and dependency checking).

#### Generation and deployment of support files

-   .pc file for libraries.
-   .desktop for applications.
-   launch script.

#### Packaging Operations

-   Packaging project: bundles together a set of packaging sources and targets.
-   Create package command: allows creating a package of any of the supported types.
-   Install command: installs a solution to the local file system.

Makefile Integration
--------------------

#### Generate makefiles for a solution

-   Two kinds of makefiles:
    -   based on Autotools
    -   w/o Autotools (simple makefile with a basic configuration script and dependency checking).
-   Command line tool for generating makefiles: mdtool generate-makefiles.

#### Makefile Synchronization

-   Allows synchronizing the list of files and references between a Makefile and a MonoDevelop project.
-   Support for dependencies defined in Autotools files.
-   Error and warning message parsing using regexes.

ASP.NET
-------

#### Web Projects

-   Create web application for any supported language.
-   Compile web application and view in browser using xsp.
-   Project GAC references are synchronised to web.config.
-   Add new ASP.NET files:
    -   Page (.aspx) with/without CodeBehind class (partial if language supports it).
    -   User control (.ascx) with/without CodeBehind class (partial if language supports it).
    -   Web Service (.asmx) with/without CodeBehind class.
    -   Web Handler (.ashx) with/without CodeBehind class.
    -   Web.config (application or subdirectory depending where it's added).
    -   Master page (.master) with/without CodeBehind class (partial if language supports it) for 2.0 runtime only.
    -   Global.asax file with/without CodeBehind class.
-   ASP.NET server controls added to aspx files have corresponding members automatically added to the CodeBehind class at compilation time (in the \*.designer.\* part if using partial classes).

#### Web References

-   Browse for a web service and create web service proxies.
-   Update web service proxies.

Translation Support
-------------------

-   Translation Project: allows defining the supported languages, and the projects and files to scan for translatable strings.
-   Update of .po file.
-   Generation of .mo files.
-   .po file editor.

Database Management
-------------------

-   Explore databases
-   Execute queries and display the results inside MonoDevelop
-   Create new databases
-   Create new tables, procedures and views
-   Alter procedures and views
-   Drop databases, tables, procedures and views
-   Rename databases, tables, procedures and views

Nunit
-----

#### NUnit Library Project

#### NUnit Test Project

#### Tests pad

-   Shows the list of tests defined in every project of the solution
-   Automatically updated when the solution is compiled.
-   Allows setting different configurations of filters based on categories
-   Navigation to source code of test cases.

#### History panel

-   Keeps an history of tests runs.
-   Graphical view of successul runs and failures.
-   Comparison of tests runs. List of regressions.
-   Performance chart.

#### Test results pad

-   Allows filtering for successful, failed and ignored tests.
-   Filtering of test output.

Visual Studio Integration
-------------------------

#### Native support for Visual Studio 2005 projects

-   The following project types can be opened and modified:
    -   C#
    -   Visual Basic .NET
    -   ASP.NET

#### Import VS 2003 project

-   Visual Studio 2003 projects can be imported and converted to the MonoDevelop or VS 2005 file formats.

Version Control
---------------

#### Subversion

-   Publish a project to a repository
-   Checkout a project from a repository
-   Add files or folders to version control
-   Remove files or folders from version control
-   Update, get changes from the repository
-   Log: visual display of changes done on a file or directory
-   Revert changes in a file or folder.
-   Status tracking: shows a list of all changes done in a folder, and allows entering a commit message for every change.
-   Commit changes: generates a consolided commit message from all documented changes.

#### ChangeLog integration

-   Generation of ChangeLog entries from commit messages.
-   Supports updating (or creating) multiple ChangeLog files in a single commit.
-   Allows defining commit policies for every project. Commit policies specify the location of ChangeLog files:
    -   One single ChangeLog at the root project directory.
    -   One ChangeLog per first-level subdirectory.
    -   One ChangeLog in every directory.
    -   User defined.

Documentation
-------------

-   Context sensitive help
-   Class documentation browser based on Monodoc

Add-in Management
-----------------

-   Installation of add-in from on-line repositories.
-   Enable/disable add-ins.
-   Command line tool for managing add-ins: 'mdtool setup' and 'mdtool gsetup'.
-   Based on Mono.Addins.

Project Templates
-----------------

#### For all languages supporting CodeDOM

-   Empty project
-   Library
-   Web application
-   Empty web application.
-   NUnit library

#### CSharp

-   Gtk# project.
-   Empty project
-   Library
-   Web application
-   Empty web application.
-   NUnit library

#### Visual Basic

-   Console project
-   Empty project
-   Library
-   Web application
-   Empty web application.
-   NUnit library

#### Boo

-   Console project
-   Empty project
-   Library
-   Web application
-   Empty web application.
-   NUnit library

#### Java (IKVM)

-   Console project
-   Empty project
-   Library

#### C/C++

-   Empty project
-   Shared library
-   Static library
-   Console project

#### Other projects

-   Translation project
-   Generic project
-   Blank solution

Command Line Tools
------------------

#### Project build tool

-   mdtool build

#### Project conversion tool

-   mdtool project-export

#### Makefile generator tool

-   mdtool generate-makefiles

#### Add-in setup utility

-   mdtool setup

#### Graphical add-in setup utility

-   mdtool gsetup


