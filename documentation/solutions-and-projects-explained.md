---
title: Solutions and Projects Explained
redirect_from:
  - /Documentation/Solutions_and_Projects_explained/
---

1: What are Solutions and Projects?
-----------------------------------

### Solutions

In MonoDevelop, a **Solution** is a container for all your projects that belong together. It's used to group related Projects together, but it's possible to reference from a Project in a Solution to a Project in another Solution. By using a Solution, it's easy to configure settings for all the projects. When a new Project is created, it inherits the settings from its parent Solution. The settings can be edited for each Project. The benefits of a Solution are mainly the following:

-   Specifying build order.
-   Easy referencing projects to each other.

**Workspaces** are used to group solutions together, but putting your solutions in the same workspace doesn't give you additional functionality, so it doesn't affect your dependencies, references...

### Projects

A Project contains all the source code and resources for a program or a library. In MonoDevelop, there are also Projects for Translations or Packages.

2: Creating Solutions and Projects
----------------------------------

### Creating Solutions

You can always create a new **Solution** by selecting *New* from the *File* menu and then clicking *Solution*. You will get a dialog to choose what your first project in the Solution will be (see Projects). You can also define the place where to save the solution and the solution name. When you run your solution, the Startup Project(s) is/are started. If you want to run a specific Project, just right click on the Project's name and choose *Run Item*.

### Creating Projects

Adding a project to a solution is as easy as right clicking on the solution name and choosing *Add* and *Existing Project* or *New Project*. When you choose the later, you will get a dialog where you can choose the project type. Select the one you want and give the project a name. After clicking *Forward*, you get some options to add to your solution. You can add **translation support** and/or **package construction**, these two are projects which will be added to the solution. The translation support contains the data for the internationalization of your application. Package construction contains binaries and archives to distribute your application. In the options list, you can choose for **Unix integration** (better integration of a library or application for Unix-based systems) and **Gtk# support** (enabling Gtk# to design windows visually) as well. For each option, you can select several suboptions.

3: Organizing
-------------

### 3.1: Adding Solution Folders

When you have multiple projects in your solution, **organizing your Projects in Solution Folders**can help working faster. You can add a Solution Folder to a Solution by right clicking on the Solution Name and choosing *New Solution Folder *<span style="font-weight: normal;">from the *Add*<span style="font-weight: normal;">item.

4: Settings
-----------

### 4.1: Adding references to other projects

When you create larger solutions, you'll often want to add a**reference to another project**. This can be the case when you've created a library. To do so, you only have to right click on the *References* item for the project that needs references and choose *Edit references*. In the tab *Projects*, you'll get a list of all possible projects to link to in the current solution. Choose the one(s) you need and click *OK*.
 When you want to remove references, select the one to remove and click on the *-* button on the right.

### 4.2: Changing the 'Startup Project'

If you have multiple projects and you want to change the 'Startup Project', right click on the name of the project and choose *Set as Startup Project*. You can also edit the **Startup Project** in the Solution options (right click on the *Solution* name in the Solution View and choose *Options*, then select the *Startup Project* item in the list on the left, here you can also set multiple Startup Projects.

To run a **specific Project**, right click on its name and choose *Run Item*.

### 4.3: Debugging and Releasing

For each build configuration, you can edit the settings for each Project. You can change the build configuration settings in the Solution Options dialog, by selecting *Configurations* in the *Build* category. There are options for Debugging and Releasing for each available platform.

### 4.4: Naming Policies

It's possible to set default Naming Policies in a Solution (Solution Options dialog, .NET Naming Policies). Each project in that solution has an option to inherit the parent's settings or use specific settings. Naming Policies are the settings for the names of your namespaces. MS Visual Studio doesn't use only the name of the directory, so it can be useful to look at these settings.

5: Project Types
----------------

As mentioned above, a project is a part of a solution. There are several types of projects: there are e.g.:

-   Console project
-   Gtk# project
-   Library
-   Translation project
-   Packaging project
-   ...

### 5.1: Packaging projects

When you want to distribute a project, you can add a **Packaging project** to the solution (category *Other*). You can either choose for a Packaging project for each program, or to generate one for multiple projects. When you configure the project, you have the opportunity to enable **binaries** for respectively Windows and Linux. There's also an option for making tarballs. Changing the configuration of the Packaging project is always possible. You can add new package types or delete the existing ones.

### 5.2: Translation projects

Internationalization is making your application available in several languages. MonoDevelop helps you doing this by providing the possibility to add translation projects to a solution. MonoDevelop translation makes use of GetText. Adding a translation project to an existing solution is done the same way as adding another project type. *Translation project* can be found in the *Other* category in the *Add new Project* dialog. MonoDevelop will ask you for the languages you want to support. Simply click add or remove to change the list.

You can add new translations later by right clicking on the **Translation project** name and choosing *Add Translation*. For each language, there will be an subitem in the Translation project item. You can edit them by double clicking on the subitem.

6: File Formats
---------------

Solutions are saved in a file with the '.sln' extension.

Different Project types have different extensions, but they all end with '**.\*proj**'. The '**.\*proj**' fies are saved in the project directory (a subfolder of the solution folder), except the Packages project file, which is stored in the Solution directory. 

The Project Files are the same as the Project files used by Microsoft Visual Studio, and for the Project types that don't have a specific extension, '.mdproj' is used.

A list of the most common extensions:

-   vbproj: Visual Basic .NET
-   csproj: C# .NET
-   vcxproj: C/C++
-   fsproj: F#
-   booproj: Boo
-   ilproj: Il
-   mdproj: Other
-   proj: Generic MSBuild project

*Note that in fact the extension doesn't matter.*
