---
title: MonoDevelop 1.0 Released
redirect_from:
  - /Download/MonoDevelop_1.0_Released/
  - /MonoDevelop_1.0_Released/
  - /monodevelop_1.0_released/
---

The MonoDevelop team is proud to announce the release of MonoDevelop 1.0.

MonoDevelop is a GNOME IDE primarily designed for C# and other .NET languages. MonoDevelop enables developers to quickly write desktop and ASP.NET Web applications on Linux and Mac OS X. MonoDevelop makes it easy for developers to port .NET applications created with Visual Studio to Linux and Mac OS X and to maintain a single code base for all three platforms.

Features
--------

The main features of MonoDevelop are:

-   Customizable workbench, including custom key bindings, custom layouts, and external tools.
-   Support for several languages, with C#, VB.NET and C/C++ support included, and Boo and Java (IKVM) support available as separate add-ins.
-   Support for code completion and type information tooltips.
-   Refactoring operations to simplify changes like renaming types and type members, encapsulating fields, overriding methods, or implementing interfaces.
-   Code navigation operations such as jumping to variable definitions and finding derived classes.
-   Easy to use GUI designer for Gtk# applications, also supporting the creation and management of custom Gtk# widget libraries.
-   Integrated source code version control, with support for Subversion.
-   Integrated unit testing based on NUnit.
-   Support for ASP.NET projects, allowing web projects can be built and tested on XSP.
-   Integrated database explorer and editor (beta).
-   Integration with Monodoc, to provide documentation about classes.
-   Support for makefiles, both generation and synchronization.
-   Support for Microsoft Visual Studio project formats.
-   Packaging system that allows generating tarballs, source code and binary packages.
-   Command line tools for building and managing projects.
-   Support for localization projects.
-   Extensible add-in architecture.

### The IDE Workbench

MonoDevelop has a highly customizable workbench, based on the traditional user interface model used by most IDEs. The workbench is composed of several pads, which can be moved around by the user and docked in any place. The user can choose which pads to show, and pads can be set to auto-hide mode or floating mode. Other features include:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaCustomLayouts.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Custom Layouts</strong>
<p>MonoDevelop allows saving several layout configurations, so the user can quickly switch to the most convenient layout depending on the task to be done.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/KeyBindingManager.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Configurable key bindings</strong>
<p>It is possible to assign a shortcut to any command supported by the IDE. MonoDevelop provides several key binding schemes to ease migration from other environments like Emacs and Visual Studio. It has support for multi-state key bindings (that is, a command can be triggered by a sequence of keystrokes).</p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaExternalTools.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>External tools</strong>
<p>The Tools menu can be extended by the user by adding custom commands.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaWelcomePage.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Welcome Page</strong>
<p>The Welcome Page shows a list of the most recently opened projects, and links to web sites with documentation about Mono.</p></td>
</tr>
</tbody>
</table>

### Projects and Languages

The following table shows the languages supported by MonoDevelop:

<table border="1" cellpadding="10">
    <tbody>
        <tr>
            <th>Language</th>
            <th>Compilation</th>
            <th>Code Completion</th>
            <th>Class tree</th>
            <th>Refactory Operations</th>
            <th>Visual Designer</th>
        </tr>
        <tr>
            <td>C#</td>
            <td>Yes</td>
            <td>Yes</td>
            <td>Yes</td>
            <td>Yes</td>
            <td>Yes</td>
        </tr>
        <tr>
            <td>Visual Basic.NET</td>
            <td>Yes</td>
            <td>Yes (no generics)</td>
            <td>Yes</td>
            <td>No</td>
            <td>No</td>
        </tr>
        <tr>
            <td>C/C++</td>
            <td>Yes</td>
            <td>Yes (based on ctags)</td>
            <td>Yes (based on ctags)</td>
            <td>No</td>
            <td>No</td>
        </tr>
        <tr>
            <td>Boo</td>
            <td>Yes</td>
            <td>Yes (no generics)</td>
            <td>Yes</td>
            <td>No</td>
            <td>No</td>
        </tr>
        <tr>
            <td>Java (IKVM)</td>
            <td>Yes</td>
            <td>No</td>
            <td>No</td>
            <td>No</td>
            <td>No</td>
        </tr>
        <tr>
            <td>Other (Generic Project)</td>
            <td>Yes</td>
            <td>No</td>
            <td>No</td>
            <td>No</td>
            <td>No</td>
        </tr>
    </tbody>
