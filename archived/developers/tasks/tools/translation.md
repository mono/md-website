---
title: Translation
redirect_from:
  - /Developers/Tasks/Tools/Translation/
---

### Support for editing .NET localization

<span> </span>

<span id="_task_a_Projects.DotNetLocalization"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

MonoDevelop lacks support for localizing applications through standard .NET methods, instead opting for Mono specific GetText methods. .NET localization uses res/resx files like foo.res, foo.en-GB.res, foo.he.res to contain localized strings and System.Globalization.ResourceManager to access them. Support for these files would improve cross-platform internationalization.

### Online database of common translation phrases

<span> </span>

<span id="_task_a_Translation.OnlineDB"></span><span> </span>

|--------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                            | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                  | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Proposal" style="font-size: x-small;">Proposal</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Low" style="font-size: x-small;">Low</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

An online web service for sharing translations of common phrases in order to automate some parts of translations,

### CIL Gettext Scanner

<span> </span>

<span id="_task_a_Translation.CILGettextScanner"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

A gettext scanner that scans CIL binaries for arguments to calls to GetString. Would be more accurate, would work for all compiled managed languages, and could warn about passing concatenation of const strings and variables.

It could also follow call chains, so that any constant string that ends up at the GetString method would be localizable. This would enable things like attributes that run their arguments through gettext.

Some common methods that result in predictable string values, e.g. String.Concat, could also be handled.

### ASP.NET Gettext Scanner

<span> </span>

<span id="_task_a_Translation.AspNetGettextScanner"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

A gettext scanner for ASP.NET pages.

ASP.NET is tricky to parse an involves multiple languages. Probably the best way to do this is by combining the ASP.NET precompiler and the CIL gettext scanner.


