---
title: What's new in MonoDevelop 2.2
redirect_from:
  - /Download/What's_new_in_MonoDevelop_2.2/
  - /download/what's_new_in_monodevelop_2.2/
---

Windows Support
---------------

**Windows now Officially Supported**

Windows is now an officially supported platform for running MonoDevelop. Many Windows specific issues have been fixed, and some add-ins such as debugging and subversion support have been written specifically for Windows. See the [Feature Matrix](#feature-matrix) for more details about which add-ins are supported in Windows.

**Windows Installer**

We are releasing a new Windows Installer which includes almost all you need to run MonoDevelop. The only external dependency is Gtk#, which is provided in a separate installer.

 [![SteticWin32.png](/images/239-SteticWin32.png)](/images/239-SteticWin32.png "MonoDevelop running on Windows")   [![md21Setup.png](/images/240-md21Setup.png)](/images/240-md21Setup.png "The Windows Installer")

Mac Support
-----------

[![MacMainMenu.png](/images/256-MacMainMenu.png)](/images/256-MacMainMenu.png "MonoDevelop running on Mac OSX")**Mac OSX now Officially Supported**

Mac OSX is also now a supported platform. MonoDevelop has been adapted to Mac OSX in many ways. For example, keyboard shortcuts follow the OSX standard, and the main menu is replaced by the global Mac menu. In addition, a large number of Mac-specific, mainly GTK-related bugs have been fixed. See the [Feature Matrix](#feature-matrix) for more details about which add-ins are supported in Mac OSX.

Project Management
------------------

**Multiple Target Runtimes**

MonoDevelop now supports targetting different .NET runtimes. For example, when running on Windows, it is possible to build and run applications using either Microsoft .NET or Mono. Also, when running on Linux, it is possible to target several Mono versions installed in different prefixes.

[![Captura-Options.png](/images/241-Captura-Options.png)](/images/241-Captura-Options.png "Multiple Target Runtimes")
**Per mime-type Policies**

Text file formatting settings can now be specified per file type. Formatting information is stored in the project file, so it will be the same for all programmers of the project.

[![Captura-OptionsFormatting.png](/images/242-Captura-OptionsFormatting.png)](/images/242-Captura-OptionsFormatting.png "Per mime-type Policies")
**Custom Execution Modes**

The new *Run With* menu allows running a project using a special execution mode. Execution modes can be provided by add-ins (for example, a debugger or a profiler), and can be customized by the user (for example, it would be possible to define a custom mode which runs a profiler with a set of user defined options).

[![CapturaModes.png](/images/243-CapturaModes.png)](/images/243-CapturaModes.png "Custom Execution Modes")
**Global Assembly Folders**<br/>
It is now possible to specify a set of folders where MonoDevelop should look for assemblies when resolving project references. This set of folders is also used to look for .pc files. This simplifies the development of libraries (such as add-ins) that need to be linked to applications which are not installed in the system. Custom folders can be specified in the Preferences -\> Build options panel.

[![OptionsAssemblyFolders.png](/images/244-OptionsAssemblyFolders.png)](/images/244-OptionsAssemblyFolders.png "Global Assembly Folders")
**Delete Project Dialog** <br/>
When removing a project from a solution, MonoDevelop now presents a dialog which allows deleting all or part of the project files from disk.

[![DeleteProject.png](/images/245-DeleteProject.png)](/images/245-DeleteProject.png "Delete Project Dialog")
**Dropping Files From Nautilus/Explorer to the Solution Tree**

Drag & Drop of files between the file manager and the Solution tree is now supported. This can be used to add files to a project.

**Improved Project Reloading**

When reloading a project (for example, due to changes externally done in the project file), MonoDevelop doesn't need anymore to close the open files.

**Initial support for .NET 4.0**

MonoDevelop now has basic support for building and running applications on .NET 4.0 (this will require Mono from SVN or the .NET 4.0 beta framework on Windows).

Text Editor
-----------

**Autosave**

MonoDevelop now keeps a copy on disk of all edits done in a file, even if the file has not been saved. In case of a crash, a file recovery dialog is shown which allows restoring unsaved changes.

**Code Templates**

Code Template support has been completely rewritten and now offers much more powerful features:

-   Templates can now have **placeholders**. When the template is inserted, the cursor will be moved to the first placeholder and the user can move between placeholders by pressing TAB. Placeholders can be linked to other text in the template, which will be automatically updated. For example, a template for the 'for' statement can have a placeholder for the iteration variable, and when the name of the variable is entered all references to that variable in the template are automatically updated.
-   Support for **'Surround With'**. Templates supporting this mode, can be used to surround a block of selected code. For example, the 'try' template will surround a block of code with a try/catch statement.

[![CodeTemplates.png](/images/247-CodeTemplates.png)](/images/247-CodeTemplates.png "Code template with placeholder")<br/>

**Block Selection**

Block selection in the editor is now supported by pressing Alt while selecting text.

[![BlockSelection.png](/images/248-BlockSelection.png)](/images/248-BlockSelection.png "Block Selection")
**Code Focus**

When hovering over a fold region, the corresponding area of code will be highlighted to make it easier to identify among all the code regions.

[![CodeFocus.png](/images/404.png)](/images/404.png "Code Focus")
**Big Performance Improvements**

The editor is now much faster and will be more responsive when editing large files.

**Code Formatting**

A new **C# formatter** has been implemented. This formatter has plenty of formatting options which can be configured per-project.

The new **Format Document** command (available in Edit -\> Format -\> Format Document) formats the current file following the options specified for the file file type and active project.

[![CSharpFormattingOptions.png](/images/249-CSharpFormattingOptions.png)](/images/249-CSharpFormattingOptions.png "C# Formatting Options")
**On-the-fly formatting [Preview]**

When the 'on the fly code formatting' option is enabled, MonoDevelop will automatically format blocks of code following the formatting options set in the project. This feature is still in beta status and disabled by default.

**Acronym Matching in Code Completion**

The Code Completion window now supports acronym matching. This is useful for completing long identifiers. For example, a method name such as ChangeCurrentPageArgs can be quickly selected by just typing 'ccp'.

[![CompletionAcronymMatch.png](/images/251-CompletionAcronymMatch.png)](/images/251-CompletionAcronymMatch.png "Acronym Matching in Code Completion")
**XML Documentation Shown in Code Completion**

Documentation written in the code using the XML documentation format will now be shown in the Code Completion window.

[![XmlDocumentationCompletion.png](/images/250-XmlDocumentationCompletion.png)](/images/250-XmlDocumentationCompletion.png "XML Documentation Shown in Code Completion")
**Improved vi Mode Support**

The vi Mode support has been improved with several new commands.

**Dynamic Abbrev Command**

The new Dynamic Abbrev command (bound to Alt+/ by default) emulates the command of the same name available in Emacs. It is a simple form of autocompletion that cycles through matching words in all the open text editors, and is useful for documents that do not have full autocompletion support.

**Code Generator**

The 'Show Code Generation Window' command (Alt + Insert by default) allows quickly generating snippets of code based on the current context. Here are some examples:

-   Generate a constructor, initializing a set of selected fields.
-   Generate properties for a set of fields.
-   Override base class members.
-   Implement ToString().
-   Implement equality methods.
-   Introduce a parameter null check in a method.

[![GenerateCode.png](/images/246-GenerateCode.png)](/images/246-GenerateCode.png "Code Generator<")

Refactoring
-----------

MonoDevelop 2.2 features a new code refactoring engine with plenty of new features:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><strong>Resolve Namespace</strong></p>
<p>When applied to a class name, it will look for a namespace that declares that class, and will insert the required 'using' declaration at top of the file. If there are several namespaces defining the same class, all available options will be shown, so the user can chose.</p></td>
<td align="left"><a href="/images/252-NamespaceResolver.png" title="Resolve Namespace"><img src="/images/252-NamespaceResolver.png" alt="NamespaceResolver.png" /></a></td>
</tr>
<tr class="even">
<td align="left"><p><strong>Rename Refactoring with Preview</strong></p>
<p>The 'Rename' command for classes and members now has a preview window which shows the changes to be made after confirming the operation.</p></td>
<td align="left"><a href="/images/253-RenamePreview1.png" title="Rename Refactoring with Preview"><img src="/images/253-RenamePreview1.png" alt="RenamePreview1.png" /></a></td>
</tr>
</tbody>
</table>

**Extract Method**

Generates a method out of a block of code. It will automatically add the required parameters, based on the variables being used in the block of code.

**Declare Local Variable**

When applied to a expression, declares a local variable which has that expression as value.

**Integrate Temporary Variable**

When applied to a variable, replaces all variable references by the initialization value of the variable. It is the reverse of Declare Local Variable.

**Introduce Constant**

Creates a constant field for the selected constant value.

**Move Type to Own File**

When there is a file with several classes defined of it, it allows quickly moving a class to its own file, keeping the required 'using' declarations.

**Remove Unused** ***Usings***

Title says it all. Removes *using* declarations which are not required in a file.

**Sort *Usings***

Alphabetically sort *using* declarations.

**Create/Remove Backing Store**

Creates a backing field for an atomatic property. That is, it converts an automatic property to a regular property.

**Keybindable Commands**

Several refactoring and navigation commands can now be bound to keyboard shortcuts, including Rename (F2), Go to Definition (F12), and Find References (Shift-F12).

**Inline Rename**

Local variables and parameters are now renamed inline using the code templates' linked regions. This makes workflow smoother by avoiding opening a dialog.

Debugger
--------

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><strong>Support for the new Soft Debugger</strong></p>
<p>MonoDevelop now has support for the new Mono Soft Debugger. This new debugger is supported in Linux and Mac and in addition to normal desktop applications, it allows debugging ASP.NET, Moonlight and MonoTouch applications. <strong>The Soft Debugger requires Mono 2.6.</strong></p>
<p><strong>Immediate Window</strong></p>
<p>The new Immediate Window allows evaluating expressions and calling methods while the debugger is stopped.</p>
<p><strong>Win32 Debugger</strong></p>
<p>Debugging on Windows is supported thanks to the new Win32 debugger backend.</p>
<p><strong>Initial support for ASP.NET debugging</strong></p>
<p>There is initial support for ASP.NET debugging. This is supported only in Linux with the latest version of the Mono debugger or using the Soft Debugger backend.</p>
<p><strong>New Debugging Options Panel</strong></p>
<p>A new debugging options panel can be found the the MonoDevelop preferences dialog, which allows setting several options such as: </p>
<ul>
<li>Disabling implicit evaluation of properties, with support for refreshing values</li>
<li>Limiting the debug scope to application assemblies only</li>
<li>Enable/disable ToString calls</li>
<li>Evaluation timeout</li>
<li>Setting the debugger engine priority (when several debugging engines can be used to debug an app).</li>
</ul>
<p><strong>New Add Tracepoint Command</strong></p>
<p>This new command alows quickly adding a tracepoint to a line of code (bound to ctrl+shift+F9 by default).</p>
<p> </p></td>
<td align="left"><p><a href="/images/254-ImmediateWindow.png" title="Immediate Window"><img src="/images/254-ImmediateWindow.png" alt="ImmediateWindow.png" /></a><br /><br /> <a href="/images/255-DebuggerWin32.png" title="Win32 Debugger"><img src="/images/255-DebuggerWin32.png" alt="DebuggerWin32.png" /></a></p>
<p><a href="/images/404.png" title="Debugger Options"><img src="/images/404.png" alt="DebugOptions.png" /></a></p></td>
</tr>
</tbody>
</table>

ASP.NET MVC Add-in
------------------

MonoDevelop now includes support for ASP.NET MVC projects, including file and project templates, and a T4 (Text Template Transformation Toolkit) based view and controller scaffolding system.

T4 support is provided by the new Text Templating addin, which includes a T4 engine and editing features, such as syntax highlighting and outlining support for .tt files, and the ability to jump to compiler error locations when executing a .tt file. A command-line T4 tool is also included, TextTransform.exe, which emulates the Microsoft tool of the same name.

The System.Web.Mvc.dll is included in Mono 2.4.2.3 and later. In order for MonoDevelop to detect this dll, you must also have the system.web.mvc.pc file installed, which is included in Mono 2.4.3 and later, but can be added manually to 2.4.2.3.

IPhone Add-in
-------------

[![MonoDevelopIPhone.png](/images/262-MonoDevelopIPhone.png)](/images/262-MonoDevelopIPhone.png "MonoDevelop running on Mac OSX")

The Mac release of MonoDevelop includes an iPhone development addin. Although it requires Novell's commercial MonoTouch product to develop, build and run iPhone applications, the addin itself is open-source. The iPhone addin includes

-   Project and files templates
-   Support for building and signing app bundles
-   Support for running projects in the simulator and uploading them to provisioned devices
-   Automatic generation of designer code for xib files

Moonlight Add-in
----------------

The Moonlight addin, which was first previewed in MonoDevelop 2.0, should still be considered an alpha-quality release. However, it is now able to build applications against a local SDK bundle. This is included in the Mac release, and on other platforms can be specified using the [MOONLIGHT\_2\_SDK\_PATH](http://mjhutchinson.com/journal/2009/05/08/moonlight_development_linux_monodevelop) environment variable.

**NOTE: the iPhone addin is known to interfere with the Moonlight addin's "Add references" listing at this time. This will be fixed in an upcoming release of MonoTouch.**

Python Binding
--------------

The Python Binding has been greatly improved, and we are releasing it as an official MonoDevelop add-in for the first time. Here is a summary of the features supported by the add-in:

-   Robust and fast code completion support
-   Quick class/method finder at the top of the file
-   On-the-fly syntax checker, with support for Pyflakes.
-   Support for Python 2.5 and 2.6
-   Code folding for Python blocks

Version Control
---------------

**[![Annotations.png](/images/258-Annotations.png)](/images/258-Annotations.png "Annotations Command")Show Annotations Command**

The Show Annotations command makes it easy to see which lines have been changed by who. This operation is available as a command in the Version Control context menu, and it is also available in the context menu of the text editor (so you can show annotations for any open file).

**Improvements in Review Changes View**

When the Review Changes view shows the diff of a file, it is now possible to double click on a line of the diff to jump to the source code of the file.

**Create Patch command**

The new Create Patch command creates a patch including all the changes of a directory. If comments for files have been entered, the patch will include the required changes in ChangeLog files.

Other
-----

**Syntax Hilighting in Search Results**

The results view of the Find in Files command now uses syntax hilighting when showing the matching lines of code.

**Improvements in Database Add-in**

The database add-in is now more stable and there is a new syntax mode for SQL.

**Multi-selection Support if Go to File Dialog**

The Go to File dialog now supports multi-selection. When clicking on OK, all selected files will be opened in the IDE.

**Makefile Generation: Support for Configuration Options**

When creating a tarball package, it is possible to specify a set of switches which can be enabled at configuration time.

**Vala Binding**

This release features improved code completion, support for the quick finder, and support for Vala 0.7.0.

**C/C++ Addin**

Code completion in the C/C++ addin is now more reliable.

**C# code completion**

The C# addin has more reliable type inferencing, and provides code completion for partial methods.

Feature Matrix
--------------

The following matrix shows which features are available for each platform. MonoDevelop features not shown in the list ara available for all platforms.

|--------------------------|----------------------------------------------------|----------------------------------------------------|-----------------------------------------------------|
| **Feature**              | **Linux**                                          | **Mac**                                            | **Windows**                                         |
| C#                       | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span>  |
| Visual Basic             | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span>  |
| Java (IKVM)              | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(128, 0, 0);">No</span>     | <span style="color: rgb(128, 0, 0);">No</span>      |
| Boo                      | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(128, 0, 0);">No</span>     | <span style="color: rgb(128, 0, 0);">No</span>      |
| C/C++                    | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(128, 0, 0);">No</span>      |
| Python                   | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(128, 0, 0);">No</span>     | <span style="color: rgb(128, 0, 0);">No</span>      |
| Vala                     | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(128, 0, 0);">No</span>     | <span style="color: rgb(128, 0, 0);">No</span>      |
| ASP.NET Project          | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span>  |
| ASP.NET MVC Project      | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span>  |
| Translation Project      | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(128, 0, 0);">No</span>      |
| iPhone Project           | <span style="color: rgb(128, 0, 0);">No</span>     | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(128, 0, 0);">No</span>      |
| Moonlight Project        | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span>  |
| Gtk# designer            | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(128, 0, 0);">No</span>     | <span style="color: rgb(51, 153, 102);">Yes</span>  |
| Generation of Makefiles  | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(128, 0, 0);">No</span>      |
| Generation of Tarballs   | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(128, 0, 0);">No</span>      |
| Makefile Synchronization | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(128, 0, 0);">No</span>      |
| Database Explorer        | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(128, 0, 0);">No</span>      |
| NUnit add-in             | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span>  |
| Subversion add-in        | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span>  |
| Help Browser (Monodoc)   | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span>  |
| Debugging (managed)      | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span>  |
| Debugging (C/C++)        | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(128, 0, 0);">No</span>     | <span style="color: rgb(128, 0, 0);">No</span>      |
| ASP.NET Debugging        | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes</span> | <span style="color: rgb(51, 153, 102);">Yes </span> |

Credits
-------

Contributors to this release:

-   Lluis Sanchez (project management, debugger, Windows port)
-   Mike Krueger (text editor, refactoring)
-   Michael Hutchinson (IPhone add-in, Mac port, ASP.NET MVC addin, T4 addin, Moonlight add-in)
-   Mike Kestner (Gtk# designer)
-   Ankit Jain (msbuild support)
-   Levi Bard (annotation support, create patch command, C/C++ binding)
-   Christian Hergert (Python binding, GTK+ fixes for Mac)
-   Luciano N. Callero (database add-in)
-   Zach Lute (go to file dialog)
-   Jérémie Laval (makefile generation switches)
-   Carlo Kok
-   Viktoria Dudka
-   Jonathan Pobst (Windows setup)
-   Marc Christensen (QA)
-   Andrew Jorgensen (packaging)
