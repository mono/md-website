---
title: Build Service Integration
redirect_from:
  - /Developers/Tasks/Packaging/Build_Service_Integration/
---

<span> </span>

<span id="_task_a_Packaging.BuildService"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|----------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                    | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-High" style="font-size: x-small;">High</span> | <span class="task-target" style="font-size: x-small;"></span> |

### Overview

The next version of MonoDevelop will include RPM packaging features and will integrate into the openSUSE build service. This page is for brainstorming plans.

NOTE: This depends on Packaging Projects Overhaul.

### Use cases

-   A Linux developer has created an application, and wishes to build packages for all of the SUSE variants. He/she adds a packaging project to the solution, edits the packaging properties, and builds packages using a local environment.

<!-- -->

-   A Windows developer wishes to provide packages for Linux. They open their VS solution in the Windows version of MD, add a packaging project, edits the packaging properties, and deploy it to a build server. They then monitor the status from within MD and view any compilation errors.

<!-- -->

-   A Linux developer is using the openSUSE build service to build packages, and already has everything set up using the web interface. He/she would like to deploy directly to the build service from within MD, while still being able to edit the .spec and .dsc file directly.

### Requirements

-   Extending the existing packaging projects system to support RPM and DEB files.
-   Support for editing .spec and .dsc specifications directly -- syntax highlighting, maybe code completion etc.
-   A GUI for editing the simple properties of packages -- name, licence, dependencies, etc. Will need to parse spec files.
-   Support for building packages using a local environment.
-   A panel for uploading packages to a build server and monitoring build status.

### User interface

The **new package types** should supplement the various package types available already. They will therefore be available to be added when creating a new packaging project, and when creating a new solution.

The existing package types appear as children of the **packaging project** in the solution pad. The current package types have the "Build" command available on their context menu, and double-clicking opens the package properties; for consistency, this should not be changed for the new packages.

The **Package Options** should appear as a document in the MD SDI view rather than a dialog. It will allow switching to the .spec or .dsc file via a button at the bottom of the view. This is a typical practice for showing different views of the same information. It will also be tabbed to allowed editing things like the deploy file list, build servers, per-distribution build options, etc.

A context menu option **Build status** on the package will allow bringing up a document view showing the status of all the per-distro "sub-packages" that are being built for this package, and the current status. It will show commands to "Build locally" or "Build on server" for each sub-package, and double-clicking on each sub-package will bring up a view for that package showing the current status, build logs, history, etc.

The various **sub-packages** could also be shown as children of the packages, so that they can easily be built quickly via context menu commands. Double-clicking will bring up the sub-package view document view.

### Possible Other Features

**Network build servers**: detect build servers on the local network using Mono.ZeroConf.

**Binary Packaging**: non-open build servers and local builds could package binaries, thereby reducing build time.

### Compatibility with Other Tools and Platforms

#### OSC

The osc command line build service client is written in Python, so MD cannot consume it directly, though it could be invoked as a separate process. It is uncertain whether it works on platforms other than Linux, and the Python stack is a large dependency, so it's unlikely to be viable to be used by MD.

It is uncertain whether local copies of the package information will be needed. If they are, MD should aim be be compatible with the osc format.

#### Gnome and Eclipse Build Service Clients

These two projects are being written in the Google Summer of Code, and MonoDevelop will hopefully ship the build service features at a similar timeas they finish.

The Gnome client is written in Python, and uses the osc library, so the same caveats apply. The Eclipse addin will be in Java, so code could be shared using IKVM, but that would complicate maintenance for MD and add a dependency. It is unknown whether it will use osc.

#### Visual Studio

As much code as possible should be abstracted out for use in a future Visual Studio plugin. Obvious candidates are .spec/.dsc parsers and the OBS web service wrappers.

### Notes

The OBS API is available at <https://api.opensuse.org/apidocs>.
