---
title: Vi Mode
redirect_from:
  - /Developers/Tasks/Source_Editing/Vi_Mode/
---

### Multipliers

<span> </span>

<span id="_task_a_SourceEditing.Vi.Mult"></span><span> </span>

|--------------------------------------------------------------------------------|--------------------------------------------------------------------|------------------------------------------------------------------------------------|--------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                            | **<span style="font-size: x-small;">Owner</span>**                 | **<span style="font-size: x-small;">Importance</span>**                            | **<span style="font-size: x-small;">Complexity</span>**            | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Assigned" style="font-size: x-small;">Assigned</span> | <span class="task-owner" style="font-size: x-small;">mhutch</span> | <span class="task-importance-Very-Low" style="font-size: x-small;">Very-Low</span> | <span class="task-complexity-" style="font-size: x-small;"></span> | <span class="task-target" style="font-size: x-small;">2.6</span> |

Support for prefixing operators and objects with multipliers, e.g. 5dd deletes 5 lines, c5ft changes as far as the next instance of the letter f, etc.

### Multi-character text objects

<span> </span>

<span id="_task_a_SourceEditing.Vi.MultiCharObs"></span><span> </span>

|--------------------------------------------------------------------------------|--------------------------------------------------------------------|------------------------------------------------------------------------------------|--------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                            | **<span style="font-size: x-small;">Owner</span>**                 | **<span style="font-size: x-small;">Importance</span>**                            | **<span style="font-size: x-small;">Complexity</span>**            | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Assigned" style="font-size: x-small;">Assigned</span> | <span class="task-owner" style="font-size: x-small;">mhutch</span> | <span class="task-importance-Very-Low" style="font-size: x-small;">Very-Low</span> | <span class="task-complexity-" style="font-size: x-small;"></span> | <span class="task-target" style="font-size: x-small;">2.6</span> |

Support for text objects that consist of multiple characters and may or may not be terminated by enter. E.g. *dtf* deletes to the next letter f, *tf* moves to the next letter f, *y/\<foo\>* followed by enter yanks (copies) to the next instance of \<foo\>.

### Registers

<span> </span>

<span id="_task_a_SourceEditing.Vi.Registers"></span><span> </span>

|--------------------------------------------------------------------------------|--------------------------------------------------------------------|------------------------------------------------------------------------------------|--------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                            | **<span style="font-size: x-small;">Owner</span>**                 | **<span style="font-size: x-small;">Importance</span>**                            | **<span style="font-size: x-small;">Complexity</span>**            | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Assigned" style="font-size: x-small;">Assigned</span> | <span class="task-owner" style="font-size: x-small;">mhutch</span> | <span class="task-importance-Very-Low" style="font-size: x-small;">Very-Low</span> | <span class="task-complexity-" style="font-size: x-small;"></span> | <span class="task-target" style="font-size: x-small;">2.6</span> |

Support for Vi registers, i.e. prefixing a command with "z uses the z register for cut/paste. There are also some registers that automatically contain things like a stack of recent deletes, most recent yank, X clipboard, etc.

### Share/store registers

<span> </span>

<span id="_task_a_SourceEditing.Vi.StoreRegisters"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Store registers between MD sessions. Figure out how they should be shared between different editor tabs in MD.

### Macros/repeat-last

<span> </span>

<span id="_task_a_SourceEditing.Vi.Macros"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Implement support for q, which can record and store a series of operations. Also the . key, which repeats the last operation that modified the text. This is difficult because "operation" can also mean entering visual mode, making selections, entering edit mode and changing text, etc.

### Pluggable operators and objects

<span> </span>

<span id="_task_a_SourceEditing.Vi.PluggableOps"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------------|------------------------------------------------------------------------------------|--------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**                 | **<span style="font-size: x-small;">Importance</span>**                            | **<span style="font-size: x-small;">Complexity</span>**            | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;">mhutch</span> | <span class="task-importance-Very-Low" style="font-size: x-small;">Very-Low</span> | <span class="task-complexity-" style="font-size: x-small;"></span> | <span class="task-target" style="font-size: x-small;">2.6</span> |

Make it possible for addins to add new text objects and operators. Figuring out this architecture will make implementing some of the other vi tasks much easier, esp. registers, repeats and multi-character text objects.

### Pluggable ex commands

<span> </span>

<span id="_task_a_SourceEditing.Vi.PluggableEx"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Allow addins to plug in new ex (:) commands.

### Remapping

<span> </span>

<span id="_task_a_SourceEditing.Vi.Remapping"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Allow users to remap keys, operators, objects, etc.

### Read VIM settings

<span> </span>

<span id="_task_a_SourceEditing.Vi.VimSettings"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Read the VIM settings file.

### Don't Conflict with Keybindings

<span> </span>

<span id="_task_a_SourceEditing.Vi.DontConflictkeybindings"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Currently come of the vi mode's key commands conflcit with MD's keybindings. The Vi mode should either find a way to pre-empt the keybinding service, or automatically switch the MD keybinding scheme to something that doesn't conflict.

### Surroundings

<span> </span>

<span id="_task_a_SourceEditing.Vi.Surroundings"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Add support for [surround.vim](http://www.catonmat.net/blog/vim-plugins-surround-vim/)


