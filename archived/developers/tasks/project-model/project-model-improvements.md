---
title: Project Model Improvements
redirect_from:
  - /Developers/Tasks/Project_Model/Project_Model_Improvements/
---

### Project type converter for SL, MT, ASP.NET, ASP.NET MVC, etc

<span> </span>

<span id="_task_a_Projects.ProjectTypeConverter"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

A way to convert projects from one project type to another. Generally additional work will be needed to make them compile, but at least, copying the file list over would be useful, e.g converting a Silverlight library project to a MonoTouch library project.

### Quick create project from directory

<span> </span>

<span id="_task_a_Projects.ProjectFromDirectory"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

It's a common request from users new to MD to be able to create a new project from all the files directory. It's relatively easy to to do using the "show all file" and "include to project" feature, but these aren't easy to discover.

### More assembly references by default

<span> </span>

<span id="_task_a_Projects.MoreRefsByDefault"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

A common problem that new users have it to be missing references to System, System.Core, System.Xml. It's trivial for users who know what they're doing to to remove these refs, so all of the default project templates should have these refs, and maybe more.

### Save named policy sets and apply to projects

<span> </span>

<span id="_task_a_Projects.SaveNamedPolicies"></span><span> </span>

|----------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Save policy sets with user-specified names, and apply these named policy sets to projects.

### Proper MSBuild file links in projects

<span> </span>

<span id="_task_a_Projects.MSBuildLinks"></span><span> </span>

|----------------------------------------------------------------------------------|--------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                 | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mhutch</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-3d" style="font-size: x-small;">3d</span> | <span class="task-target" style="font-size: x-small;">2.4</span> |

Proper support for MSBuild file links in projects, i.e. respecting the project-relative path instead of flattening them as we currently do. This affects a lot of people bringing projects from VS.

### Support for per-solution assembly resolution rules

<span> </span>

<span id="_task_a_Projects.PerProjectAsmResolution"></span><span> </span>

|--------------------------------------------------------------------------------|-------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                            | **<span style="font-size: x-small;">Owner</span>**                | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Assigned" style="font-size: x-small;">Assigned</span> | <span class="task-owner" style="font-size: x-small;">lluis</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-1w" style="font-size: x-small;">1w</span> | <span class="task-target" style="font-size: x-small;">2.8</span> |

We need to somehow support custom rules for resolving referenced assemblies in solutions. This would solve the problem we have in MD, where add-ins in Extras needs to reference assemblies generated in the Main solution. There are however, important issues to be resolved:

-   Resolving assemblies is not enough, we need to resolve packages, since makefiles depend on it.
-   Looking for local .pc files is not going to work on Windows.
-   Ideally we could resolve as project references when possible, to get live code completion information, and working cross-solution go-to-definition, rename, etc.

### WCF service references

<span> </span>

<span id="_task_a_Projects.WcfRefs"></span><span> </span>

|----------------------------------------------------------------------------------|-------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">lluis</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-2d" style="font-size: x-small;">2d</span> | <span class="task-target" style="font-size: x-small;">2.4</span> |

WCF service references using svcutil.

### Only rebuild dependent projects if public API changes

<span> </span>

<span id="_task_a_Projects.RebuildOnlyAPIChange"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

After building an assembly, hash the public API using Cecil. The public API would be stored in a marker file which would be updated when the hash changed. This marker file would be used as the build time of the assembly when checking whether to rebuild dependent assemblies.

mhutch has written a proof-of-concept command-line API hashing tool that takes about 400ms to hash MonoDevelop.Ide.dll on a 2.5GHz Core2. It doesn't handle attributes, and uses a fairly inefficient giant StringBuilder approach instead of hashing block by block.

This would make it *much* faster to build large solutions like MD after making small changes to core assemblies, but would slightly slow down other cases.

### Remove .NET 1.1 support

<span> </span>

<span id="_task_a_Projects.RemoveNet11"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**            | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-" style="font-size: x-small;"></span> | <span class="task-target" style="font-size: x-small;">2.8</span> |

Remove support for .NET 1.1, since it will not be supported anymore by Mono.

### Remove MD1 file format support

<span> </span>

<span id="_task_a_Projects.MD1Format"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**            | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-" style="font-size: x-small;"></span> | <span class="task-target" style="font-size: x-small;">2.8</span> |

We could kill a lot of dead code if we remove it, especially after moving to xbuild. How many users are really using it? At the very least can we make it an import-only option, or remove support for creating new MD1 projects.

### Mac Multi-Project Support

<span> </span>

<span id="_task_a_Projects.MultiProjectSupport"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;">2.8</span> |

For good Mac support, we really need to be able to support having multiple windows with different solutions, but sharing a single main menu and dock icon.

-   PROPOSAL (mhutch): I propose we hack this using a small core process that owns the dock and main menu, and IPC to communicate with multiple real MD instances.
