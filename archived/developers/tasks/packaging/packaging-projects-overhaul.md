---
title: Packaging Projects Overhaul
redirect_from:
  - /Developers/Tasks/Packaging/Packaging_Projects_Overhaul/
  - /Packaging_Projects_Overhaul/
  - /Proposals/Packaging_Projects_Overhaul/
  - /Developers/TODO/Proposals/Packaging_Projects_Overhaul/
  - /Developers/Proposals/Packaging_Projects_Overhaul/
---

<span> </span>

<span id="_task_a_Packaging.Project"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|----------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                    | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-High" style="font-size: x-small;">High</span> | <span class="task-target" style="font-size: x-small;"></span> |

### Overview

This proposal was initiated following discussion of the BuildServiceIntegrationPlans.

In their current state, MonoDevelop's packaging projects have limitations that make it difficult to integrate RPM and DEB package types. They are also somewhat unintuitive to use.

### Current State of Packaging Projects

As of MonoDevelop 1.0, any number of *Packaging projects* can be added to a solution. Each packaging project contains any number of *packages*. Packages within the same packaging project share no settings at all, and need have nothing in common. They have individual settings dialogs. Examples of packages are: generate tarball, generate binaries.

This is quite unintuitive, as projects are expected to represent a single logical item of some kind. Instead, the project has simply been used to group disparate items.

### Proposal

#### Fix the Project Concept

A project should correspond to a single logical "package". It may have multiple output formats, but all the outputs are simply different forms of the same thing. It should have a project-level UI for setting common package options like the name, authors, description, license, copyright, etc.

#### Use the References Concept

The Packaging Projects should make use of the concept of *References* used elsewhere in MonoDevelop and other IDEs, in this case to specify which other projects in the solution are to be used for dependencies and sources. Packaging formats like RPM can take advantage of this dependency information.

#### Implement Package Formats

The existing tarball and binary tarball formats should be converted into *package formats* for the new project type. Package formats should be implemented for DEB and RPM. in the future they could be implemented for Mac .app bundles, Windows installers and merge modules.

#### MSBuild Handlers

Since the project file will be a MSBuild file, an MSBuild handler should be able to build the packages. This will make it possible to do things like setting up a Linux CruiseControl.NET appliance to build packages.

### Potential Problems

#### Migrations

It may be difficult to migrate existing packaging projects to the new format. is anyone using them?

#### Building on Other Platforms

Some formats will only be buildable on certain platforms. How will MD handle this? This might be a good use for project *Configurations*.


