---
title: MonoDevelop 2.4.1 Released
redirect_from:
  - /Download/MonoDevelop_2.4.1_Released/
  - /download/monodevelop_2.4.1_released/
---

The MonoDevelop team is proud to announce the release of **MonoDevelop 2.4.1**.

MonoDevelop is an IDE primarily designed for C# and other .NET languages. MonoDevelop enables developers to quickly write desktop and ASP.NET Web applications on Linux, Windows and Mac OSX. MonoDevelop makes it easy for developers to port .NET applications created with Visual Studio to Linux and Mac OSX and to maintain a single code base for all platforms.

This is a release based on the **2.4 stable** **branch**, and includes many bug fixes and some feature improvements.

New Features
------------

 This release is mainly a bug fix release, but it also includes some new features and imrovements:

-   Improved support for xbuild
-   Support for .NET 4.0
-   Support for the Gtk# designer in Mac OSX
-   On Windows, MonoDevelop will now check for updates and warn the user when there is a new MonoDevelop version available.
-   Recent File list is better integrated with the desktop in Mac and Windows.

Bug Fixes
---------

Here is a summary of the most important fixes:

-   Projects
    -   645954 - Creating project that does not support default format
    -   Don't save the msbuild file to disk if the content did not change.
    -   Don't open projects as source files.
    -   613437 - Null Reference Exception on loading a project
    -   615677 - Make the config folder variable available in custom commands
    -   Run in external console doesn't work on Windows
    -   627484 - Deleting folders does not remove the csproj file reference
-   Text editor
    -   648926 - Unhandled exception opening C# file 
    -   635358 - Initial selection in "foreach" template is incorrect
    -   Fixed a code completion bug where fully qualified names could show up
    -   632698 - Wrong var inference
    -   631875 - No Intellisense for arrays
    -   621461 - shift+tab should outdent a code line without selecting it
    -   620977 - Special characters in source code crashes MD
    -   620854 - delete to end of line messes up edited file
    -   Fixed GTK critical when closing a text editor
    -   615992 - Intellisense broken when calling generic method
    -   619800 - Auto-complete of nothing shouldn't auto-complete as void
    -   619798 - Outdent a selected line selects the next line
    -   640497 - Code Completion when using "var" and LINQ causes MonoDevelop to crash
    -   618676 - C# code editor removes "override" word after choosing one of intellisense variants
    -   617382 - Parameter list tooltip is not hidden when pressing ctrl+left arrow
    -   616949 - Message bubbles prevents the background color of selected text to change
    -   616921 - "Move the line or highlighted selection up" command deletes selection
    -   616128 - Text editor hiccoughs every 2 seconds (approx.)
    -   616001 - Inline errors don't completely vanish after build
    -   615624 - Pressing DOWN after RETURN moves cursor to beginning of blank lines instead of to the indent
    -   615831 - Texteditor is not invalidated after remove trailing wihte spaces action
    -   Improved virtual space return key behavior.
    -   615182 - Tooltip sometimes stays up too long
    -   615191 - When using multiline selection to indent/outdent, the indenter selects too much
    -   613770 - Backspace inconsistently deletes entire lines when using "virtual spaces"
    -   615196 - Pasting a chunk of text into the virtual whitespace fracks everything up
    -   615342 - Source code highlighting behaves badly on cyrillic text
    -   613714 - Intellisense does not show / know about LINQ variables
    -   613825 - Auto-complete on highlighted text overwrites following characters
-   Refactoring<span id="1288715165496S" style="display: none;"> </span>
    -   615988 - Go to declaration not available on generic methods
    -   616653 - "import symbol" does not resolve full typenames
    -   Fixed bug in abstract member overriding
    -   619799 - Renaming variable also invokes auto-complete
    -   615983 - Refactoring does not include object initializers
    -   615702 - In-place variable renaming can't rename foreach loop  variables
    -   615763 - C# code formatting throws exception when choosing "Do not change" from menu
-   Gtk# Designer
    -   621615 - Setting PulseStep using visual designer generate wrong code
    -   625374 - "Target GTK version" value is not selected in project options GUI.
-   Workbench
    -   When moving a file in the solution pad, move also all its dependent children.
    -   646284 - MD crashes on opening Default Policies
    -   Fixed loading the welcome page news
    -   621483 - MD hangs for a few seconds when searching
    -   606557 - Invalid items in history service
    -   565714 - Autohidden pads hide when viewing treeview tooltips
    -   567155 - Linked source files not saved before building
-   Debugger
    -   Use new locals APIs w/liveness.
    -   Fixed some races in the debugger which caused MonoDevelop to deadlock
    -   594193 - [sdb] Can't debug web apps on Windows
-   Deployment
    -   638702 - error when creating package on windows
    -   Deployment options not saved
    -   615523 - [regression] tarball packages lack pixmaps / desktop files
    -   Include satellite assemblies in packages
-   ASP.NET
    -   630365 - Unhandled Exception. Nueva Solucion C# asp.net
    -   611859 - aspx highlighting issues
-   IPhone
    -   648849 - "Unknown char" in XIB prevents compilation
    -   Don't error in updater if iphone SDK not installed
    -   Fix error running bundle from path with spaces
    -   616532 - Property in .xib.designer.cs file to back IBOutlet is not being generated
    -   614551 - Cannot clear icon selection once made in Project Settings
    -   Added ability to use default SDK instead of specific version
    -   Automatically build using newer SDK if available
    -   Display unknown signing identities and provisioning profiles in project settings
    -   Added command to save app bundle as a zip file
    -   Icon ordering and naming updated to match Apple's new guidelines
    -   Custom string tag providers: SdkVersion, BundleVersion, BundleIdentifier, AppDirectory, 
-   Other
    -   617276 - MonoDevelop crashes when clicking on a script error in Unity3d.
    -   600727 - Moonlight: DataGrid missing
    -   Added mime type for java script.
    -   Updated German and Catalan translations
    -   Fixed an error on MacOS when opening files in MonoDevelop from Finder

Getting MonoDevelop
-------------------

Packages for several distros and platforms, as well as source code tarballs and build instructions are available in the MonoDevelop [Download](/download) page.

This release of MonoDevelop needs at least **Mono 2.6.1** and **Gtk# 2.12.8** to run.
