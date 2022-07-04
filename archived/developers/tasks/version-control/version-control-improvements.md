---
title: Version Control Improvements
redirect_from:
  - /Developers/Tasks/Version_Control/Version_Control_Improvements/
  - /Developers/Tasks/Version_Control/Interactive_merge_and_resolve/
---

### Interactive merge and resolve

<span> </span>

<span id="_task_a_VersionControl.MergeGui"></span><span> </span>

|----------------------------------------------------------------------------------|-------------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">lluis</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;">2.6</span> |

Interactive tool for merging and resolving conflicts.

### Branching support

<span> </span>

<span id="_task_a_VersionControl.Branching"></span><span> </span>

|----------------------------------------------------------------------------------|-------------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">lluis</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;">2.6</span> |

GUI for branching/merging, browsing branches, etc.

### Shelving

<span> </span>

<span id="_task_a_VersionControl.Shelving"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Support for "shelving" a set of changes by diffing, and re-applying the shelved changes by patching. Store any number of shelved changesets. Simple but useful.

### Use VCS diffs to prime text editor's changed line markers

<span> </span>

<span id="_task_a_VersionControl.ChangeMarkers"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                            | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Very-Low" style="font-size: x-small;">Very-Low</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

When opening a text file in the text editor, use the VCS diff to initialize the "changed lines" markers to indicate which have been modified but not committed.
