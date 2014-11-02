---
title: MonoDevelop 2.0 Released
redirect_from:
  - /Download/MonoDevelop_2.0_Released/
---

The MonoDevelop team is proud to announce the release of MonoDevelop 2.0.

MonoDevelop is a GNOME IDE primarily designed for C# and other .NET languages. MonoDevelop enables developers to quickly write desktop and ASP.NET Web applications on Linux. MonoDevelop makes it easy for developers to port .NET applications created with Visual Studio to Linux and to maintain a single code base for all platforms.

New Features
------------

### Summary

This new version of MonoDevelop comes with plenty of new features. Here is a summary:

-   Project management
    -   Native support for the MSBuild format, with support for multiple target frameworks, and a new project model which allows managing several solutions at the same time.
    -   Per-project/solution policies.
    -   Vala support.
-   Workbench
    -   Support for multi-selection in the solution pad.
    -   Pad/document switcher.
    -   Go to File dialog with support for acronym matching.
    -   New assembly browser.
-   Web development
    -   Better support for code completion.
    -   Path bar and document outline.
-   Source code editing
    -   Improved code completion, with C# 3 support.
    -   New managed text editor with support for code folding, split view, colour schemes and incremental search bar.
    -   vi modes support.
    -   Document outline pad for C# files.
    -   Improved Xml editing experience.
-   Integrated debugger
    -   Integration of MDB (for debugging Mono applications) and GDB (for debugging native applications).
-   Improvements in most of the existing features, including Version Control integration, the Gtk# visual designer, and many others.

### Project Management

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><strong>MSBuild File Format</strong>
<p>MonoDevelop now uses the MSBuild project format as its native file format. This improves compatibility with Visual Studio, and will allow MonoDevelop to transition to using xbuild/MSBuild as the build engine.</p>
<p>The old MonoDevelop project file format (mdp) is still supported. The default file format to use when creating new projects can be configured in the MonoDevelop preferences dialog, Load/Save section.</p></td>
<td align="left"><p><a href="/images/192-FileFormatSelectorSmall.png" title="File format selector"><img src="/images/192-FileFormatSelectorSmall.png" alt="FileFormatSelectorSmall.png" /><br /></a></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>New project model: Solution Folders and Workspaces<br /></strong></p>
<p>Solution folders allows organizing projects using folders inside a solution. This organization used to be done with nested solutions, but the solution folder model is more robust and it is compatible with the Visual Studio model.</p>
<p>A workspace allows grouping together a set of solutions (or other child workspaces). Workspaces are useful when you have several related but independent solutions and you want to open all of them at once.</p></td>
<td align="left"><a href="/images/193-NewProjectModel.png" title="Workspaces and solution folders"><img src="/images/193-NewProjectModel.png" alt="NewProjectModel.png" /></a></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>Multiple Target Frameworks</strong></p>
<p>The .NET 3.0 and 3.5 target frameworks are now explicitly supported. MonoDevelop will now detect inconsistencies in project references. For example, a project targeting the 2.0 framework won't be able to reference projects targeting 3.0 or 3.5.</p></td>
<td align="left"><a href="/images/185-RuntimeVersionSmall.png" title="Target framework selector"><img src="/images/185-RuntimeVersionSmall.png" alt="RuntimeVersionSmall.png" /></a></td>
</tr>
<tr class="even">
<td align="left"><p><strong>Opening Multiple Solutions</strong></p>
<p>MonoDevelop now supports opening multiple solutions at the same time. This is useful when you are working with a solution and want to review code side-by-side which belongs to another solution. To open a solution without closing the currently opened, you can:</p>
<ul>
<li>Click on the Open command, select the solution, and uncheck the &quot;Close current workspace&quot; option.</li>
<li>In the &quot;Recent Solutions&quot; menu, click on the solution you want to open while holding the Control key. The same applies when opening from the Welcome Page.</li>
</ul></td>
<td align="left"><a href="/images/190-MultipleOpenSolutions.png" title="Opening several solutions at the same time"><img src="/images/190-MultipleOpenSolutions.png" alt="MultipleOpenSolutions.png" /></a></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>Configurable Project Base Directory</strong></p>
<p>All projects have a base directory assigned. This base directory is where the project file is located. All files included in the project are supposed to be under that directory, and it is the directory structure shown in the Solution Pad (files outside the project directory are still alowed, but they are shown all together in a special 'External Files' folder).</p>
<p>In order to support other project directory structures, it is now possible to specify a custom base directory for a project. So for example, now a project file can be saved in a directory and project files in a different directory. The Solution Pad will show the correct source file structure, and all version control operation will be directed to the custom base directory.</p>
The base directory can also be specified for solutions, solution folders and workspaces.</td>
<td align="left"><a href="/images/188-CustomBaseDirectory.png" title="Configurable Project Base Directory"><img src="/images/188-CustomBaseDirectory.png" alt="CustomBaseDirectory.png" /></a><br />  </td>
</tr>
<tr class="even">
<td align="left"><p><strong>Options Dialog Reorganization</strong></p>
<p>The options dialogs have been reorganized to make it easier to find the settings to manage.</p>
<p>Configuration-specific option panels are grouped together with all other panels (configuration selection is now done inside the panel, not in the options tree), so option panels can be more logically organized.</p></td>
<td align="left"><a href="/images/189-OptionsDialogReorg.png" title="Options dialog reorganization"><img src="/images/189-OptionsDialogReorg.png" alt="OptionsDialogReorg.png" /></a></td>
</tr>
</tbody>
</table>