</table>

#### Managed Language Projects

MonoDevelop allows creating different types of managed executables and libraries. Here is a list of the most important features:

-   There are several **templates** for the different kind of projects: Console project, library, Gtk# application, etc.
-   The build is fully configurable and it is possible to create different build profiles or **configurations** with specific build options.
-   The **Edit References** window allows selecting the assemblies that the project requires. The window shows a list of assemblies from all packages installed in the system.
-   Satellite assemblies for localized resources are automatically generated.
-   Support for **assembly signing**.
-   MonoDevelop allows targeting **different runtime versions**: 1.1, 2.0 and Moonlight.

#### C/C++ Projects

The C/C++ project type allows compiling C or C++ code using the GNU gcc or g++ compilers. The compilation and linking is **fully configurable**, including warning level, optimization level, target type (executable, static or shared library), define symbols, linked libraries, library paths, include paths and arbitrary additional arguments.

**Integration with pkg-config** enables installed packages such as GTK+ and SDL to be easily added as references. Library projects can also export pkg-config packages for consumption by other projects or for distribution.

**The class pad** is fully supported (via exuberant ctags), and can be used to browse the defined symbols and jump to their declaration with a simple double-click. This also provides limited code completion in the text editor.

**Precompiled headers** and dependency tracking are used to speed up the compilation process, and ccache may be used for an additional speed boost.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><div id="section_6">
<h4>Generic Projects</h4>
<p>Generic Projects (available in the MonoDevelop category of the new project dialog) can be used in a solution to create projects for languages not natively supported by MonoDevelop. For example, it would be possible to create a project which builds a complex C library, or one for handling translation files.</p>
<p>This project type is especially useful in combination with Custom Commands (so you can specify what needs to be done for building/cleaning/executing) and with the Makefile integration (so you can keep the file list in sync with a makefile).</p>
</div>
<div id="section_7">
<h4>Custom Commands</h4>
<p>Users can provide custom commands to be executed before, after or as a replacement of project and solution operations such as build, clean or execute. It is also possible to define new custom operations which will be shown in the project or solution context menu. Commands can be specified per-configuration in the project/solution options dialog.</p>
</div></td>
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaGenericProject.png"><img src="/images/404.png" alt="200px" /></a>
<p><a href="/images/404.png" title="File:Media_Gallery/CapturaCustomCommands.png"><img src="/images/404.png" alt="200px" /></a></p></td>
</tr>
</tbody>
</table>

### Source Code Editing and Navigation

