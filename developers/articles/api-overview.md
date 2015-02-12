---
title: API Overview
redirect_from:
  - /Developers/Articles/API_Overview/
---

Introduction
------------

The MonoDevelop API is extensive and still changing. This article provides an overview of this API, explaining where to find the most important services and how to use them.

The API is split in three layers:

-   The **Core** layer provides basic services such as logging, progress monitoring or file management which are used through the whole IDE.
-   The **Projects** layer implements the project object model. It provides methods for reading, writing and building projects, as well as a parsing service.
-   The top layer is the **IDE** itself.

It is worth noting that the **Core** and **Projects** layers are not tied to the IDE application, so it is possible to create independent applications which make use of those services.

Core Services
-------------

### Add-in Engine

The add-in engine API is explained in detail in the [Mono.Addins Reference Manual](http://www.mono-project.com/Mono.Addins_Reference_Manual).

### Information about installed assemblies, frameworks and runtimes

The object `MonoDevelop.Core.Runtime.SystemAssemblyService` provides methods for getting installed frameworks and runtimes. Once you have a TargetRuntime object you can query information about installed packages and add-ins. Using this API you can:

-   Get a list of installed runtimes.
-   Get a list of installed frameworks, for each runtime.
-   Get a list of packages installed for a given runtime.
-   Get the list of assemblies of a package
-   Given an assembly name, find the location of the assembly, or the package providing it
-   Given a partial assembly name, get the full name

Here are some classes you can use:

|-------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| *<span style="font-size: smaller;">MonoDevelop.Core</span>* **Runtime.SystemAssemblyService**   | Provides methods for getting installed frameworks and runtimes.                             |
| *<span style="font-size: smaller;">MonoDevelop.Core.Assemblies</span>* **TargetRuntime**        | Information about a runtime. Provides methods for getting installed packages and assemblies |
| *<span style="font-size: smaller;">MonoDevelop.Core.Assemblies</span>* **TargetFramework**      | Information about a framework                                                               |
| *<span style="font-size: smaller;">MonoDevelop.Core.Assemblies</span>* **SystemAssembly**       | Information about an assembly, including name, version and location.                        |

### Localization

Add-ins must use add-in localizers for translating strings in the code. See the [Getting Localized Strings](http://www.mono-project.com/Mono.Addins_Reference_Manual#Getting_Localized_Strings) of the Mono.Addins [reference manual](http://www.mono-project.com/Mono.Addins_Reference_Manual) to learn how to do it.

The class `MonoDevelop.Core.GettextCatalog` can be used to get translated strings in the main IDE solution.

|------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| <span style="font-size: smaller;">*MonoDevelop.Core*</span> **GettextCatalog**           | This class can be used to get translated strings in the main IDE solution. |
| <span style="font-size: smaller;">*Mono.Addins*</span> **AddinManager.CurrentLocalizer** | To be used in add-ins to get translated strings.                           |

### Logging

|--------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span style="font-size: smaller;">*MonoDevelop.Core*</span> **LoggingService** | This class provides methods for logging debug, information, warning and error messages. Those messages are written to the console from which MD started and also to an internal log shown in the Message Log pad (View/Other Windows/Message Log). |

### Global Configuration Properties

|---------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span style="font-size: smaller;">*MonoDevelop.Core*</span> **PropertyService** | This class can be used to store global configuration properties. Add-ins can use it to store custom configuration information (although that information won't be removed if the add-in is uninstalled).
                                                                                    The PropertyService class also has a **ConfigPath** property for getting the path where all configuration information is stored, so add-ins can also store create configuration files there.             |
| <span style="font-size: smaller;">*MonoDevelop.Core*</span> **Properties**      | Allows creating nested groups of properties.                                                                                                                                                             |

### Parsing Strings with Tags

The `MonoDevelop.Core.StringParserService` class can be used to parse strings which contain tags and replace them with actual values. For example:

``` csharp
var values = new Dictionary<string,object> ();
values ["name"] = "Novell Inc";
values ["year"] = 2010;
string result = StringParserService.Parse ("Copyright (c) ${year} ${name)", values);
// The result will be: "Copyright (c) 2010 Novell Inc"
```

This service is explained in detail in the [String Parser Service article](/developers/articles/the-string-parser-service/).

### Execution of Processes and External Commands

The object ***MonoDevelop.Core*****.Runtime.ProcessService** offers several ways of starting processes.

#### Running a process

ProcessService has many overloads of the method **StartProcess** which allows running a process. Those overloads make it easier to collect output from the process.

#### Running a managed process

To execute an assembly, instead of starting a "mono" process, the best option is to use the **TargetRuntime.ExecuteAssembly** method. For example:

``` csharp
Runtime.SystemAssemblyService.CurrentRuntime.ExecuteAssembly ("someAssembly.exe", "some args");
```

This method allows running an assembly using a specific runtime, and will work both for Mono and MS.NET runtimes.

#### Creating an object running outside the main MonoDevelop process

The `CreateExternalProcessObject` method can be used to create an object which runs outside the main MonoDevelop process. ProcessService takes care of creating the external process and setting up the remote comunication. The methods takes as parameter the type of the object to create, which must be of type ***MonoDevelop.Core.Execution.*****RemoteProcessObject**.

### Working with the File System

|-----------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span style="font-size: smaller;">*MonoDevelop.Core*</span> **FileService** | Provides methods for managing files and directories.
                                                                                It is important to notice that file operations done through this class are monitorized by the IDE and by add-ins. FileService has several events which are fired when files are modified, moved, deleted, etc. So for example, if you need to delete a file, you have to do it through FileService if you want the IDE to react to the deletion (e.g. the IDE would automaticaly close the file if it is opened).  |
| <span style="font-size: smaller;">*MonoDevelop.Core*</span> **FilePath**    | This struct represents a file or directory path. All API using paths must use this class, because it takes into account file system particularities of the running platform. For example, path comparisons on windows will be case insensitive.                                                                                                                                                                    |

### Working with Text Files

The `MonoDevelop.Projects.Text` namespace has several classes which help working with text files.

|-----------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span style="font-size: smaller;">*MonoDevelop.Projects.Text*</span> **TextFile**       | This class can be used to load/save a text file using a specific encoding or automatically detecting it, and provides methods for accessing the content, such as for example file/column to offset conversion.                                                                             |
| <span style="font-size: smaller;">*MonoDevelop.Projects.Text*</span> **TextFileReader** | A text reader with the same encoding detection that the TextFile class supports.                                                                                                                                                                                                           |
| <span style="font-size: smaller;">*MonoDevelop.Projects.Text*</span> **TextFormatter**  | This class can be used to format a block of text with some provided formatting options. It could be used for example to generate a text of file using a tab sice of 4 and limiting lines to 80 columns. The formatting can take care of converting tabs to spaces and wrapping long lines. |

### Progress Monitoring and Asynchronous Operations

Many methods in the MonoDevelop API take as parameter a progress monitor, an object implementing `IProgressMonitor`. Those are usually methods which perform long operations and which use this object to provide feedback about the progress of the operation.

There are also several methods in the API which execute asynchronously. Those methods sometimes take an `IProgressMonitor` as parameter (where progess will be reported) and return an `IAsyncOperation` object, which the caller can use to control the execution of the operation. For example, it allows canceling the operation or waiting until completed.

The `MonoDevelop.Core.ProgressMonitoring` and `MonoDevelop.Core.Gui.ProgressMonitoring` namespaces provide several useful classes for implementing progress monitors and for combining them.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><span style="font-size: smaller;"><em>MonoDevelop.Core.ProgressMonitoring</em></span><br /> <strong>NullProgressMonitor</strong></td>
<td align="left"><p>This is the most basic implementation of a progress monitor. It doesn't report progress anywere, although it is fully functional. For example, you can get an IAsyncOperation object from the AsyncOperation property you can use to cancel the operation.</p>
<p>This class can be also used as a base class for more complex progress monitors.</p></td>
</tr>
<tr class="even">
<td align="left"><p><span style="font-size: smaller;"><em>MonoDevelop.Core.ProgressMonitoring</em></span><br /> <strong>SimpleProgressMonitor</strong></p></td>
<td align="left">A simple progress monitor which keeps track of progress in a ProgressTracker object, acessible through a protected property. It is useful as a base class for implementing progress monitors.</td>
</tr>
<tr class="odd">
<td align="left"><span style="font-size: smaller;"><em>MonoDevelop.Core.ProgressMonitoring</em></span><br /> <strong>ConsoleProgressMonitor</strong></td>
<td align="left">A progress monitor which logs output to the standard output.</td>
</tr>
<tr class="even">
<td align="left"><p><span style="font-size: smaller;"><em>MonoDevelop.Core.ProgressMonitoring</em></span><br /> <strong>SynchronizedProgressMonitor</strong></p></td>
<td align="left">A progress monitor that wraps another progress monitor and makes it thread safe.</td>
</tr>
<tr class="odd">
<td align="left"><span style="font-size: smaller;"><em>MonoDevelop.Core.ProgressMonitoring</em></span><br /> <strong>AggregatedProgressMonitor</strong></td>
<td align="left">This class can be used to aggregate several progress monitor in a single one. For example, you can use it to show the progress in several monitors at the same time, such as a log window and the status bar. You would create an AggregatedProgressMonitor instance, and then you would register the other monitors on it. Then you would provide the aggregated monitor to the method running the operation.</td>
</tr>
<tr class="even">
<td align="left"><span style="font-size: smaller;"><em>MonoDevelop.Core.ProgressMonitoring</em></span><br /> <strong>AsyncOperation</strong></td>
<td align="left">An implementation of IAsyncOperation. You can use it when implementing your own progress monitor.</td>
</tr>
<tr class="odd">
<td align="left"><span style="font-size: smaller;"><em>MonoDevelop.Core.ProgressMonitoring</em></span><br /> <strong>LogTextWriter</strong></td>
<td align="left">This TextWriter subclass allow chaining several text writers. All text written to the writter will be replicated to all chained writters.</td>
</tr>
<tr class="even">
<td align="left"><span style="font-size: smaller;"><em>MonoDevelop.Core.ProgressMonitoring</em></span><br /> <strong>AggregatedOperationMonitor</strong></td>
<td align="left"><p>This class can be used to synchronize asynchronous operations. For example, when implementing a method which takes an IProgressMonitor as parameter and which needs to internally execute an asynchronous operation and wait for it to complete. You would do something like this:</p>
<p><code>public void DoLongLastingOperation (IProgressMonitor monitor) {     // ...     AggregatedOperationMonitor om = new AggregatedOperationMonitor (monitor);     IAsyncOperation aop = StartSomeAsyncOperation ();     om.AddOperation (aop);     om.WaitForCompleted ();     om.Dispose ();     // .... }</code></p>
<p>In this example, DoLongLastingOperation needs to internally execute an async operation. The AggregatedOperationMonitor object wraps the progress monitor of the method, and will propagate cancel requests to the child async operations.</p></td>
</tr>
</tbody>
</table>

### General Purpose Data Serializer

MonoDevelop provides a data serializer which can be used by add-ins to serialize data to files. This serializer is also used by the project service to read and write projects and solutions. This API is available in the `MonoDevelop.Core.Serialization` namespace.

See [Using The Data Serializer](/developers/articles/using-the-data-serializer/) for more information.

### Integration with the Desktop

|----------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| <span style="font-size: smaller;">*MonoDevelop.Core.Gui*</span> **DesktopService**     | This class can be used to query some platform-specific information such as mime type data and installed applications. |
| <span style="font-size: smaller;">*MonoDevelop.Core.Gui*</span> **DesktopApplication** | Provides information about an installed                                                                               |

Core GUI Services
-----------------

### Image and Stock Icon Management

The class `MonoDevelop.Core.Gui.ImageService` provides several methods for managing images and stock icons:

|-----------------------------------------------------------|-------------------------------------------------------------|
| **GetPixbuf ()**, **GetColourBlock ()**, **GetImage ()**  | Get a Gdk.Pixbuf or Gtk.Image from an icon name and size    |
| **GetStockId ()**, **GetStockIdFromResource ()**          | Get an icon name for a file or resource containing an image |

### Displaying Alerts and other Message Dialogs

#### The Message Service

The class `MonoDevelop.Core.Gui.MessageService` provides methods for showing alert and other message dialogs.

Here are some of the most useful methods:

|------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| **ShowException ()**   | Shows an error message with detailed information about an exception (this information is hidden by default, but it can be made visible by the user). |
| **ShowError ()**       | Shows an error message.                                                                                                                              |
| **ShowWarning ()**     | Shows a warning message.                                                                                                                             |
| **Confirm ()**         | Shows a confirmation message to the user. The message dialog will have two buttons: Cancel and an AlertButton provided by the caller.                |
| **AskQuestion ()**     | Shows a message dialog asking a question to the user, and offers a set of AlertButtons the user can click on to answer.                              |
| **GetTextResponse ()** | Presents a question and an entry to the user.                                                                                                        |

Some of those methods take a `MonoDevelop.Core.Gui.AlertButton` as parameter. There are several pre-defined alert buttons, such as `AlertButton.Ok`, `AlertButton.Close`, `AlertButton.Cancel`, etc (all defined as static members of `AlertButton`). You can also create your own AlertButton instances with custom icons and response codes.

The arguments for the `Confirm` and `AskQuestion` methods can also be provided using objects of type `ConfirmationMessage` and `QuestionMessage` respectively. Using those objects it is possible to specify the same arguments available in the other overloads, but they allow specifying additional options:

|-----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **AllowApplyToAll**   | When set, the message dialog will show a checkbox with the message "Apply to all". If the user activates it, subsequent calls to Confirm or AskQuestion will automatically return the value selected when the option was activated. |
| **AddOption ()**      | Adds an additional option to the dialog, which is shown as a checkbox.                                                                                                                                                              |
| **GetOptionValue ()** | Returns the value of an option.                                                                                                                                                                                                     |
| **SetOptionValue ()** | Sets the value of an option.                                                                                                                                                                                                        |

Here is an example:

``` csharp
public static void DeleteFiles (string[] files)
{
    // Creates the confirmation dialog data object and specifies that
    // it has to show the "Apply to all" checkbox
    ConfirmationMessage msg = new ConfirmationMessage ();
    msg.ConfirmButton = AlertButton.Delete;
    msg.ApplyToAllButton = true;

    foreach (string file in files) {
        // Shows the confirmation dialog to the user
        // If the user activated the "Apply to all" checkbox,
        // this call will not show the dialog and will return the value
        // selected when the option was activated.
        msg.Text = string.Format ("Do you want to delete the file '{0}'?", file);
        if (MessageService.Confirm (msg))
            File.Delete (file);
    }
}
```

#### Additional Dialogs

There are also a couple of dialogs which can be used to display messages:

|------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span style="font-size: smaller;">*MonoDevelop.Core.Gui.Dialogs*</span> **ErrorDialog**        | A generic error dialog.                                                                                                                                                |
| <span style="font-size: smaller;">*MonoDevelop.Core.Gui.Dialogs*</span> **MultiMessageDialog** | A dialog which allows displaying a set of messages (errors or warnings). It can be used for to show a list of errors and warnings reported through a progress monitor. |

### Common Widgets and Dialogs

MonoDevelop implements several widgets which can be reused by add-ins:

|--------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| <span style="font-size: smaller;">*MonoDevelop.Components*</span> **FileEntry**                  | An entry with a button which allows selecting a file.                                                                         |
| <span style="font-size: smaller;">*MonoDevelop.Components*</span> **FolderEntry**                | An entry with a button which allows selecting a folder                                                                        |
| <span style="font-size: smaller;">*MonoDevelop.Components*</span> **ListView**                   | A simple list view which shows an icon and a label for every item.                                                            |
| <span style="font-size: smaller;">*MonoDevelop.Components*</span> **TooltipWindow**              | Abstract class which implements most of the functionality required for displaying custom tooltip windows.                     |
| <span style="font-size: smaller;">*MonoDevelop.Components*</span> **DataGrid**                   | A simple data grid (used for example to display database query results).                                                      |
| <span style="font-size: smaller;">*MonoDevelop.Components.Chart*</span> **BasicChart**           | A simple chart.                                                                                                               |
| <span style="font-size: smaller;">*MonoDevelop.Components.PropertyGrid*</span> **PropertyGrid**  | A property grid which can automatically show and allows editing the properties of an object (based on System.ComponentModel). |
| <span style="font-size: smaller;">*MonoDevelop.Ide.Gui.Components*</span> **ExtensibleTreeView** | A tree view whose behavior can be customized and extended by add-ins.                                                         |

Project Model Services
----------------------

The `Projects` layer implements the project object model. It provides methods for reading, writing and building projects, as well as a parsing service.

### Creating, Reading, Writing and Exporting Projects

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><span style="font-size: smaller;"><em>MonoDevelop.Projects.Services</em></span><br /> <span style="font-weight: bold;">ProjectService</span></p>
<p> </p>
<p><span style="font-size: smaller;"><em>MonoDevelop.Ide.Gui</em></span><br /> <span style="font-weight: bold;">IdeApp.Services.ProjectService</span></p></td>
<td align="left"><p>This class provides several methods for:</p>
<ul>
<li>Creating new projects, using information from a template.</li>
<li>Reading and writing solution items (including projects) and workspace items (including solutions and workspaces).</li>
<li>Checking if a file is a known project or solution.</li>
<li>Exporting items from one format to another format.</li>
<li>Getting and setting the default file format.</li>
<li>Getting and setting the default target framework.</li>
</ul></td>
</tr>
</tbody>
</table>

### Generating and Manipulating Code

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><span style="font-size: smaller;"><em>MonoDevelop.Projects.CodeGeneration</em></span><br /> <span style="font-weight: bold;">CodeRefactorer</span></td>
<td align="left"><p>This class can be used to generate code in new or existing classes. The api is language-agnostic, although not all operations are available for all languages. The most important operations are:</p>
<ul>
<li>Create a class.</li>
<li>Rename a class or a class member.</li>
<li>Find all references to a class or class member.</li>
<li>Add a member to a class.</li>
<li>Remove a member from a class.</li>
<li>Implement overridable or interface members.</li>
<li>Add a custom attribute to a class.</li>
</ul></td>
</tr>
</tbody>
</table>

### Querying information about types

|----------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| <span style="font-size: smaller;">*MonoDevelop.Core.Gui*</span> **DesktopService**     | This class can be used to query some platform-specific information such as mime type data and installed applications. |
| <span style="font-size: smaller;">*MonoDevelop.Core.Gui*</span> **DesktopApplication** | Provides information about an installed                                                                               |

### Management of Project and Solution Policies

|--------------------------------------------------------------------------------------------------|-----|
| <span style="font-size: smaller;">*MonoDevelop.Projects.Dom.Parser*</span> **ProjectDomService** |     |
| <span style="font-size: smaller;">*MonoDevelop.Projects.Dom.Parser*</span> **ProjectDom**        |     |

### Language Bindings

|--------------------------------------------------------------------------------------------|-----|
| <span style="font-size: smaller;">*MonoDevelop.Projects*</span> **LanguageBindingService** |     |

IDE Services
------------

### Working with the Main Window of the IDE

The obect `MonoDevelop.Ide.Gui.IdeApp.Workbench` provides all you need to show and manage information in the main window of the IDE. It allows opening and managing documents (files), pads (such as the solution pad or the errors pad), and the main window layout.

#### Opening and Managing Documents

The obect `MonoDevelop.Ide.Gui.IdeApp.Workbench` provides several operations for working with documents:

|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Documents**            | This property returns a list of all documents (files) opened in the IDE.                                                                                                                        |
| **ActiveDocument**       | Returns the document that has the keyboard focus.                                                                                                                                               |
| **GetDocument ()**       | Returns the document for the given file name.                                                                                                                                                   |
| **SaveAll ()**           | Saves all documents.                                                                                                                                                                            |
| **CloseAllDocuments ()** | Closes all documents.                                                                                                                                                                           |
| **GetFileViewers ()**    | Given a file name, returns a set of FileViewer objects which can be used to open the file.                                                                                                      |
| **OpenDocument ()**      | Opens a document. It has several overloads, which allow opening a document from a file, or using a specific view implementation. If the file is already opened, the document will be activated. |
| **NewDocument ()**       | Creates a new unsaved document.                                                                                                                                                                 |
| **GetFileViewers ()**    | Returns a list of FileViewer objects you can use to open a given file.                                                                                                                          |

#### Accessing the Content and Controlling Opened Documents

To access the content of a document you need to get a `MonoDevelop.Ide.Gui.Document` object. You can get it using some of the properties and methods of the `MonoDevelop.Ide.Gui.IdeApp.Workbench` object (see above).

Here are some of the most useful methods and properties of the Document class:

|-----------------------|---------------------------------------------------------------------------------------------------------------------------------|
| **Name**              | Display name of the document                                                                                                    |
| **FileName**          | Name of the file that the document represents.                                                                                  |
| **IsFile**            | Returns true if the document is a file (for example, the welcome page is a document, but it doesn't represent a file).          |
| **IsDirty**           | Gets or sets the modified flag of the document                                                                                  |
| **Project**           | Project to which the file is bound (can be null).                                                                               |
| **TextEditor**        | If the document is a text editor, returns an object which can be used to manipulate the content of the editor (null otherwise). |
| **GetContent (Type)** | Given an interface type, it returns an implementation of that interface, provided by the view showing the document.             |
| **Select ()**         | Brings the document to the front and gives it the focus.                                                                        |
| **Save ()**           | Saves the document, asking for the file name if not set.                                                                        |

#### Managing Pads

The `Workbench` object provides the following methods for managing pads:

|--------------------|-------------------------------------------------------------------------------------------------------------------------------|
| **Pads**           | A collection of all pads (visible or not)                                                                                     |
| **ShowPad ()**     | Registers a new pad and shows it in the main window.                                                                          |
| **AddPad ()**      | Same as ShowPad, but it doesn't show the pad. The pad will be available in the View menu, but it won't be visible by default. |
| **GetPad\<T\> ()** | Returns a pad which has an object of the given type as content.                                                               |

#### The Status Bar

The obect `MonoDevelop.Ide.Gui.IdeApp.Workbench.StatusBar` provides several operations for showing information in the status bar:

|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **ShowMessage ()**    | Displays a message and an optional icon in the status bar.                                                                                                                                                                                                    |
| **ShowError ()**      | Displays an error message in the status bar.                                                                                                                                                                                                                  |
| **ShowWarning ()**    | Displays an warning message in the status bar.                                                                                                                                                                                                                |
| **ShowStatusIcon ()** | Shows an icon at the right of the status bar. This method returns a StatusIcon object you can use to manage and get events from that icon. For example, you can set the tooltip, make it blink, or get an EventBox which will fire mouse events for the icon. |
| **CreateContext ()**  | Creates a new status bar context (see below)                                                                                                                                                                                                                  |

It is also possible to show a progress bar in the status bar by using a status bar progress monitor. You can get such monitor from `MonoDevelop.Ide.Gui.IdeApp.Workbench.ProgressMonitors.GetStatusProgressMonitor ()`.

The `CreateContext()` method returns an object of type StatusBarContext which can be used to show messages in the status bar, just like when you call ShowMessage directly on the status bar. The difference is that when the StatusBarContext object is disposed, the message shown through the context will be cleared, restoring any message previous to the context creation.

Status bar contexts are useful for example to display temporary progress status, or to show some information while the user is hovering over some visual component.

Here is an example:

``` csharp
// Display "Ready" in the status bar
IdeApp.Workbench.StatusBar.ShowMessage ("Ready");

StatusBarContext ctx = IdeApp.Workbench.StatusBar.CreateContext ();
using (ctx) {
    ctx.ShowMessage ("Doing some work");
    // The status bar now shows "Doing some work"
    ...
}

// When the context is disposed, the old message is restored,
// so the status bar will now show "Ready" again
```

#### Changing the Layout of the Main Window

The following methods are defined in the `MonoDevelop.Ide.Gui.IdeApp.Workbench` object.

|-------------------|--------------------------------------------------------------------------------|
| **CurrentLayout** | This property allows getting or setting the current layout of the main window. |
| **Layouts**       | Returns a list of all defined layouts.                                         |
| **LockGui ()**    | Disables all menus and toolbar buttons.                                        |
| **UnlockGui ()**  | After calling LockGui, enables again all menus and toolbar buttons.            |

### Accessing the Project Model

The `MonoDevelop.Ide.Gui.IdeApp.Workspace` object provides many methods, properties and events for working with the current loaded solution (or solutions, since MonoDevelop allows opening several solutions at once). Here are some of the most important members:

|---------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **ActiveConfiguration**                                                                     | The configuration currently selected by the user.                                                                                                                |
| **IsOpen**                                                                                  | Returns true if there is any solution open in the IDE.                                                                                                           |
| **Items**                                                                                   | A list of all top level solutions or workspaces opened in the IDE.                                                                                               |
| **GetAllItems\<T\> (), GetAllProjects (), GetAllSolutionItems\<T\> (), GetAllSolutions ()** | Those methods can be used to get a list of workspaces, solutions or solution items loaded in the IDE. It looks recursively through all workspaces and solutions. |
| **OpenWorkspaceItem ()**                                                                    | Loads a workspace or solution.                                                                                                                                   |

### Project Operations: Loading, Saving, Building, Displaying Options

The Project Object Model provides methods for loading, building and do all sort of operations with projects and solutions. However, those are low level operations which don't provide direct feedback to the user.

The `MonoDevelop.Ide.Gui.IdeApp.ProjectOperations` object provides several methods for doing the same set of operations, and it provides feedback to the user through the status bar, output pads, or other IDE resources.

The most important operations you can do with this object are:

|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| **Build ()**          | Builds a project, solution or file. Progress is shown in the status bar. Output is written in the Build Output pad.                      |
| **Execute ()**        | Executes a project, solution or file. The output of the process is shown in an Output pad if the Use External Console option is not set. |
| **ShowOptions ()**    | Shows the options dialog for a given project or solution.                                                                                |
| **Save ()**           | Saves a project or solution. Progess is shown in the status bar. Errors and warnings are shown in a dialog.                              |
| **AddSolutioItem ()** | Shows the Add Project dialog, so the user can select a project type. Then creates the project and adds it to the solution.               |

Some of those operations (such as Build) are asynchronous. All asynchronous operation return an `IAsyncOperation` object that can be used to control the operation. It can be used for example to cancel it or to wait until it is complete.

### Displaying Progress and Process Output

If you need to perform a long operation in the background, the IDE offers several stock progress monitors you can use to show feedback to the user. Those progress monitors are provided by the `MonoDevelop.Ide.Gui.IdeApp.Workbench.ProgressMonitors` object. You can use the following methods to create new monitors:

|-------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| **GetBuildProgressMonitor ()**      | Creates a monitor for build operations. Progress is shown in the status bar. Output is written in the Build Output pad.                                |
| **GetRunProgressMonitor ()**        | Creates a monitor for execution operations. Output is written in the Application Output pad.                                                           |
| **GetOutputProgressMonitor ()**     | Creates a monitor which writes the output in an Output pad.                                                                                            |
| **GetLoadProgressMonitor ()**       | Creates a monitor for load operations. Progress is shown in the status bar. Errors and warnings are shown in a dialog when the operation is completed. |
| **GetSaveProgressMonitor ()**       | Creates a monitor for load operations. Progress is shown in the status bar. Errors and warnings are shown in a dialog when the operation is completed. |
| **GetSearchProgressMonitor ()**     | Creates a monitor for search operations. Progress and results of the search are shown in a Search Results pad. It supports multiple search instances.  |
| **GetStatusProgressMonitor ()**     | Creates a monitor wich shows progress in the status bar.                                                                                               |
| **GetBackgroundProgressMonitor ()** | Creates a monitor wich shows an icon in the status bar. The tooltip of the icon is the current task description.                                       |

There are also other classes which can be used to show progress in a dialog:

|-----------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| <span style="font-size: smaller;">*MonoDevelop.Core.Gui.ProgressMonitoring*</span> **MessageDialogProgressMonitor**   | Shows the progress in a dialog which has a progress bar and an optional expandable output view. |
| <span style="font-size: smaller;">*MonoDevelop.Core.Gui.ProgressMonitoring*</span> **MultiTaskDialogProgressMonitor** | Shows the progress in a dialog which has a list of progress bars, one for each top-level task.  |

### IDE Preferences

The `MonoDevelop.Ide.Gui.IdeApp.Preferences` object has several properties for getting and setting IDE preferences. It has also events which are fired when preferences are changed.
