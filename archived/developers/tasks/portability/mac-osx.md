---
title: Mac OSX
redirect_from:
  - /Developers/Tasks/Portability/Mac_OSX/
  - /Developers/Tasks/General/Mac_OSX/
---

### File associations

<span> </span>

<span id="_task_a_Mac.FileAssoc"></span><span> </span>

|----------------------------------------------------------------------------------|--------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                 | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mhutch</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-1d" style="font-size: x-small;">1d</span> | <span class="task-target" style="font-size: x-small;">2.4</span> |

Add file association definitions to the MD app bundle so that it's the default handler for sln files etc.

### Database addin

<span> </span>

<span id="_task_a_Mac.Db"></span><span> </span>

|----------------------------------------------------------------------------------|--------------------------------------------------------------------|--------------------------------------------------------------------------|--------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                 | **<span style="font-size: x-small;">Importance</span>**                  | **<span style="font-size: x-small;">Complexity</span>**            | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mhutch</span> | <span class="task-importance-Low" style="font-size: x-small;">Low</span> | <span class="task-complexity-" style="font-size: x-small;"></span> | <span class="task-target" style="font-size: x-small;">2.4</span> |

Get the database addin tested on Mac and include it in the app bundle.

### Native dialogs

<span> </span>

<span id="_task_a_Mac.NativeDialogs"></span><span> </span>

|----------------------------------------------------------------------------------|--------------------------------------------------------------------|----------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                 | **<span style="font-size: x-small;">Importance</span>**                    | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mhutch</span> | <span class="task-importance-High" style="font-size: x-small;">High</span> | <span class="task-complexity-1w" style="font-size: x-small;">1w</span> | <span class="task-target" style="font-size: x-small;">2.6</span> |

Replace file open/save dialogs with Mac native ones.

### Dock icon arbiter

<span> </span>

<span id="_task_a_Mac.IconArbiter"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Implement a small process to own the MD dock icon, main menu, etc so that multiple MD instances can be opened up while appearing as one Mac-like process.

### Use native recent file list

<span> </span>

<span id="_task_a_Mac.NativeRecentList"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Use the Mac native recently used files lists.

### Detect native app handlers and icons

<span> </span>

<span id="_task_a_Mac.DetectAppH"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Detect native app handlers for the "open with" commands, and load native icons for the solution pad.

### Help viewer

<span> </span>

<span id="_task_a_Mac.Helpviewer"></span><span> </span>

|----------------------------------------------------------------------------------|--------------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                 | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mhutch</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Get MonoDoc working on Mac. Might have to port it to MonoObjc or something like that.

### Stetic addin

<span> </span>

<span id="_task_a_Mac.Stetic"></span><span> </span>

|----------------------------------------------------------------------------------|----------------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                   | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mkrueger</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;">2.6</span> |

Get the stetic Gtk# designer addin working on Mac. Need to implement lots of GTK+ DnD features, and fix major performance issues when designer is open.
