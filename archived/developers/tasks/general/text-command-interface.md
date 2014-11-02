---
title: Text command interface
redirect_from:
  - /Developers/Tasks/General/Text_command_interface/
---

<span> </span>

<span id="_task_a_General.TextCommandInterface"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

A textual, search-augmented, contextual interface to MonoDevelop commands, something like Gnome Do or Quicksilver.

When triggering the command, it would simply show a text input field, while scanning the current project and workspace, and finding all contextual commands. Then, as the user typed text, it would match to workspace objects and commands, using history-based acronym/substring matching. For example, the input "pr vc st" might match to "CurrentProject VersionControl Status".

The advantage of embedding something like this inside MD, as opposed to an external app scanning MD's menus, is that it could be fully aware of the context - the workspace, project model, open file, etc. - and how the MD command system interacts with it. Addins could define how their commands interact with the contexts used by the text command system, enabling it to work better.

This might also form the basis for a simple macro system.

