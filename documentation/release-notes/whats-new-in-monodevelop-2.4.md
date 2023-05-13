---
title: What's new in MonoDevelop 2.4
redirect_from:
  - /Download/What's_new_in_MonoDevelop_2.4/
---

Workbench Usability
-------------------

**Improved Look**

The main window now has a darker background, with some subtle shading effects. The pads look more *physical* and better delimited. The pad toolbars are now integrated in the docking system, improving the overall visual consistency.

There is a new configuration option for selecting the desired **level of compactness** of the GUI. There are five levels, from Very Compact to Very Spacious. Depending on the level, some padding is added or removed. So for example, in the 'Spacious' level, there is some padding always visible between the pads, the window borders and the main menu. There is no such padding in 'Normal' mode.

**Improved Pad Organization**

![Main Window](/images/279-md24-MainWindow.png "Main Window")Results pads such as the Error List, logs for Version Control or Find in Files operations are now shown in autohide mode by default, and the buttons to activate them are now placed next to the status bar, saving some valuable visual space. Until now, those pads were shown docked at the bottom, taking space from the text editor.

When the result of a command is shown in the status bar, clicking on the status bar will now activate the pad that contains the results of the command. For example, for a build operation it will show the Errors List, or for a Version Control operation it will show the operation output log.

****Improved Error Workflow with **In-line Error Bubbles**

![Multiple Target Runtimes](/images/278-md24-ErrorBubbles.png "Multiple Target Runtimes")The compiler/error management workflow has been improved in several areas to make it easier to browse through errors and warnings:

-   Errors and warnings are now shown in-line in the text editor. It is possible to jump through all errors by pressing **F4**.
-   The standalone Build Output pad has been integrated into the Errors List pad, and it can be made visible by clicking on a new Build Oputput button.
-   When in auto-hide mode, the Errors List pad label shows information about the number of errors and warnings of the last build.

**New Project/File dialogs**

The look of the New Project and New File dialogs have been improved, and now they have a section for recently used templates.

![Navigate To Dialog](/images/280-md24-NavigateTo.png "Navigate To Dialog")

**Navigate To dialog**

The new Navigate To dialog allows quickly finding and jumping to files, types and type members.  The new shortcut for displaying the dialog is **control+,**. The search algorithm supports acronym matching and tries to find the best match, not only by searching substrings, but also by splitting the search string in several parts and trying to match them through all the words that compose the string being checked.

**Solution and Class pad Zooming**

MonoDevelop has an option which allows choosing the font to use for the tree view pads such as the Solution pad or the Class pad. Those tree views may be large for big projects, so users find it convenient to use a small font, which allows seeing more information at once.

![Pad Zooming](/images/285-md24-PadZoom.png "Pad Zooming")To make font reduction easier and more handy, a new Zoom capability has been added to the tree pads. So to zoom, all you have to do is hold the **Control key** and move the **mouse wheel** up and down (the standard zoom shortcuts can also be used for this, including **Control+0** to reset the zoom).

**Other Improvements**

-   New option for selecting the GTK+ theme
-   New option for selecting the user interface language
-   New option for selecting the output pad font

Project Model
-------------

**![Multiple Target Runtimes](/images/282-md24-ExeProject.png "Multiple Target Runtimes")Standalone Assembly Projects**

MonoDevelop now supports loading an executable assembly as a project. Such projects can be created by directly opening a .exe using the File Open command or by adding the .exe to an existing solutions. Also, MonoDevelop will get the list of source code files from the debug info of the assembly (when available).

**External Console Support for Mac and Windows**

Console projects with the 'Run in External Console' option will now properly work on Mac and Windows.

**<span id="1273075374132S" style="display: none;"> </span>Support for adding files to solution folders**

**<span id="1273075374164E" style="display: none;"> </span>**

![Multiple Target Runtimes](/images/404.png "Multiple Target Runtimes")Files can now be directly added to solution folders. This is useful to keep common solution files handy, such as documentation or data files which are not directly bound to a specific project.

**Proper MSBuild file links in projects**

Files from outside the directory of a project can now be added as a link in any project folder. In previous versions, such files where always shown in a single "External Files" folder.

<span id="1273074684562S" style="display: none;"> </span>**Project Infrastructure Improvements**

Although not directly visible to the user, some important changes has been done in the project service to better support the new features of this and future releases. This includes an overwork of the project object model, improved support for MSBuild projects and other improvements.

Source Editing
--------------

**![Inline Search](/images/284-md24-InlineSearch.png "Inline Search")Improved in-line search**

The search bar which was located at the bottom of the editor in previous versions is now replaced by a new animated popup bar, which makes a more efficient use of space.

The new search bar has improved handling of the case mode. New searches start in case insensitive mode. If an upper case letter is typed, the search automatically switches to case-sensitive mode, and remains in this mode from that point on (until the next search).

**Group Mode in Code Completion**

![Group Mode](/images/281-md24-CompletionGroups.png "Group Mode")The code completion list has a new *Group* display mode. In this mode, members of a class are shown grouped below the class name that declares them. This mode makes it easier to locate members for classes with a large inheritance chains.

Group mode can be toggled by pressing **control+space** while the completion list is visible. The keys **shift+up/down** can be used to jump between groups.

**Symbol Usage Highlighting**

![Symbol Usage Highlighting](/images/287-md24-ReferenceHilight.png "Symbol Usage Highlighting")

When placing the cursor over a symbol, MonoDevelop will now automatically highlight all usages of that symbol in the editor. The keys **control+shift+up/down** can be user to jump between symbol instances.

**Editing Support in Block Selection Mode**

The Block Selection mode now supports editing. When a block of text is selected and some text is typed, the text will be added to each line of the block. There is also a new command for toggling between normal and block selection mode.

