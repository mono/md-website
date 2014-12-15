---
title: C#
redirect_from:
  - /Developers/Tasks/Language_Bindings/C%23/
---

### C# AST with token information for each construct

<span> </span>

<span id="_task_a_Languages.CS.AstWithTokens"></span><span> </span>

|--------------------------------------------------------------------------------------|----------------------------------------------------------------------|----------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                                  | **<span style="font-size: x-small;">Owner</span>**                   | **<span style="font-size: x-small;">Importance</span>**                    | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-In Progress" style="font-size: x-small;">In Progress</span> | <span class="task-owner" style="font-size: x-small;">mkrueger</span> | <span class="task-importance-High" style="font-size: x-small;">High</span> | <span class="task-complexity-1m" style="font-size: x-small;">1m</span> | <span class="task-target" style="font-size: x-small;">2.6</span> |

This will allow formatting of source code new lines, comments and pre processor directives without errors. And it will help implementing new refactorings & fixing current refactoring issues which can't be solved easily with the current structure. As well as doing things like an 'extend selection' command. It's required as basis for implementing performant semantic highlighting too.

### Structural Search and Replace

<span> </span>

<span id="_task_a_Refactoring.CS.StructuralSearchReplace"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Search and replaced based on actual semantic structure of the documents. The search expression is parsed from a C# snippet with placeholders.

It would be an excellent use of the new DOM.

Resharper [has this](http://blogs.jetbrains.com/dotnet/2010/02/resharper-5-beta-2-released/).

### Integrate mcs as parser

<span> </span>

<span id="_task_a_Languages.CS.Mcs"></span><span> </span>

|----------------------------------------------------------------------------------|----------------------------------------------------------------------|----------------------------------------------------------------------------|--------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                   | **<span style="font-size: x-small;">Importance</span>**                    | **<span style="font-size: x-small;">Complexity</span>**            | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mkrueger</span> | <span class="task-importance-High" style="font-size: x-small;">High</span> | <span class="task-complexity-" style="font-size: x-small;"></span> | <span class="task-target" style="font-size: x-small;">2.6</span> |

This will allow better support for on the fly error checking. Possibility of creating the AST with it. 

### C# REPL Pad

<span class="Apple-style-span" style="color: rgb(85, 85, 85); font-size: 14px; font-weight: normal;"><span> </span></span>

<span id="_task_a_Languages.CS.REPL"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Implement a C# REPL pad by integrating the MCS REPL. 

It would be useful to create a generic [REPL Pad](/archived/developers/tasks/tools/repl-pad/) infrastructure that could be used for other languages such as F#, IronPython, Boo, etc.

### Basic C# 4 support

<span> </span>

<span id="_task_a_Languages.CS.CS4Basic"></span><span> </span>

|----------------------------------------------------------------------------------|----------------------------------------------------------------------|----------------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                   | **<span style="font-size: x-small;">Importance</span>**                    | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mkrueger</span> | <span class="task-importance-High" style="font-size: x-small;">High</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;">2.6</span> |

Support for parsing C# 4 files without breaking existing code completion, but no special support for C# 4. 

### Full C# 4 support

<span> </span>

<span id="_task_a_Languages.CS.CS4Full"></span><span> </span>

|--------------------------------------------------------------------------------|----------------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                            | **<span style="font-size: x-small;">Owner</span>**                   | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Assigned" style="font-size: x-small;">Assigned</span> | <span class="task-owner" style="font-size: x-small;">mkrueger</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;">2.8</span> |

Full code completion support for C# 4 features, as far as is viable (not much can be done for "dynamic").