**Per-Project/Solution** **Policies**

Many of the settings that were previously only available in the user's global preferences can now be set per-solution and per-project. Those settings are grouped in what we call **policies**.

Policies include:

-   Text style: tabs to spaces, tab width, etc.
-   Standard header
-   Default namespaces for projects' directories
-   Resource naming styles
-   Commit message formatting
-   ChangeLog location and formatting

Policies can be applied to solutions, and can be overridden on child projects or solution folders.

The default policies for new solutions, or solutions without policies applied, can be edited in the *Edit-\>Default Policies* dialog.

|-----|---------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
|     | [![300px](/images/404.png)](/images/404.png "Naming policies") | [![300px](/images/404.png)](/images/404.png "Commit policies") |

**Vala Add-in**

The new Vala project type allows managing, editing, and compiling [Vala](http://live.gnome.org/Vala "http://live.gnome.org/Vala") code (using valac). The compilation is configurable, including define symbols, linked libraries, custom VAPI paths and arbitrary additional arguments.

Integration with Vala's API binding system allows users to easily reference packages like SDL, DBus, or libsoup. Library projects produce VAPIs for use with Vala, as well as pkg-config files for use with C and other languages.

Class pad browsing is supported via exuberant ctags, as is limited code completion.

|-----------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| [![350px](/images/404.png)](/images/404.png "Vala class pad") | [![350px](/images/404.png)](/images/404.png "Package selector") |

### IDE Workbench

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><strong>Multi-selection in the solution pad</strong></p>
<p>The solution pad now supports multi-selection. Operations such as copying, moving and deleting files and folders can now be done for several files or folders at once.</p></td>
<td align="left"><p><a href="/images/404.png" title="Multi-selection in the solution pad"><img src="/images/404.png" alt="201px" /></a></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>Go to File Dialog</strong></p>
<p>The Go to File/Type dialog has been greatly improved. It now supports acronym matching. The filtering algorithm tries to find the best match, not only by searching substrings, but also by splitting the search string in several parts and trying to match them through all the words that compose the string being checked.</p></td>
<td align="left"><p><a href="/images/404.png" title="The new Go to File dialog"><img src="/images/404.png" alt="300px" /></a></p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>Assembly Browser</strong></p>
<p>The new assembly browser allows inspecting the contents of an assembly. It can display type and member definitions, and the IL of methods.</p></td>
<td align="left"><p><a href="/images/404.png" title="The new Assembly Browser"><img src="/images/404.png" alt="400px" /></a></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>Code Metrics add-in</strong></p>
<p>The Code Metrics add-in scans a project and provides basic statistics about line counts and source code licenses.</p></td>
<td align="left"><p><a href="/images/404.png" title="The new Code Metrics add-in"><img src="/images/404.png" alt="400px" /></a></p></td>
</tr>
</tbody>
</table>

### Web development

This new release of MonoDevelop makes editing and deploying websites easier than ever.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><strong>Code Completion</strong></p>
<p>Code completion of tag, attributes, attribute values and event handlers is now supported for ASP.NET and various HTML DTDs.</p></td>
<td align="left"><p><a href="/images/404.png" title="Event completion"><img src="/images/404.png" alt="350px" /></a></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>Path Bar</strong></p>
<p>The path bar shows the current tag hierarchy and offers a quick way to select tags and their contents. (Michael Hutchinson)</p></td>
<td align="left"><p><a href="/images/404.png" title="Path bar"><img src="/images/404.png" alt="250px" /></a></p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>Document Outline</strong></p>
<p>The outline pad shows the document structure and enables quickly selecting any element.</p></td>
<td align="left"><a href="/images/194-AspDocumentOutline.png" title="Document outline"><img src="/images/194-AspDocumentOutline.png" alt="AspDocumentOutline.png" /></a></td>
</tr>
<tr class="even">
<td align="left"><p><strong>Tags in Toolbox</strong></p>
<p>ASP.NET controls are shown in the toolbox for the text editor. Dragging them to the text document automatically adds the necessary assembly reference and tag prefix registration.</p></td>
<td align="left"> </td>
</tr>
</tbody>
</table>

**Other Changes**

-   MonoDevelop's ASP.NET web projects are now compatible with Visual Studio 2008 and Visual Web Developer 2008 SP1
-   CodeBehind partial designer classes are now updated only if needed, improving build time.
-   HTML code completion is now available for HTML files as well as ASP.NET documents.
-   ASP.NET code completion better supports child controls and custom controls. Tags in standalone HTML documents are now autocompleted.

### Source code editing

MonoDevelop 2.0 has a new text editor component written from the ground up in managed code, and this has enabled the addition of many advanced features.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><a href="/images/195-CSharp3Completion.png" title="Completion of extension methods"><img src="/images/195-CSharp3Completion.png" alt="CSharp3Completion.png" /></a></p>
<p><a href="/images/404.png" title="Completion of events"><img src="/images/404.png" alt="350px" /></a></p></td>
<td align="left"><p><strong>C# Code completion Improvements with C# 3.0 support<br /></strong></p>
<p>Code completion support has been greatly improved. The completion window is now shown in all contexts. It is shown when typing the first char of an identifier, and it will include all valid types, members and keywords.</p>
<p>There are also other improvements, such as automatic generation of event handlers or anonymous methods when subscribing an event.</p>
<p>The C# parser has been upgraded to support C# 3. Some constructs (but not all) are already supported by code completion, such as extension methods.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/197-ViMode.png" title="vi Mode in action"><img src="/images/197-ViMode.png" alt="ViMode.png" /></a></td>
<td align="left"><p><strong>vi Modes Support</strong></p>
<p>The editor now includes vi modes support, supporting many common vi commands: $^0wRruIiOoPp{}AaDdGhjklXxCcVvbNn&lt;&gt;:?/.        </p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/196-CSharpDocumentOutline.png" title="C# document outline"><img src="/images/196-CSharpDocumentOutline.png" alt="CSharpDocumentOutline.png" /></a></td>
<td align="left"><p><strong>Document Outline Pad</strong></p>
<p>The Document Outline pad is now functional for C# source files (and other other .NET source files with MonoDevelop parsers), enabling easy navigation of classes and members in the current file.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CodeFolding.png"><img src="/images/404.png" alt="350px" /></a></td>
<td align="left"><p><strong>Code Folding</strong></p>
<p>Regions, members and comments can be collapsed in order to navigate code more easily. Tooltips show a preview of the collapsed contents.</p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/180-IncrementalSearch.png" title="Incremental Search"><img src="/images/180-IncrementalSearch.png" alt="IncrementalSearch.png" /></a></td>
<td align="left"><p><strong>Incremental Search Bar</strong></p>
<p>The non-intrusive search bar makes searching and replacing text easier.</p></td>
</tr>
<tr class="even">
<td align="left"><p><a href="/images/404.png" title="Colour Schemes"><img src="/images/404.png" alt="350px" /></a></p></td>
<td align="left"><p><strong>Colour Schemes</strong></p>
<p>Colour schemes are available for changing the appearance of the text editor.</p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/182-SplitEditorWindows.png" title="Split View"><img src="/images/182-SplitEditorWindows.png" alt="SplitEditorWindows.png" /></a></td>
<td align="left"><p><strong>Split View</strong></p>
<p>The text editor can be split into two panels viewing different parts of the same file.</p></td>
</tr>
<tr class="even">
<td align="left"><p><a href="/images/181-TransparentTooltips.png" title="Transparent Popups"><img src="/images/181-TransparentTooltips.png" alt="TransparentTooltips.png" /><br /></a></p></td>
<td align="left"><p><strong>Transparent Popups</strong></p>
<p>The 'Control' key can be used to make any of the completion and information popup windows transparent, to reveal the code underneath. Note that this is only available with GTK+ 2.12 and a compositing window manager such as Compiz.</p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/179-ToolboxClipboardRing.png" title="Clipboard rign"><img src="/images/179-ToolboxClipboardRing.png" alt="ToolboxClipboardRing.png" /><br /></a></td>
<td align="left"><p><strong>Toolbox Clipboard Snippets</strong></p>
<p>Copied text snippets are now retained on the toolbox for later access.</p></td>
</tr>
<tr class="even">
<td align="left"><p><a href="/images/404.png" title="Change Markers"><img src="/images/404.png" alt="200px" /></a></p></td>
<td align="left"><p><strong>Change Markers</strong></p>
<p>The source editor now has an indication in the margin of lines that are dirty or changed.</p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="Override members dialog"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><p><strong>Override/Implement dialog</strong></p>
<p>The new Override/Implement dialog shows all members which can be overriden or implemented in a class (it looks for overridable members in the base classes and interfaces), and allows choosing which have to be implemented.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/178-EncapsulateFieldsDialog.png" title="Encapsulate fields dialog"><img src="/images/178-EncapsulateFieldsDialog.png" alt="EncapsulateFieldsDialog.png" /></a></td>
<td align="left"><p><strong>Encapsulate Fields Dialog</strong></p>
<p>The improved Encapsulate Field dialog now allows selecting several fields at once, and it allows setting the visibility and accessibility of the property.</p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/198-XmlEditorAddin.png" title="XML editing with completion, path bar and document outline"><img src="/images/198-XmlEditorAddin.png" alt="XmlEditorAddin.png" /></a></td>
<td align="left"><p><strong>XML Editing</strong></p>
<p>The XML Editor from SharpDevelop has been fully integrated into MonoDevelop and improved. It supports code completion of tags, attributes and attribute values (available for registered XSD schemas). A range of schemas are supplied with MonoDevelop.</p>
<p>XML files can be validated using the built in schemas, and can have XSL transforms applied. in addition, XSD schemas can be generated from XML files.</p></td>
</tr>
</tbody>
</table>

### Integrated Debugger

This is the first MonoDevelop release that includes support for debugging. There is support for two debuggers: **MDB** (the Mono debugger, which allows debugging managed applications), and **GDB** (which allows debugging native applications).

Here is a list of the supported features (not all features are supported in both debuggers):

-   Step by step debugging.
-   Variable and field value inspection, with support for drill-down, and value editing (with code completion).
-   Process Attach/Detach (only GDB).
-   Disassembly view, mixed with source code view when available.
-   Call stack and threads window.
-   Debug tooltip in the editor. It shows the value of variables in a tooltip, with support for drill-down and value editing.
-   Expression evaluator.
-   Support for breakpoints. Adding, removing, enabling, disabling.
-   Tracepoints, hitpoints, and conditional breakpoints (only GDB).

|-----|------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
|     | [![Setting breakpoints](/images/404.png)](/images/404.png "Setting breakpoints") | [![200px](/images/404.png)](/images/404.png "Debug tooltip") | [![200px](/images/404.png)](/images/404.png "Disassembly window") | [![200px](/images/404.png)](/images/404.png "Completion in watch window") |

### Version Control

Version Control support has been improved with some new features:

-   Added support for locking/unlocking files.
-   Implemented support for the Resolve Subversion command.
-   Implemented support for the Revert to Revision command.

### Gtk# Visual Designer

-   Custom widgets can now easily be made available in the toolbox by just applying a [ToolboxItem] attribute to the class
-   Designed windows and dialogs now expose a private Gtk.UIManager field to get access to the action based UI elements.
-   Better support for moving files. When moving a window or widget implementation from one project to another project, the design will also be automatically moved

### Other Improvements

Getting MonoDevelop
-------------------

Instructions about how to get MonoDevelop are available in MonoDevelop's [Download](/download/ "Download") page.

Credits
-------

### Contributors

Aaron Bockover, Alberto Paro, Alejandro Serrano, Alexandre Gomes, Alex Graveley, Andrés G. Aragoneses, Andre Filipe de Assuncao e Brito, Antonio Ognio, Ankit Jain, Ben Maurer, Ben Motmans, Christian Hergert, Daniel Kornhauser, Daniel Morgan, David Makovský, Eric Butler, Erik Dasque, Franciso Martinez, Geoff Norton, Gustavo Giráldez, Iain McCoy, Inigo Illan, Jacob Ilsø Christensen, James Fitzsimons, Jeff Stedfast, Jérémie Laval, Jeroen Zwartepoorte, John BouAnton, John Luke, Joshua Tauberer, Jonathan Hernández Velasco, Levi Bard, Lluis Sanchez Gual, Marc Christensen, Marcos David Marín Amador, Martin Willemoes Hansen, Marek Sieradzki, Matej Urbas, Maurício de Lemos Rodrigues Collares Neto, Michael Hutchinson, Miguel de Icaza, Mike Krüger, Muthiah Annamalai, Nick Drochak, nricciar, Paco Martínez, Pawel Rozanski, Pedro Abelleira Seco, Peter Johanson, Philip Turnbull, Richard Torkar, Rolf Bjarne Kvinge, Rusty Howell, Scott Ellington, Thomas Wiest, Todd Berman, Vincent Daron, Vinicius Depizzol, Wade Berrier, Yan-ren Tsai and Zach Lute.

This list may not be complete, some contributors who sent patches by email or via our bugzilla may be missing. Your work is still greatly appreciated. If your name was left off the list, it was not intentional, please send an email to the MonoDevelop mailing list and it will be corrected as soon as possible.

### Translators

|---------------------|----------------------------------------------------------------------------------------------|
| Catalan             | Jonathan Hernández Velasco, Jordi Mas i Hernández                                            |
| Czech               | David Makovský                                                                               |
| Danish              | Martin Willemoes Hansen, Jacob Ilsø Christensen                                              |
| German              | Mike Krüger, Gustav Schauwecker, Martin Dederer                                              |
| Spanish             | Antonio Ognio, Alejandro Serrano, Andrés G. Aragoneses                                       |
| French              | Vincent Daron, Nicolas Favre-Félix                                                           |
| Galician            | Ignacio Casal Quinteiro                                                                      |
| Hungarian           | Bálint Kriván, Gergely Kiss                                                                  |
| Indonesian          | Fajrin Azis                                                                                  |
| Italian             | Alberto Paro, Milo Casagrande                                                                |
| Japanese            | Atsushi Eno                                                                                  |
| Dutch               | André Offringa                                                                               |
| Polish              | Marek Sieradzki                                                                              |
| Portuguese          | Vitor Hugo Barros                                                                            |
| Portuguese (Brazil) | Mauricio de Lemos Rodrigues Collares Neto, Andre Filipe de Assuncao e Brito, Rafael Teixeira |
| Russian             | Maxim Krentovskiy, Semyon Soldatov, Daniel Abramov                                           |
| Slovenian           | Matej Urbas                                                                                  |
| Swedish             | Daniel Nylander                                                                              |
| Turkish             | Enver Altin                                                                                  |
| Chinese (China)     | Yu Lindong, Funda Wang                                                                       |
| Chinese (Taiwan)    | Yan-ren Tsai                                                                                 |

Thanks
------

To all of our wonderful testers, who had the patience to use unstable versions of MonoDevelop for everyday use, and managed to post nice bug reports.

To Mike Krüger and the rest of the AlphaSierraPapa team for giving us a great codebase to start from, and continuing improvements.

To Pedro Abelleira, Todd Berman, John Luke, and other early contributors who started this adventure 4 years ago, and who believed in the feasibility of the project.

To all of the active and not so active (we miss you!) MonoDevelop developers.