**Import Type Command**

**![Import Type Command](/images/289-md24-TypeImport.png "Import Type Command")**

When pressing **control+alt+space**, MonoDevelop will show a list of all types available in the project and its references. When a type is selected, the name will be completed and the required namespace will be added to the *usings* list (if not already there).

**Move Lines Up/Down**

Lines of text can be moved up and down by pressing **alt+up/down**. When moved inside or outside a code block, line indentation will be properly updated.

**Code Focus Toggle and Follow-cursor**

There is a new command for toggling the Code Focus mode (the default shortcut is **control+shift+k**). When enabled, the editor will be shaded according to the current cursor position.

**Quick Fix**

The quick fix command **alt+return** can be used to fully qualify a type name or add its namespace to the usings list.

**Scrollable Region Tooltips**

The tooltips that are shown when hovering over folded regions can be focused with **shift+space** and scrolled.

**Improved Filtering in Completion List**

The filtering in the completion list now matches midway through words, making it easier to find unknown or misremembered items. It now uses your previous choices to improve the default selection.

**Other Improvements**

-   Better XML path bar widget.
-   New implement abstract members command
-   Added support for vi marks
-   New Xml formatting policy
-   Smart placement of semicolons

Debugger
--------

**![Pinned Quick Watch](/images/286-md24-PinnedDebugValues.png "Pinned Quick Watch")Pinned Quick Watch**

Debug value tooltips can now be pinned into the text editor. To do it, just move the mouse over a symbol, and when the value tooltip is shown, move the cursor over the tooltip and click on the Pin button. When inspecting a class instance or an array, it is also possible to expand it and pin one of the members.

MonoDevelop also supports **Live Pinned Watches**. This feature can be enabled by clicking on the Live Update button of a pinned watch. When this mode is enabled, the pinned watch will be updated when the value changes while the application is running.

**Debug Value Visualizers**

Basic support for debug value visualizers has been added. A new 'zoom' button is now shown for values which support custom visualizers. Right now there are visualizers for String and Gdk.Pixbuf, and we plan to support more visualizers in future releases.

**Improved expression evaluation**

Evaluation of expressions in the watch pad and the immediate pad has been improved and now supports more C# constructs. This is especially noticeable in the Win32 backend.

**Exception Dialog**

When an exception is thrown or uncaught, MonoDevelop will now show a dialog with information about the exception object.

Tools
-----

**![Hex Editor](/images/283-md24-HexEditor.png "Hex Editor")Hex Editor**

The new Hex Editor allows inspecting and editing binary files. A file can be opened with the Hex Editor by using the **Open With** menu available for project files, or when using the Open File command, by selecting Hex Editor in the Open With combo box.

**Integrated T4 Templating**

There is now a file template for creating T4 text templates, and T4 templates are automatically compiled and run when they are saved.

**More Code Metrics**

The Code Metrics tool can now calculate the Cyclometric Complexity and Class Coupling of projects and solutions. The results view has also been improved and it now shows the results grouped by project.

ASP.NET
-------

There is code completion for C# regions in ASP.NET pages.

Web References
--------------

**![WCF Web References](/images/290-md24-WebReferenceWCF.png "WCF Web References")WCF Web References**

The Add Web Reference command now supports adding references based on WCF. When adding the reference, and new combo box allows selecting the target framework, which can be WCF or .NET 2.0 Web Services.

**Other Improvements**

-   Web reference information is now stored using a format compatible with Visual Studio.
-   Adding references to web services that require authentication is also now supported.

NUnit
-----

The NUnit add-in has some minor but important improvements:

-   Test pad now only shows projects and solutions with tests
-   There is a new **Go to Failure** command which will show the file and line that caused the failure of the selected test.
-   Frames in stack traces shown in the results pad are now clickable, and will jump to the corresponding location when double-clicked.

MonoTouch
---------

The MonoTouch addin now supports iPhone SDK 3.2 and 4.0, including iPad/Universal apps, and has more project and file templates.

The **Run-\>Run With** menu can now be used to run applications in different versions of the iPhone Simulator, and the default simulator version can be set using the **Project-\>iPhone Simulator Target** menu.

Mac OSX
-------

Some improvements in the Mac OSX port:

-   Added file association definitions to the MonoDevelop app bundle so that it's the default handler for solution and project files.
-   Included the Database add-in in the bundle.
-   Added support for running projects in an external console.

Vala
----

The Vala completion engine has been reworked, replacing the out-of-process [VSC](http://code.google.com/p/vtg)-based completion with the more accurate and responsive [libafrodite](http://code.google.com/p/vtg).

Other
-----

-   Database Add-in: Improved Create Database dialog
-   Improved Assembly browser
-   Improved Regex Toolkit

Credits
-------

Contributors to this release:

-   Lluis Sanchez (project management, workbench, debugger, Windows port, web references, NUnit)
-   Michael Hutchinson (ASP.NET, T4, Mac port, MonoTouch)
-   Mike Krueger (text editor, error bubbles, refactoring, hex editor)
-   Levi Bard (C/C++ add-in, vi mode, Vala)
-   Geoff Norton (MonoTouch)
-   Nikhil Sarda (code metrics)
-   Luciano N. Callero (database add-in)
-   Sanjoy Das (vi marks)
-   Carlo Kok
-   Alan McGovern (The really annoying guy who complains when something breaks)
-   Jonathan Pobst (Windows setup)
-   Andrew Jorgensen (QA & packaging)

 Translators:

-   David Makovský (Czech)
-   Andres Aragoneses (Spanish)
-   Atsushi Enomoto (Japanese)
-   Ray Wang, Yan-ren Tsai (Chinese)
-   Mike Krueger, Masahiro Arai, Zeno Gantner (German)
-   Bruno Bovey (French)