MonoDevelop integrates many tools, commands and automations to simplify the editing and browsing of the code. Here is a list of the most important ones:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/NewCompletion.png"><img src="/images/404.png" alt="150px" /></a></td>
<td align="left"><strong>Code completion</strong>
<p>Shows a list of types, methods, fields, etc, depending on the editing context. Provides information about method overloads, and shows documentation if available from Monodoc.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaParameterCompletion.png"><img src="/images/404.png" alt="150px" /></a></td>
<td align="left"><strong>Parameter information</strong>
<p>When typing a method invocation shows the parameters that the method accepts.</p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/Md012_source_tooltip.png"><img src="/images/404.png" alt="150px" /></a></td>
<td align="left"><strong>Type information tooltips</strong>
<p>Move the mouse over an identifier, and MonoDevelop will show a tooltip describing what the identifier is, together with full information about its type.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/Md-underline.png"><img src="/images/404.png" alt="150px" /></a></td>
<td align="left"><strong>On-the-fly error underlining</strong>
<p>Syntax errors are highlighted on the fly in the editor, without the need for compilation.</p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CodeNavigation_1_0.png"><img src="/images/404.png" alt="150px" /></a></td>
<td align="left"><strong>Code Navigation</strong>
<p>The context menu in the code editor can be used to navigate quickly around a codebase by jumping to the definition, type, or base definition of an identifier. It can also be used to search for references and derived classes.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaSmartIndent.png"><img src="/images/404.png" alt="150px" /></a></td>
<td align="left"><strong>Smart indent</strong>
<p>The text editor features a smart indent engine which attempts to keep state as you type and bases indent level on the entire state of the file and not just the indent level of the previous line.</p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaXmlComments.png"><img src="/images/404.png" alt="150px" /></a></td>
<td align="left"><strong>Auto-generation of XML comment tags</strong>
<p>The editor will enter documentation stubs automatically after typing &quot;/&quot; three times in a comment context. The generated stubs are context-sensitive which will produce the correct default of comments and for existing methods, it will also generate parameter names.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/StandardHeaderDialog.png"><img src="/images/404.png" alt="150px" /></a></td>
<td align="left"><strong>Standard Header</strong>
<p>The Standard Header manager allows specifying the header to use when creating new files. You can write your own header, or choose one of the default headers provided.</p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaCodeTemplates.png"><img src="/images/404.png" alt="150px" /></a></td>
<td align="left"><strong>Code templates</strong>
<p>Simple code templates can be activated by entering the template's keyword, such as 'scwl', and pressing the Tab key. Templates may be added and edited in the Editor Preferences.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/MD014-ClassCombo.png"><img src="/images/404.png" alt="150px" /></a></td>
<td align="left"><strong>Class and Member Selectors</strong>
<p>The text editor has a class and member selector which allows quick navigation through the contents of the file.</p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaNavigationHistory.png"><img src="/images/404.png" alt="150px" /></a></td>
<td align="left"><strong>Navigation History</strong>
<p>The navigation toolbar allows developers to navigate backwards and forwards in their source file position history, either by using the quick Navigate Back/Navigate Forward toolbar buttons or by selecting a particular navigation point via the history dropdown menus in the toolbar.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaRefactoring.png"><img src="/images/404.png" alt="150px" /></a></td>
<td align="left"><strong>Refactoring operations</strong>
<p>The refactoring operations simplify changes like renaming types and type members, encapsulating fields, overriding methods, or implementing interfaces.</p></td>
</tr>
</tbody>
</table>

### Visual Designer for GtkSharp

Easy to use GUI designer for Gtk# applications. Supports the creation and management of custom Gtk# widget libraries.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaVisualDesigner.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Integrated Visual Designer</strong>
<p>The GTK# visual designer is integrated in the IDE workbench. It provides a customizable widget toolbox, a property grid for editing wiget properties, and a widget tree for browsing the structure of a window. The designer generates the required code behind the scenes, using partial classes.</p>
<p>See screencast: <a href="/documentation/creating-a-simple-user-interface-with-monodevelop/" title="Documentation/Creating_a_simple_user_interface_with_MonoDevelop">Creating a simple user interface with MonoDevelop</a>.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/Md012_menu_designer.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Menu and toolbar designer</strong>
<p>The menu and toolbar designers are based on the UIManager/Action/ActionGroup model. Building a menu is really easy and 'visual'. You only need to add a menu bar to the window and start writing options. The menu designer looks like a regular menu, but clicking on a menu item makes it selected, so that you can change its properties using the Properties pad. Clicking again on the menu item when it is selected will start the editing mode of the menu item, in which you can change the label or the icon.</p>
<p>When you are creating menu items in this way, the designer creates Actions for each menu item at the same time. Those actions are added to the window's ActionGroup.</p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/Md012_icon_editor.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Stock Icons</strong>
<p>MonoDevelop can manage icons to be included in a project. The idea is that you select some images, give them an ID, and MonoDevelop will generate a Gtk.IconFactory for you and will register the icons there. You can then use that ID when creating buttons or anything that requires a stock id.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/Md012_widget_bar.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Widget Toolbar</strong>
<p>The toolbar located on top of the designer shows some buttons for quickly setting some widget properties. Those buttons change depending on the selected widget.</p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaCustomWidgetDesigner.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Custom Widgets</strong>
<p>MonoDevelop allows creating custom widget libraries. Widgets from widget libraries will be shown in the toolbox, and can be dropped to any window just like the stock widgets. Custom widgets can be created using the visual designer, or by just creating a subclass of a stock GTK# widget (in the latter case, the widget must be explicitly <em>exported</em> in the project options dialog).</p>
<p>See screencast: <a href="/documentation/creating-custom-widgets-with-monodevelop/" title="Documentation/Creating_custom_widgets_with_MonoDevelop">Creating custom widgets with MonoDevelop</a>.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaTargetGtk.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Support for targeting multiple GTK# versions</strong>
<p>MonoDevelop supports targeting <strong>GTK# versions</strong> other than the ones installed in the system. For example, in a system running GTK# 2.10 it is possible to select GTK# 2.4 as target version, and the generated application will be linked against the 2.4 libraries.</p>
<p>Support for those additional GTK# versions must be installed using the add-in manager.</p></td>
</tr>
</tbody>
</table>

