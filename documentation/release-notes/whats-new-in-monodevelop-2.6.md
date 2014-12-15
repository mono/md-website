---
title: What's new in MonoDevelop 2.6
redirect_from:
  - /Download/What's_new_in_MonoDevelop_2.6/
---

Version Control
---------------

#### GIT Support

The version control subsystem in MonoDevelop now supports GIT. The basic version control commands already available for the Subversion support are now available for GIT:

-   The **Add/Remove** commands can be used to add or remove files to the git repository.
-   The **Review Changes** command shows files that have changed in a directory, and allows committing the changes
-   The **Revert** command restores modified files by doing a soft reset and a checkout.
-   [![md26-GitBranchManager.png](/images/302-md26-GitBranchManager.png)](/images/302-md26-GitBranchManager.png "Branch and Remote Manager")The **Update** command updates a project from a remote repository by using a pull+rebase operation. Uncommitted changes are automatically saved and restored after the update.
-   The **Publish** command initializes a GIT repository in the solution directory and pushes the initial commit to a remote repository.

Also, some GIT specific commands have been added:

-   The **Push Changes** command corresponds to 'git push'. It allows selecting the target remote/branch.
-   The **Switch to Branch** command can be used to checkout a branch.
-   [![md26-ChangesView.png](/images/308-md26-ChangesView.png)](/images/308-md26-ChangesView.png "Changes View")The **Merge** and **Rebase** commands allows merging a branch with the current one.
-   The **Stash** and **Pop Stash** commands allow saving changes in the working directory. The **Manage stages** command shows a list of saved stashes.
-   The **Create Git Repository** allows initializing a repository for an existing project.
-   The New Solution dialog now has an option which allows creating a local Git repository for the new solution.

In addition, there is a **Manage Branches and Remotes** command which allows browsing, creating and deleting branches and remotes.

