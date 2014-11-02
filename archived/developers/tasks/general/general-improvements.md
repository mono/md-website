---
title: General Improvements
redirect_from:
  - /Developers/Tasks/General/General_Improvements/
---

### Real support for multiple MD processes

<span> </span>

<span id="_task_a_General.RealMultiInstance"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                  | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Low" style="font-size: x-small;">Low</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

There are currently problems when multiple MD windows are open. Primarily they don't share the preferences, so settings can be lost.

### Save named keybindings sets

<span> </span>

<span id="_task_a_General.SaveNamedKeybindings"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-1d" style="font-size: x-small;">1d</span> | <span class="task-target" style="font-size: x-small;"></span> |

It should be possible to save and export/import keybinding sets. Saving probably just involves copying ~/.config/MonoDevelop/KeyBindings.xml into KeyBindings/{BindingName}.xml, and listing files from that directory in the keybindings list.

### Hyperlink filenames in build pad and output pad

<span> </span>

<span id="_task_a_General.HyperlinkFiles"></span><span> </span>

|--------------------------------------------------------------------------------|-------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                            | **<span style="font-size: x-small;">Owner</span>**                | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Assigned" style="font-size: x-small;">Assigned</span> | <span class="task-owner" style="font-size: x-small;">lluis</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-1h" style="font-size: x-small;">1h</span> | <span class="task-target" style="font-size: x-small;">2.6</span> |

Filenames is the build pad and output pad should be turned into hyperlinks that can be used to jump to the files.

### Macro system for recording/automating sets of actions and input

<span> </span>

<span id="_task_a_General.MacroRecording"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

It would be useful for be able to record and playback sets of actions and inputs, in order to automate tedious tasks.

### Add an option for selecting the GTK+ theme

<span> </span>

<span id="_task_a_General.GtkThemeOption"></span><span> </span>

|----------------------------------------------------------------------------------|-------------------------------------------------------------------|--------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                | **<span style="font-size: x-small;">Importance</span>**                  | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">lluis</span> | <span class="task-importance-Low" style="font-size: x-small;">Low</span> | <span class="task-complexity-1h" style="font-size: x-small;">1h</span> | <span class="task-target" style="font-size: x-small;">2.4</span> |

Add an option to the general preferences which allows the user to select the GTK+ theme to be used by MonoDevelop.

### Add an option for selecting the user interface language

<span> </span>

<span id="_task_a_General.LanguageOption"></span><span> </span>

|----------------------------------------------------------------------------------|-------------------------------------------------------------------|--------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                | **<span style="font-size: x-small;">Importance</span>**                  | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">lluis</span> | <span class="task-importance-Low" style="font-size: x-small;">Low</span> | <span class="task-complexity-2h" style="font-size: x-small;">2h</span> | <span class="task-target" style="font-size: x-small;">2.4</span> |

Add an option to the general preferences which allows the user to select the language to be used by the user interface of MonoDevelop. Some developers prefer using English as language for the IDE, even if their locale is not English.

### Lucene-based full text search

<span> </span>

<span id="_task_a_General.LuceneSearch"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

By using Lucene to index all file in a solution, we could has super-fast fulltext search. Perfaps we could also use it to store the code completion DB.

### Regex Toolkit Usability

<span> </span>

<span id="_task_a_General.RegexToolkitUsability"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Improve the usability of the regex toolkit. Bigger text entries, find more elegant solution for describing "elements" than awkward tooltips, have values from the library copied back into the toolkit, make library refresh not pop up blocking dialogs, make it possible to abort long-running regexes.