### ASP.NET

MonoDevelop provides support for creating ASP.NET based web sites. Although there is no visual designer for the web pages, the IDE provides a specific project type which simplifies the development of this kind of web sites.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaWebApp.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>ASP.NET Web Projects</strong>
<p>ASP.NET projects can be created, built and tested with xsp. These projects fully support the use of CodeBehind partial classes, auto-generating control references in CodeBehind classes and grouping CodeBehind classes with their parent page. They also feature several templates, support for assembly references in web.config, and type/member compatibility resolution.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaDeployWeb.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Deployment of ASP.NET Projects</strong>
<p>ASP.NET projects can be deployed to local directories using the Web Deploy command. If the FUSE &quot;sshfs&quot; filesystem is available, it can be used to deploy projects to remote servers.</p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaWebReference.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Web References</strong>
<p>MonoDevelop provides an &quot;Add Web reference&quot; command, which can be used to create a reference to a web service. This command will generate the proxy classes needed to access the selected web service.</p></td>
</tr>
</tbody>
</table>

### Makefile Support

Working with Makefiles is easy with MonoDevelop:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/GenerateMakefilesDialog.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Makefile Generation</strong>
<p>MonoDevelop can generate a complete set of makefile scripts for a solution. Two types of makefiles are supported: <strong>Autotools based</strong> makefiles, and <strong>simple</strong> makefiles. Simple Makefiles don't depend on Autotools, and are useful for projects which don't need all the features that Autotools provides, but still need to provide the most common targets such as build, install, dist and distcheck.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaMakefileIntegration.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Makefile Integration</strong>
<p>MonoDevelop supports integration with Makefiles for projects. This integration covers the following features:</p>
<ul>
<li>Delegating build, clean and/or execute operations to Makefiles</li>
<li>Keeping the monodevelop project in sync with the Makefile wrt:
<ul>
<li>List of files (code, resources, deployable files and others).</li>
<li>List of references (only for .NET projects). It can correctly handle package references specified in a configure.in file.</li>
</ul></li>
</ul>
<p>The add-in allows specifying the regular expressions to be used for parsing compiler errors and warnings. This is especially useful when integrating with non-.net makefiles.</p></td>
</tr>
</tbody>
</table>

### Visual Studio Support

MonoDevelop has native support for Visual Studio 2005 solutions/projects. You can directly load VS2005 solutions/projects and work with them. Any changes made are written back to the project files. Currently it supports loading C# (.csproj) and VB.NET (.vbproj) projects.

This support is limited to Files, References, Configurations and Compiler options. No custom msbuild tasks are supported.

This native support is not available for Visual Studio 2003 projects. When opening a VS2003 project, MonoDevelop will offer the possibility of converting it to the native MonoDevelop format or to the VS2005 format.

