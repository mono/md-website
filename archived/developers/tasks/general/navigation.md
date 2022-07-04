---
title: Navigation
redirect_from:
  - /Developers/Tasks/General/Navigation/
---

### Go-to-symbol

<span> </span>

<span id="_task_a_General.Nav.Gotosymbol"></span><span> </span>

|----------------------------------------------------------------------------------|--------------------------------------------------------------|----------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                    | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-High" style="font-size: x-small;">High</span> | <span class="task-complexity-2w" style="font-size: x-small;">2w</span> | <span class="task-target" style="font-size: x-small;">2.4</span> |

This feature would be an enhancement of the existing Go to Type feature. In addition to types, it would allow jumping to any member of a type.

Implementing this feature is not trivial since it members are not currently indexed in the parser database. The parser format will have to be changed to support members indexing. This can cause memory problems, since all member names will have to be loaded in memory.

### Browse base classes/subclasses

<span> </span>

<span id="_task_a_General.Nav.BrowseSubclasses"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

This would be a tree-based pad that could be used to drill down into the subclasses and superclasses of a given type.

### Call tracking

<span> </span>

<span id="_task_a_General.Nav.CallTracking"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

This would be tree-based pad that could be used to drill down into the callers and callees of a method.

### Value tracking

<span> </span>

<span id="_task_a_General.Nav.ValueTracking"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

This would be a tree-based pad that could be used to drill down the code paths by which values could reach a variable. It would be useful, for example, for finding possible sources of nulls that could cause a NullReferenceException.