The GIT backend is implemented using the [NGit](https://github.com/slluis/ngit) library, which is a port of [JGit](http://eclipse.org/jgit) to .NET (details [here](http://foodformonkeys.blogspot.com/2010/10/ngit.html)).

#### **Improved Version Control Views**

[![md26-Blame.png](/images/309-md26-Blame.png)](/images/309-md26-Blame.png "Changes View")The **Log** and **Blame** windows are now integrated in the editor window as alternate views.

The **Log** view has a new design which makes it easier to browse the history of a project or file. **Gravatar icons** if the commit authors are now shown in the history. **Search** support has been added.

The new **Changes** view (also shown integrated with the text editor) can be used to see changes between a file being edited and the last committed version of the file, or between any two versions of the file.

#### **New Conflict Resolution Window**

A new conflict resolution dialog is shown when a conflict is detected while updating from a remote repository.

Project Model
-------------

#### **User defined policies**

[![md26-CustomPolicies.png](/images/306-md26-CustomPolicies.png)](/images/306-md26-CustomPolicies.png "Custom Policies")The concept of "Policies" was introduced in MonoDevelop 2.4. Policies are settings which can be applied per-solution and per-project. Policies include settings like code formatting rules, standard header for files or naming policies.

In this release, we introduce support for **user defined policy sets**. Users can now define a set of policies and give it a name. This policy set can then be applied as a whole or policy by policy to a project.

User defined policies can be imported from existing projects, or from a file. Policies can also be exported to a file or applied to an existing project.

#### Default policy options integrated in the main preferences dialog

The default policy options are the options that are applied when creating a new project. In previous releases those options were edited in a 'Default Policies' dialog. In this release, those options are integrated in the main preferences dialog, and allow selecting options from predefined policy sets.

#### **Support for .NET 4.0**

This release includes support for .NET 4.0 projects

#### Other Improvements

-   Improved compatibility with Visual Studio projects
-   New "add folder to project" command This new command allows recursively adding all files in a folder to a project.
-   Improved support for XBuild.

Source Editing
--------------

#### **MCS based parser and formatting engine**

The C# parser which is used to support code completion has been rewritten in this release and it is now based on the MCS compiler. By reusing MCS's parser, it will be easier to track the latest C# version. It also provides much more accurate on-the-fly syntax errors, and makes on-the-fly formatting more precise.

#### **Improved C# formatting options dialog**

[![md26-CsharpFormatting.png](/images/307-md26-CsharpFormatting.png)](/images/307-md26-CsharpFormatting.png "C# formatting settings dialog")The formatting options for C# are now edited in a new dialog which has more space for showing the available options and the preview code. New formatting options have been added in this release:

-   Added options for blank lines between members.
-   Added spacing options for indexers.
-   The options for setting spaces around commas got removed and now is split up for every construct.
-   Added many white space options for C# constructs.

#### **New path bar**

[![md26-PathBar.png](/images/303-md26-PathBar.png)](/images/303-md26-PathBar.png "The Path Bar")

A new path bar at the top of the text editor allows selecting the active class and member. It provides a more consistent user experience between C# and XML/HTML/ASP.NET files.

#### **Improved VI mode**

Minor improvements to the VI mode. Work on a new architecture has begun but is not yet enabled.

#### **DocFood add-in**

[![md26-DocFood.png](/images/304-md26-DocFood.png)](/images/304-md26-DocFood.png "Doc Food add-in")This new add-in can generate XML documentation for classes and class members. It parses the member name and generates some basic documentation out of it.

#### **<span style="font-weight: bold;">Improved</span> XML editing experience**

Code completion for XML has been improved, and there is now support for basic smart indenting.

Debugger
--------

#### **IL disassembly view**

[![md26-Disassembly.png](/images/305-md26-Disassembly.png)](/images/305-md26-Disassembly.png "Disassembly View")When using Mono's Soft Debugger engine, MonoDevelop is now able to show the IL of the code being debugged in the Disassembly window. The Disassembly window will be automatically shown, for example, when double clicking on a method in the call stack pad for which there is no source code file. It can also be made visible using the "Show Disassembly" command.

#### **Catchpoints and conditional breakpoints in the Win32 debugger**

The Win32 debugger now supports catchpoints, tracepoints and conditional breakpoints.

#### **Improved support for debugging anonymous methods and iterators**

The debugger now allows inspecting the values variables captured by anonymous methods, lambdas and iterators.

#### **New Stop Evaluation command**

The new Stop Evaluation command available in the Debug menu allows canceling the evaluation of methods and properties while the debugger is stopped.

Tools
-----

#### **T4 Templating Engine**

The T4 templating engine now supports preprocessed templates, and has improved compatibility with the Microsoft implementation. 

#### **AnalysisCore**

The experimental AnalysisCore addin provides a base for background analysis of source files, and for suggesting and implementing fixes. It can be enabled in MonoDevelop Preferences. Only a single analysis rule is provided but others may be implemented by addins.

#### Custom tools

#### Support for external display bindings

Add-ins will now be able to register external viewers for files.

Mac OSX
-------

#### **Native file Dialogs**

Message dialogs and file dialogs on Mac now use the native UI toolkit.

#### **MonoMac**

The MonoMac add-in (availble from the add-in manager) adds support for writing, runnig, debugging and packaging app bundles using the MonoMac wrapper for the native Cocoa toolkit on Mac.

C / C++
-------

-   Improved symbol navigation and completion using ctags.
-   Limited navigation and completion support for the default OSX ctags
    -   An alternate, modern ctags may be selected for improved support
-   Rudimentary project support for Objective C has been added.
-   Basic support for the Go-to-declaration command.

[![md26-AddinManager.png](/images/310-md26-AddinManager.png)](/images/310-md26-AddinManager.png "The new Add-in Manager")

Add-in Management
-----------------

MonoDevelop now depends on Mono.Addins 0.6, which features a new and improved add-in manager. In this new manager, add-in updates are more visible and easy to install. The add-in gallery is integrated in the main window, and can show custom add-in icons and preview images.

Other
-----

-   The command line tool for building projects (mdtool) now has a switch for selecting the runtime to be used for building.
-   The export-project tool now allows specifying which projects of a solution should be exported.
-   Support for Jump Lists in Windows 7 and Vista.
-   The gettext add-in is now supported in Mac

Credits
-------

Contributors to this release:

-   Lluis Sanchez (project management, workbench, debugger, Windows port, Git)
-   Michael Hutchinson (Mac port, MonoTouch, MonoMac, MonoDroid, ASP.NET, XML, T4)
-   Mike Krueger (text editor, error bubbles, refactoring, hex editor)
-   Levi Bard (C/C++ add-in, Vala)
-   Geoff Norton (MonoTouch)
-   Carlos Alberto Cortez (MonoDroid)
-   Dale Ragan (GIT, SpecFlow add-in)
-   Elias Holzer (Win32 debugger improvements)
-   IBBoard (git blame and diff improvements)
-   Steven Schermerhorn (Jump lists)
-   David Siegel (MonoMac bundle creator command)
-   Robert Hollencamp (gdb fixes)
-   Andrew Jorgensen (QA & packaging)
-   David Mulder (QA)
-   Marc Christensen (QA)

 Translators:

-   David Makovský (Czech)
-   Andres Aragoneses (Spanish)
-   Atsushi Enomoto (Japanese)
-   Ray Wang, Yan-ren Tsai (Chinese)
-   Mike Krueger, Masahiro Arai, Zeno Gantner (German)
-   Bruno Bovey (French)