### Version Control

MonoDevelop integrates support for several common version control operations. Right now only **Subversion** repositories can be used.

See the screencast [Using Version Control in MonoDevelop](/documentation/version-control-screencast/ "Documentation/Version_Control_Screencast") for a live demonstration of the main features, which are:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/VersionControlCheckout.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Publish and Checkout</strong>
<p>Support for the Publish and Checkout commands, which can be used to import projects into a version control repository, and to get a project from a repository. There is a repository selector which allows registering common repository locations.</p>
<p>Publishing a solution is as easy as selecting the solution, clicking on the Publish command, and selecting the target repository. MonoDevelop will create a new module and will import only the relevant project files.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/VersionControlStatusView.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Status View</strong>
<p>The status view allows reviewing changes done in files, and allows entering commit comments for each file. Comments are stored on disk, so if you close MonoDevelop and start it again, the status window will show the comments you entered.</p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaVCMenu.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Solution pad integration</strong>
<p>Version control is fully integrated in the solution pad, so operations like renaming, deleting or moving files or folders will be handled by the version control system.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/SShotMultiChangeLog.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>ChangeLog generation</strong>
<p>The ChangeLog add-in can generate ChangeLog entries for the changes made in the committed files. It supports updating several ChangeLog files in a single commit. Every project can have a ChangeLog location policy (which can be for example: create a single ChangeLog in the root project directory, one in each first-level subdirectory, or one in every subdirectory). When committing a set of changes MonoDevelop will locate and add the comments to the correct ChangeLog for every change (creating a new one if necessary).</p></td>
</tr>
</tbody>
</table>

### Unit Testing

