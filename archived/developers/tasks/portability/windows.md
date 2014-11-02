---
title: Windows
redirect_from:
  - /Developers/Tasks/Portability/Windows/
---

### Jump lists

<span> </span>

<span id="_task_a_Windows.JumpLists"></span><span> </span>

|----------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Support for Windows 7 Jump Lists, using the MS Code Pack library. Could have commands for accessing recently used solutions directly, creating new solutions, etc.

### Use native recent file list

<span> </span>

<span id="_task_a_Windows.NativeRecent"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Use the native "recently used files" list and register as able to handle them so that the Win7 start menu will show these files in a submenu of the MD shortcut.

### Native file dialogs

<span> </span>

<span id="_task_a_Windows.NativeFileDialogs"></span><span> </span>

|--------------------------------------------------------------------------------------|-------------------------------------------------------------------|----------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                                  | **<span style="font-size: x-small;">Owner</span>**                | **<span style="font-size: x-small;">Importance</span>**                    | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-In Progress" style="font-size: x-small;">In Progress</span> | <span class="task-owner" style="font-size: x-small;">lluis</span> | <span class="task-importance-High" style="font-size: x-small;">High</span> | <span class="task-complexity-1w" style="font-size: x-small;">1w</span> | <span class="task-target" style="font-size: x-small;">2.6</span> |

Use the native Windows file dialogs. This should be relatively straightforward since the abstraction work will need to be done for Mac anyway. Might have problems with the message pump. 

### Taskbar Progress Indicator

<span> </span>

<span id="_task_a_Windows.TaskbarProgressIndicator"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Windows 7 enables app icons on the taskbar to show a progress indicator. MD should enable this for monitors shown in the status bar or modal dialogs.


