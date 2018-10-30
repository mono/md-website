---
title: Tips
redirect_from:
  - /Documentation/Tips/
  - /Tips/
---

### **Tips to use developing with MonoDevelop**

#### **Working Space behaviors and futures:**

-   *Maximize* your editing space by setting pads to auto-hide.
-   Search pads can be *pinned* so that their results are not lost when further searches are performed.
-   Double-click on an editor tab to *hide all pads*, maximising the editing space. Double-click again to restore the previous state.
-   The Properties Pad *provides contextual properties* for many things. As well as editing widgets in the GUI designer, it can be used to set the deploy/build mode of files in the Solution Pad, the resource ID of resources, and whether a file is to be built or deployed.
-   To *find files/classes* on all the opened projects/solutions press Ctrl+Alt+o or go to 'Search -\> Go to file..' menu, and you will see all the files.
-   The '*File -\> Open file in solution' command* allows you to jump quickly to any file in the solution.

#### **Solutions:**

-   A solution can be *used to group* together the library and application projects that make up your application, allowing them to reference each other.
-   MonoDevelop *can open and save most Visual Studio 2005 and Visual Studio 2008 solution* and project files directly, but not all MonoDevelop or Visual Studio features are fully supported.

#### **General Projects:**

-   If you need to *use an external assembly* in your project, you can just add a reference to it by right-clicking on the References folder in the Solution Pad and selecting it from the list of assemblies registered in your system, a list of projects in the current Solution, or any assembly that exists on your filesystem
-   *Add a translation project* to your solution to translate it using Gettext.
-   You can *control how a file is treated in your project*, whether it is included in the build, embedded as a resource, included in deployment, or ignored yet still included in the file list. To change these options for each file, open the Properties Pad by going to 'View -\> Properties', and select the file you want from your project file list. You can then select how the file is treated by changing the 'Build -\> Build Action' option the the Properties tab.
-   You can *change the targeted runtime* -- 1.1, 2.0, Silverlight 1.1 -- by right-clicking on the project name in the Solution tab, selecting 'Project Options', and going to 'General -\> Runtime Options'.
-   You can *refresh your project file* list by right-clicking on the project name, and selecting 'Display Options -\> Refresh'. This can be particularly useful if you use the Version Control Addin and you update or commit files externally and need to refresh their updated status inside MonoDevelop.
-   Add a *packaging project* to your solution to package the output of other projects for distribution.
-   *Makefile integration* can be used to synchronize file lists and references to variables in Makefiles, and can invoke Makefile targets to perform builds.
-   In the *C# compiler options*, defines should be separated by commas e.g. VERBOSE,MONO,ETC.
-   If you get any 'Type not found' *compilation errors*, you may be missing a reference to a common assembly such as System or System.Xml. Edit your project's referenced assemblies by right-clicking on the 'References' folder in the Solution Pad and selecting 'Edit references'.

#### **ASP.NET Projects:**

-   When building an ASP.NET project, MonoDevelop can *automatically add fields* representing the controls in aspx pages to their corresponding CodeBehind classes.
-   Editing the *references for an ASP.NET* project will automatically update the web.config file.

#### **Editor:**

-   The *'override'* keyword in C# activates code completion that can stub out overrides for virtual and abstract members from base classes and implementations of members in the interfaces that the class implements.
-   The key combination *Control+Space* can be used to activate the code completion window, if available, anywhere in the code editor.
-   Code navigation and *refactoring operations* can be accessed by *right-clicking on the variables*, types and members in the code editor.
-   *Simple code templates* can be activated by entering the template's code, such as 'scwl', and pressing the Tab key. Templates may be added and edited in the Editor Preferences.
-   Add *XML documentation comments*, which start with '///', and they will show up in tool tips and code completion.
-   In the source editor, *right-clicking* on a field will *allow you to encapsulate* it automatically as a property.
-   When *C# Smart Indentation* is enabled, the *Tab key re-indents* the current line.
-   The 'Rename' context menu command for code identifiers will *automatically find and correct all references*.
-   If you have *'//TODO:'* and other task comments in your code, they will show up in the task list. You can customize it with your own like '//THINK:' or '//RESEARCH:'.

#### **Gtk# Designer:**

-   Designing a form with Gtk# involves *packing widgets* into nested containers. Widget sizes and positions are calculated automatically, depending on the size of the form and the widget.
-   When you add an *event handler* in the Gtk# GUI designer using the 'Signals' tab in the Properties Pad, MonoDevelop will add a stub for the method.
-   In Gtk#, create widgets that *inherit Gtk.Bin* and they will show up in the designer's toolbox for easy reuse.

#### **Others:**

-   The *command-line program* 'mdtool' can be used to build MD solutions and generate Makefiles, among other things.
-   If your project is *under version control*, the Status/Commit view can be used to enter messages for each file. These will be used to create a commit message and a ChangeLog entry that you can editr before committing.
-   If you have the *sshfs FUSE filesystem* installed, the Web Deploy dialog can be used to deploy your ASP.NET project to a remote server over SSH.
-   Additional *add-ins may be available* from MonoDevelop's online add-in repositories, providing new or updated functionality. To install them, go to 'Tools -\> Add-in Manager', and click 'Install Add-ins'.
-   The *Subversion integration* makes source control very easy. If not convinced, investigate the ChangeLog integration.
-   When writing applications *that may be used on other platforms* such as Windows, be aware of differences in the path separators and casing of filenames. Detailed guidelines for cross-platform development are available at [Guidelines:Application Portability](https://www.mono-project.com/Guidelines:Application_Portability)
-   For a faster startup, *disable unneeded add-ins* using the Addin Manager.