MonoDevelop features integrated unit testing based on [NUnit](http://www.nunit.org/ "http://www.nunit.org/"):

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaNUnitAddin.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Tests Tree</strong>
<p>The integrated NUnit support can be seen in the <em>Test Tree</em> pad where all the libraries in the solution that contain unit tests, and the text fixture hierarchy for each of them is shown. The tree is automatically updated every time the libraries are built. The test tree makes it easy to run tests by just double-clicking on them, and it shows the result of the the last test run using status icons.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaNUnitAssemblyGroup.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>NUnit Assembly Group Project</strong>
<p>This kind of project is a collection of references to existing NUnit assemblies. This is useful if you have some tests in a dll you want to run, but the dll is generated by some other process outside of MonoDevelop. The tests are shown in the test tree just like any other tests in the solution.</p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaNUnitHistory.png"><img src="/images/404.png" alt="170px" /></a></td>
<td align="left"><strong>History Panel</strong>
<p>The NUnit add-in keeps a history of test runs and the results, and you can easily browse them using the results chart and the test details window. The chart shows the progress of successful runs and failures graphically, and it is also used as a date selector. The list below the chart shows a summary of results for the test selected in the tree and at the date selected in the chart.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaNUnitResults.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Tests Results Pad</strong>
<p>It shows a list of tests executed in a test session. Tests can be filtered by result. In case of failure it will show the failure cause and the stack trace.</p></td>
</tr>
</tbody>
</table>

### Packaging and Deployment

MonoDevelop provides several options for packaging and deploying projects.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaCreatePackage.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Create Package Command</strong>
<p>The Create Package command allows creating packages for an existing project. It supports three kinds of packages:</p>
<ul>
<li>An archive of sources, which allows choosing the file format (e.g. MonoDevelop or VS2005).</li>
<li>An archive of binaries.</li>
<li>A tarball.</li>
</ul>
<p>See screencast: <a href="/documentation/building-packages-with-monodevelop/" title="Documentation/Building_packages_with_MonoDevelop">Building packages with MonoDevelop</a></p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/MD014-Packaging.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Packaging Projects</strong>
<p>A packaging project can be added to a solution and can define several <em>packages</em> to be built for the solution. Each package can be of different kind (archives, tarballs) and can include different project selections.</p></td>
</tr>
<tr class="odd">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/CapturaDeploymentProperties.png"><img src="/images/404.png" alt="200px" /></a></td>
<td align="left"><strong>Deployment Model</strong>
<p>The packaging system takes advantages of the extensible <em>deployment model</em> implemented in MonoDevelop, which allows specifying the target directory of project files. For example, it is possible to specify that a file needs to be copied to the libs directory, or to the shared directory.</p></td>
</tr>
<tr class="even">
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/MD014-DotDesktop.png"><img src="/images/404.png" alt="The .desktop file editor" /></a></td>
<td align="left"><strong>Desktop Integration</strong>
<p>MonoDevelop includes options to easily integrate applications in the Linux desktop. It can automatically:</p>
<ul>
<li>generate launch scripts</li>
<li>create a .desktop file describing the application. Once installed the application will be shown in the desktop application menu.</li>
<li>create .pc files for libraries.</li>
</ul></td>
</tr>
</tbody>
</table>

### Localization

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p>The localization add-in simplifies the work of generating and maintaining translations of projects based on <strong>gettext</strong>.</p>
<p>The add-in provides a new type of project: a Translation Project. It can be added to a solution to provide localization support to all projects in the solution. Adding, compiling and updating the translations is done via the context menu of the translation project in the project browser. When running the Update command, all source files are scanned for translatable strings, and all language files are updated. The add-in also provides a simple .po file editor.</p>
<div id="section_17">
<h3>Documentation</h3>
<p>Documentation about class libraries is provided by Monodoc. The F1 help key is context sensitive, and will show the documentation, for the type upon which the text cursor is positioned, in MonoDoc.</p>
</div>
<div id="section_18">
<h3>Command line tools</h3>
<p>Several MonoDevelop features are available as command line tools. All tools can be executed using the command 'mdtool'.</p>
<ul>
<li><strong>mdtool build</strong>: Project and solution build tool.</li>
<li><strong>mdtool project-export</strong>: Project conversion tool.</li>
<li><strong>mdtool generate-makefiles</strong>: Generates makefiles for a solution.</li>
<li><strong>mdtool setup</strong>: Add-in setup utility.</li>
<li><strong>mdtool gsetup</strong>: Graphical add-in setup utility.</li>
</ul>
</div></td>
<td align="left"><img src="/images/404.png" alt="A translation project and the .po file editor" />
<p><a href="/images/404.png" title="File:Media_Gallery/CapturaMonoDoc.png"><img src="/images/404.png" alt="250px" /></a></p></td>
</tr>
</tbody>
</table>

### Add-ins

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p>MonoDevelop provides an add-in manager that can be used to download and install/uninstall add-ins.</p>
<p>The add-in manager can be started from the MonoDevelop IDE (Tools menu), from the command line (mdtool gsetup), or you can use the command-line version (mdtool setup).</p>
<p>With the add-in manager it is possible to install add-ins from on-line repositories, and keep track of updates. You only need to register the repository url (there is a button in the add-in manager for this), and select the add-ins you want to install. The manager will take care of dependencies between add-ins, or between add-ins and the core assemblies.</p>
<p>MonoDevelop will automatically check for add-in updates once a day (you can change this periodicity in the Add-ins options panel of the preferences dialog).</p></td>
<td align="left"><a href="/images/404.png" title="File:Media_Gallery/Addinmanager.png"><img src="/images/404.png" alt="300px" /></a></td>
</tr>
</tbody>
</table>

Getting MonoDevelop
-------------------

Instructions about how to get MonoDevelop are available in MonoDevelop's [Download](/download/) page.

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
| German              | Gustav Schauwecker, Martin Dederer                                                           |
| Spanish             | Antonio Ognio, Alejandro Serrano, Andrés G. Aragoneses                                       |
| French              | Vincent Daron, Nicolas Favre-Félix                                                           |
| Galician            | Ignacio Casal Quinteiro                                                                      |
| Hungarian           | Gergely Kiss                                                                                 |
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
