---
title: Text Editor Improvements
redirect_from:
  - /Developers/Tasks/Source_Editing/Text_Editor_Improvements/
---

### Code focus toggle and follow-cursor

<span> </span>

<span id="_task_a_TextEditor.CodeFocus"></span><span> </span>

|----------------------------------------------------------------------------------|----------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                   | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mkrueger</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-2h" style="font-size: x-small;">2h</span> | <span class="task-target" style="font-size: x-small;">2.4</span> |

**Code focus** should be usable from the keyboard. It would be useful to be able to toggle it on/off. When on, it would follow the caret.

### Inline search usability overhaul

<span> </span>

<span id="_task_a_TextEditor.InlineSearch"></span><span> </span>

|----------------------------------------------------------------------------------|----------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                   | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mkrueger</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-3d" style="font-size: x-small;">3d</span> | <span class="task-target" style="font-size: x-small;">2.4</span> |

The Inline Search Window could use some tweaks to make it more keyboard-friendly.

Make text widget wider, waste less on superfluous words in buttons. An animation as it appears would be nice, maybe using banshee's GTK animation framework. Also could use banshee's search box (renders menu options icons and clear icon within the box).

The XCode bar is actually very useful, or even the Google Chrome search bar is very useful.  Plenty of the options are actually hidden in a popup menu and the defaults are sane to get started.

The default should be as follow (this is from Emacs, incremental search):

-   Start in case insensitive mode.
-   If the user types an upper case letter during the search, the search automatically switches to case-sensitive mode, and remains in this mode from that point on (until the next search).

### Make the quick finder take less space

<span> </span>

<span id="_task_a_TextEditor.QuickFinder"></span><span> </span>

|----------------------------------------------------------------------------------|----------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                   | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mkrueger</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-2d" style="font-size: x-small;">2d</span> | <span class="task-target" style="font-size: x-small;">2.4</span> |

The **class/method quick finder** could take up less space and more items could be shown in that row. See Xcode for an example.

### Extend/shrink selection scope

<span> </span>

<span id="_task_a_TextEditor.ExtShrSelection"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Keybindings for expanding the selection to the next largest subexpression, expression, line, scope, etc. Obviously needs support from language bindings, though basic fallback support could be driven by words, lines, string highlighting, highlighting scopes, bracket matching, regions, blank lines, etc.

After expanding, it should also be possible to shrink back down, though shrinking down from an arbitrary selection is not possible because there is no central point.

### Markers in vertical scrollbar

<span> </span>

<span id="_task_a_TextEditor.ScrollMarkers"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

The vertical scrollbar could have scroll markers for errors/bubbles/searchresults etc inline to make it easier to find them.

### Better XML path bar widget

<span> </span>

<span id="_task_a_TextEditor.XmlPathBar"></span><span> </span>

|----------------------------------------------------------------------------------|--------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                 | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mhutch</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-1d" style="font-size: x-small;">1d</span> | <span class="task-target" style="font-size: x-small;">2.4</span> |

The XML **path bar** should be a custom widget so that it takes less space, and is more usable, and ellipsises somehow when it gets overwide. It's almost never shown at the same time as the quick finder (except aspx with code blocks?), so they could maybe use the same space.

### Smart tags (or other suggestions mechanism)

<span> </span>

<span id="_task_a_TextEditor.SmartTags"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;">2.8</span> |

Something like VS' smart tags, or some other flag/highlight for making contextual suggestions about actions the user could take.

### Format selection

<span> </span>

<span id="_task_a_TextEditor.FormatSelection"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Add a command for formatting the current selection.

### Remember fold state when reopening solution

<span> </span>

<span id="_task_a_TextEditor.RestoreFoldState"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

The text editor could remember the state of all fold markers when re-opening the solution.

### Remember position and fold state for individual files

<span> </span>

<span id="_task_a_TextEditor.RestoreFilePosition"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

The text editor could remember the line/col of the caret, and possible fold state of all fold markers, of some number of recently closed files.

### Go to last edited position

<span> </span>

<span id="_task_a_TextEditor.GoToLastEditedPosition"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Command for jumping directly back to the last position that was edited. Useful after navigating around, to get back to what you were editing. Should work across files as well as within a file. Distinct from the navigation commands we already have, though maybe this command could inspect the same navigation stack and the undo stack of each document to find the last edited position.

### Color Scheme Editor

<span> </span>

<span id="_task_a_TextEditor.ColorSchemeEditor"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

An editor for text editor color schemes.

A simple editor could allow the user to pick a few colors and [generate a scheme from them](http://frickinsweet.com/tools/Theme.mvc.aspx).

An advanced editor could either allow the user to pick styles from a list of names, or [pick them from a sample document](http://studiostyles.info/), and set their colors.


