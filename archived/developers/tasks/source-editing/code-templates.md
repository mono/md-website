---
title: Code Templates
redirect_from:
  - /Developers/Tasks/Source_Editing/Code_Templates/
  - /Proposal:_Code_Templates/
  - /Proposals/Proposal:_Code_Templates/
  - /Developers/TODO/Proposals/Proposal:_Code_Templates/
  - /Developers/Proposals/Proposal:_Code_Templates/
  - /Developers/Proposals/Code_Templates/
---

<span> </span>

<span id="_task_a_SourceEditing.CodeTemplates"></span><span> </span>

|----------------------------------------------------------------------------------|----------------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                   | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mkrueger</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;">2.2</span> |

### Overview

Code templates are a very useful feature to have in an IDE, but MonoDevelop only has very limited support. This page explores the various types of code template features that other IDEs and text editor have, so that we can evaluate what we should do in MonoDevelop.

### Common Code Template Features

Placeholders are regions within the template that are replaced when the template is used:

-   **Editable placeholder**: A placeholder that may be edited by the user. Generally they can tab between the placeholders.
-   **Dynamic placeholder**: a placeholder whose value depends on the context. It might simply mirror an editable placeholder, resolve to the name of the enclosing class or file, or evaluate a small code snippet.
-   **End placeholder**: a placeholder that specifies the location of the cursor after the template is inserted.

There are various ways of activating templates:

-   **Tab shortcuts**: if a template has a tab shortcut, it can be activated by typing that shortcut then hitting the tab key. Unfortunately this cannot work with selections.
-   **Keyboard shortcuts**: if a template has a keyboard shortcut, it can be activated by that keyboard combination. This can be useful for common templates, but keyboard shortcuts are limited in availability.
-   **Completion listing**: Showing code templates in the code completion list.
-   **Template list**: A command that shows all of avalable templates and allows the user to select one. It may be navigable by subcategories.

Advanced templates:

-   **Contextual templates**: templates thate are only available in certain contexts, e.g. within a method body.
-   **Surround-with templates**: templates that act upon a selection, embedding it within the template's content. For example surrounding code with a try/catch block.

### Existing Implementations

#### [ReSharper](http://www.jetbrains.com/resharper/features/code_templates.html "http://www.jetbrains.com/resharper/features/code_templates.html")

#### [Visual Assist](http://www.wholetomato.com/products/features/vasnippets.asp "http://www.wholetomato.com/products/features/vasnippets.asp")

#### [CodeRush](http://devexpress.com/Products/Visual_Studio_Add-in/Coding_Assistance/Templates.xml "http://devexpress.com/Products/Visual_Studio_Add-in/Coding_Assistance/Templates.xml")

#### [GEdit](http://live.gnome.org/Gedit/Plugins/Snippets "http://live.gnome.org/Gedit/Plugins/Snippets")

#### [TextMate](http://manual.macromates.com/en/snippets "http://manual.macromates.com/en/snippets")

#### [Visual Studio](http://msdn.microsoft.com/en-us/library/f7d3wz0k.aspx "http://msdn.microsoft.com/en-us/library/f7d3wz0k.aspx")

Visual Studio supports snippets via 2 mechanisms: tab-activation, or a dedicated snippet command. There is a snippet manager, and snippets are stored within the user's Documents directory. The snippet command launches a dedicated embedded mini-browser that can be used to find move advanced snippets within a directory structure; this means that not all snippets need have tab-activated shortcuts. Snippets may also be used to surround the current selection via a similar command.

The snippets are defined in an XML format, for which a full [schema](http://msdn.microsoft.com/en-us/library/ms171418.aspx "http://msdn.microsoft.com/en-us/library/ms171418.aspx") is available. The format supports placeholders, with mirroring and a few simple functions.

For C# it supports a limited number of [functions](http://msdn.microsoft.com/en-us/library/ms242312.aspx "http://msdn.microsoft.com/en-us/library/ms242312.aspx") that can be use to get the name of the enclosing class, generate switch statements for enum types, or remove unnecessary qualification on type names.

There is a Visual Basic [snippet editor](http://msdn.microsoft.com/en-us/vbasic/bb973770.aspx "http://msdn.microsoft.com/en-us/vbasic/bb973770.aspx"), and a more flexible open source [snippet editor](http://www.codeplex.com/SnippetDesigner "http://www.codeplex.com/SnippetDesigner").

Note that people sometimes have large collections of VS snippets, so being able to import this format would be good. This would also allow importing third-party collections such as [CodePlex.Snippets](http://www.codeplex.com/cpsnippets "http://www.codeplex.com/cpsnippets").

 There is some discussion at <https://bugzilla.novell.com/show_bug.cgi?id=386494>

### Rework snippet dialog usability

<span> </span>

<span id="_task_a_General.Wb.SnippetDialog"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

The snippet editing dialog is not easy to use. There are many examples in other IDEs and addins we could take inspiration from.

### Snippet sharing webservice

<span> </span>

<span id="_task_a_General.Wb.SnippetDownload"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Web service and integration to MD for sharing code snippets. This would make it super-easy for users to start contributing useful content to MD.

### Snippets provided by add-ins

<span> </span>

<span id="_task_a_General.Wb.SnippetFromAddins"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

It should be possible for addins, e.g. language bindings or project types, to add default code snippets.


