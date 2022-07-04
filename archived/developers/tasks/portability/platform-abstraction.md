---
title: Platform Abstraction
redirect_from:
  - /Developers/Tasks/Portability/Platform_Abstraction/
  - /Developers/Tasks/General/Platform_Abstraction/
---

### Native recently used list

<span> </span>

<span id="_task_a_General.PlatformAbs.RecentList"></span><span> </span>

|----------------------------------------------------------------------------------|--------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                 | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mhutch</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-4h" style="font-size: x-small;">4h</span> | <span class="task-target" style="font-size: x-small;">2.6</span> |

Abstract out the recently used files list into the platform service so platform addins can provide properly integrated versions.

### Native file dialogs

<span> </span>

<span id="_task_a_General.PlatformAbs.NativeDialogs"></span><span> </span>

|----------------------------------------------------------------------------------|-------------------------------------------------------------------|----------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                | **<span style="font-size: x-small;">Importance</span>**                    | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">lluis</span> | <span class="task-importance-High" style="font-size: x-small;">High</span> | <span class="task-complexity-1d" style="font-size: x-small;">1d</span> | <span class="task-target" style="font-size: x-small;">2.4</span> |

Abstract out file dialogs into the platform service so that platform addins can implement native dialogs. There may need to be some predefined sets of additional widgetry for these dialogs, e.g. the encoding picker, the "open with" picker, the "close existing workspace" checkbox, the "build action" picker etc.

### Native temp/docs/settings/log paths

<span> </span>

<span id="_task_a_General.PlatformAbs.NativePaths"></span><span> </span>

|----------------------------------------------------------------------------------|--------------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                 | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mhutch</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Use OS/Desktop-native paths for settings, log files, temp files, cache files (code completion DB), user items like snippets and custom templates, etc.

### Native external console

<span> </span>

<span id="_task_a_General.PlatformAbs.Console"></span><span> </span>

|----------------------------------------------------------------------------------|--------------------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                       | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">lluis/mhutch</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Abstract out the "run on external console" into the platform service so that platform addins can use the native terminal app instead of assuming Xterm.
