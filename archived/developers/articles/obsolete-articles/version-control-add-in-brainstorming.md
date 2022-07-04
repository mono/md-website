---
title: Version Control Add-In Brainstorming
redirect_from:
  - /Developers/Articles/Obsolete_Articles/Version_Control_Add-In_Brainstorming/
  - /Version_Control_Add-In_Brainstorming/
  - /Developers/Obsolete_Articles/Version_Control_Add-In_Brainstorming/
---

### Intro

Rubens Ramos has created a basic version control framework add-in for MonoDevelop called *VersionControl*. It is in the very early stages of development and as such there is no actual version control functionality as of yet. Such functionality will actually be provided by add-ins interfacing with the various version control libraries that VersionControl will support. For maintainability these backends should remain separate add-in projects.

If you'd like to help out and need a copy of VersionControl to get an idea of what's going on, drop by [\#monodevelop](irc://irc.gimp.org/monodevelop) on `irc.gimp.org`, or get it from the [MonoDevelop mailing list archives](http://lists.ximian.com/archives/public/monodevelop-list/2004-November/001480.html) if you can decode the embedded mime attachment.

The following are proposals regarding VersionControl or backend support for it. Click this page's *discussion* tab above to discuss them here on the wiki, or drop by `#monodevelop-addins`.

### Architecture Overview

Here's a high-level view of how everything fits together in the current proposals:

[http://img67.exs.cx/img67/7377/versi...ntrol\_addi.jpg](http://img67.exs.cx/img67/7377/version_control_addi.jpg)

### Backend Support

#### Which version control systems should be supported?

Ideally VersionControl should be able to accommodate as many version control systems as possible. Practically however, primary focus should be given to version control systems which are most used by Mono/.NET developers. Here is a short list of candidates that have come up in discussion:

-   Subversion
-   CVS
-   Arch
-   darcs
-   VSS
-   Rational ClearCase\*
-   BitKeeper\*

Of these, Subversion and CVS add-ins are currently in active development. Volunteers for the rest are welcome. Systems marked with \* are proprietary and add-ins based on their libraries may not be freely redistributable; their feasibility remains unclear. VSS is also proprietary but is obviously closely tied to .NET projects and hence Mono -- a strong rationale for supporting VSS one way or another. An open source VSS library would be the optimal solution.

#### Abstracting common backend operations

From a client standpoint Subversion and CVS usage is nearly identical. It follows that VersionControl operations for add-ins implementing these systems, as accessed through the context menus in the project browser, should be mostly (if not entirely) identical. To encourage consistency between their VersionControl user interfaces, VersionControl should provide a base class for such similar add-ins to inherit from which captures their common operations.

The following code, `AbstractCommonCommands.cs`, is a proposal for such a base class for common Subversion and CVS functionality. The operations it abstracts are based upon operations common to the CVS and Subclipse plug-ins for the Eclipse platform (these plug-ins offer an excellent model on which to base VersionControl's design).

``` eval
namespace MonoDevelop.VersionControl
{
    public abstract class AbstractCommonCommands
    {
        public class AddToIgnoreCommand : AbstractMenuCommand
        {
            public override void Run ()
            {
                VCResource vcResource;
                // TODO: Assign the caller's selected VCResource to vcResource
                /* Now perform the command on it */
                AddToIgnore (vcResource);
            }
        }

        public class AddToVersionControlCommand : AbstractMenuCommand
        {
            public override void Run ()
            {
                VCResource vcResource;
                // TODO: Assign the caller's selected VCResource to vcResource
                /* Now perform the command on it */
                AddToVersionControl (vcResource);
            }
        }

        public class CommitCommand : AbstractMenuCommand
        {
            public override void Run ()
            {
                VCResource vcResource;
                // TODO: Assign the caller's selected VCResource to vcResource
                /* Now perform the command on it */
                Commit (vcResource);
            }
        }

        public class RevertCommand : AbstractMenuCommand
        {
            public override void Run ()
            {
                VCResource vcResource;
                // TODO: Assign the caller's selected VCResource to vcResource
                /* Now perform the command on it */
                Revert (vcResource);
            }
        }

        public class ShowHistoryCommand : AbstractMenuCommand
        {
            public override void Run ()
            {
                VCResource vcResource;
                // TODO: Assign the caller's selected VCResource to vcResource
                /* Now perform the command on it */
                ShowHistory (vcResource);
            }
        }

        public class SynchronizeWithRepositoryCommand : AbstractMenuCommand
        {
            public override void Run ()
            {
                VCResource vcResource;
                // TODO: Assign the caller's selected VCResource to vcResource
                /* Now perform the command on it */
                SynchronizeWithRepository (vcResource);
            }
        }

        public class UpdateCommand : AbstractMenuCommand
        {
            public override void Run ()
            {
                VCResource vcResource;
                // TODO: Assign the caller's selected VCResource to vcResource
                /* Now perform the command on it */
                Update (vcResource);
            }
        }

        /// <summary>
        ///   Excludes local directory or file from version control operations.
        /// </summary>
        protected abstract void AddToIgnore (VCResource vcResource) { }

        /// <summary>
        ///   Places local directory or file under version control management.
        /// </summary>
        protected abstract void AddToVersionControl (VCResource vcResource) { }

        /// <summary>
        ///   Checks local project, directory, or file changes into the remote
        ///   repository.
        /// </summary>
        protected abstract void Commit (VCResource vcResource) { }

        /// <summary>
        ///   Restores a project, directory, or file to a previous version.
        /// </summary>
        protected abstract void Revert (VCResource vcResource) { }

        /// <summary>
        ///   Retrieves the entire change history with annotations for the
        ///   selected project, directory, or file.
        /// </summary>
        protected abstract void ShowHistory (VCResource vcResource) { }

        /// <summary>
        ///   Performs practice Update() and Commit() runs on the selected
        ///   project, directory, or file in order to inform the user what
        ///   changes will take place and allow them to resolve any identified
        ///   conflicts (using the diff editor) before the operations are
        ///   actually carried out.
        /// </summary>
        protected abstract void SynchronizeWithRepository (VCResource vcResource) { }

        /// <summary>
        ///   Pulls a current version of a project, directory, or file from the
        ///   remote repository, replacing the currently selected resource(s).
        /// </summary>
        protected abstract void Update (VCResource vcResource) { }
    }
}
```

### Configuration File

VersionControl must be able to keep track of local MonoDevelop projects that are managed under version control. The following is an example of a proposed `VersionControl.xml` configuration file intended to address this. This example shows a single CVS repository and a local MonoDevelop project which is a working copy of code checked out from that repository:

``` eval
<VersionControl>

    <Repository name="My Repo" type="CVS">

        <Host>cvs.sourceforge.net</Host>

        <Port></Port> <-- Leave blank or omit to use default port for Type

        <Args> <-- Nest backend-specific argument tags here, don't bother globally validating them

            <ConnectionType>pserver</ConnectionType> <-- ext, extssh, or pserver

        </Args>

        <Login value="headcheese" /> <-- Leave blank or omit to ask user for login once per session

        <Password value="6e71b3cac15d32fe2d36c270887df9479c25c640" /> <-- This value should
           be an SHA1 hash of the real password. Leave blank or omit to ask user for password once per session.

        <LocalProjects> <-- Local projects which use this repository

            <Project prjxfile="~/Projects/CheesyProject/CheesyProject.prjx">

                <RepositoryRoot>/cvsroot/Cheese</RepositoryRoot> <-- Remote repository path to project

            </Project>

        </LocalProjects>

    </Repository>

</VersionControl>
```

All local MonoDevelop projects under version control are recorded in this single `VersionControl.xml` file. This effectively marks the projects as working copies.

The file may contain any number of `<Repository>` entries, each of which may contain any number of `<Project>` entries nested within `<LocalProjects>`. VersionControl should consult it whenever a project is opened and handle the project accordingly if it's found to be a working copy.

Although the repository login passwords are SHA1 encoded they may still be vulnerable to brute-force/dictionary cracking. To help prevent the user from accidentally distributing it with their project, `VersionControl.xml` should be stored in `~/.config/MonoDevelop`.
