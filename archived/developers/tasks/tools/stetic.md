---
title: Stetic
redirect_from:
  - /Developers/Tasks/Tools/Stetic/
---

### 1-widget-per-file

<span> </span>

<span id="_task_a_Tools.Stetic.1wpf"></span><span> </span>

|--------------------------------------------------------------------------------------|-------------------------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                                  | **<span style="font-size: x-small;">Owner</span>**                            | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-In Progress" style="font-size: x-small;">In Progress</span> | <span class="task-owner" style="font-size: x-small;">Krzysztof Marecki</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Move stetic to a 1-widget-per-file model, so that each foo.stetic file contains a single window or widget, and has a foo.stetic.designer.cs partial class file grouped, etc. This would not only mirror .NET idiom, but would also help to reduce the stetic startup time and memory use, and make it easier to copy/move widget between projects, make VCS changesets more readable, etc.

### Lightweight project model

<span> </span>

<span id="_task_a_Tools.Stetic.LightweightProjects"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Now that stetic is part of MD, it should use the MD project model and parser services more directly, instead of maintaining its own equivalents. This would reduce the stetic startup time and memory use a lot, and would improve maintainability.

### Don't try to regenerate code every build

<span> </span>

<span id="_task_a_Tools.Stetic.NoRegen"></span><span> </span>

|--------------------------------------------------------------------------------------|-------------------------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                                  | **<span style="font-size: x-small;">Owner</span>**                            | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-In Progress" style="font-size: x-small;">In Progress</span> | <span class="task-owner" style="font-size: x-small;">Krzysztof Marecki</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Make stetic regenerate designer code less often, to make builds quicker. Reduce churn in generated code that pollutes svn status listings.

### Run designer out-of-process, support for native widgets

<span> </span>

<span id="_task_a_Tools.Stetic.OutOfProcess"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Run the stetic designer surface in a separate process so that it can load and render custom-rendered widgets.

### Support for GtkBuilder

<span> </span>

<span id="_task_a_Tools.Stetic.GtkBuilder"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Add support for the GtkBuilder file format. Perhaps also support a XAML-like codebehind system.
