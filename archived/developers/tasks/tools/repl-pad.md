---
title: REPL Pad
redirect_from:
  - /Developers/Tasks/Tools/REPL_Pad/
---

<span> </span>

<span id="_task_a_Tools.REPLPad"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

A generic pad for language addins to plug in a REPL (read-eval-print-loop). The Boo addin already has a REPL pad, but it would be nice to be able to plug in the csharp, IronPython, IronRubu, F# REPLs easily.

Th REPL pad should provide a decent terminal-like widget with syntax highlighting and good keyboard usability, history, etc. It should also have a mechanism for running the actual REPL outside the MD process, and for loading the projects' compiled output dlls. It could also provide a command for copying selected text from the source editor to the REPL and executing it, and maybe a mechanism for storing and managing code snippets for the repl.

Using Mono.TextEditor as the REPL widget directly would require adding support for line wrapping and uneditable regions, so it might be easier to use the Mono.TextEditor syntax highlighting engine with a GTK TextView.

