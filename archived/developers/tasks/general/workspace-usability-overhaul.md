---
title: Workspace Usability Overhaul
redirect_from:
  - /Developers/Tasks/General/Workspace_Usability_Overhaul/
  - /Developers/Proposals/Editor_and_Workspace_Usability_Overhaul/
  - /Developers/Tasks/General/Editor_and_Workspace_Usability_Overhaul/
---

After MD 2.2 we will be making a push to overhaul the usability of the editor and workspace experiences.

### New Layout Switcher

<span> </span>

<span id="_task_a_General.Wb.NewLayoutSwitcher"></span><span> </span>

|--------------------------------------------------------------------------------|-------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                            | **<span style="font-size: x-small;">Owner</span>**                | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Assigned" style="font-size: x-small;">Assigned</span> | <span class="task-owner" style="font-size: x-small;">lluis</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-1w" style="font-size: x-small;">1w</span> | <span class="task-target" style="font-size: x-small;"></span> |

The idea is to make it easier to switch between workspace layouts by using a new Layout Switcher bar.

The layout feature would be extended to support custom GUI for layouts. For example, the welcome page could be one of such layouts (that is, instead of a document shown in the workspace, the welcome page could be an entire new wokspace filling all the main MD window).

### Content Area

<span> </span>

<span id="_task_a_General.Wb.ContentArea"></span><span> </span>

|--------------------------------------------------------------------------------|-------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                            | **<span style="font-size: x-small;">Owner</span>**                | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Assigned" style="font-size: x-small;">Assigned</span> | <span class="task-owner" style="font-size: x-small;">lluis</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-2w" style="font-size: x-small;">2w</span> | <span class="task-target" style="font-size: x-small;">2.8</span> |

Lots of space wasted around the content region by GTK notebook spacing. Could gain a few pixels quite easily.

Documents should be able to be **detached** and left floating, or docked **side-by-side**

The **document tabs** for the document area get hard to navigate through when there are many of them. Maybe we can take a cue from web browsers as well as other IDEs. For example, VS and firefox show a dropdown menu list of documents at the far right of the tabs.

### Browser-Like Navigation

<span> </span>

<span id="_task_a_General.Wb.BrowserLikeNavigation"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;">2.8</span> |

Something that has been proposed is to make each document view act like a web browser tab. This idea is based on Xcode 4. Code navigation within each view tab would change the contents of that view, instead of opening a new view tab. There would be a way to open new new tabs, similar to middle-clicking links in a browser. Tabs could be dragged off into new windows, docked side by side, etc. 

This would solve the problem that code navigation, which is a very important part of a modern IDE, usually causes many new tabs to open automatically, which rapidly becomes annoying and difficult to manage. Users are already very familiar with how tabs and navigation in a web browser work.

This also means that files in the solution pad could be opened with a single-click instead of a double-click, without risking massive proliferation of tabs.

A key part of the browser-like navigation is putting a forward and back button and a history dropdown at the top-left of the document view, exactly like a web browser.

There are couple of difficulties with implementing browser-based navigation. It's important to maintain state for files that have been navigated away from - location, undo/redo state, etc - and especially unsaved information. Xcode implements this by maintaining a list of unsaved files and recently accessed files, which can be accessed from a menu. The recent files list has a fixed length, and when files move off the list, their state is discarded. Unsaved files are kept on a separate list and obviously are never discarded. Presumably Xcode is maintaing a store of editor models and view state. If multiple views show the same file, they use the same editor model, but have different view state.

This would enable implementing the Project Breadcrumb Bar.

### Project Breadcrumb Bar

<span> </span>

<span id="_task_a_General.Wb.ProjectBreadcrumbBar"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;">2.8</span> |

MonoDevelop 2.6 has a breadcrumb bar that shows the class and method position with the current file. It's also used for XML and HTML files, for which it shows the tag hierarchy.

Xcode 4 has a much more powerful breadcrumb bar which shows the full project-relative path of the file. Each breadcrumb item can be used to drop down a drill-down menu which enables directly navigating to other files without using the solution pad. The menu also provide easy access to related files (header, designer files, etc).

### Chrome Notebook Tabs

<span> </span>

<span id="_task_a_General.Wb.ChromeBrowserTabs"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;">2.8</span> |

Make the content area tabs act like the Google Chrome tabs. Chrome's tabs have many subtle tweaks that make them much more usable than normal notebook tabs.

### Compile/Error workflow

<span> </span>

<span id="_task_a_General.Wb.Errors"></span><span> </span>

|----------------------------------------------------------------------------------|----------------------------------------------------------------------|----------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                   | **<span style="font-size: x-small;">Importance</span>**                    | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mkrueger</span> | <span class="task-importance-High" style="font-size: x-small;">High</span> | <span class="task-complexity-1w" style="font-size: x-small;">1w</span> | <span class="task-target" style="font-size: x-small;">2.4</span> |

~~The build output and error pads should **not be shown automatically** when building, as this is distracting and takes a lot of screen space. If users want to see it, they can show the pad.~~ [fixed]

After building, MDs should add **message bubbles** with all the errors and warnings.

If there is an error when building, MonoDevelop should **jump** to the first error bubble. If error bubbles are disabled, MD should show the error pad.

### Removing the status bar

<span> </span>

<span id="_task_a_General.Wb.StatusBar"></span><span> </span>

|----------------------------------------------------------------------------------|-------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Discarded" style="font-size: x-small;">Discarded</span> | <span class="task-owner" style="font-size: x-small;">lluis</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-4d" style="font-size: x-small;">4d</span> | <span class="task-target" style="font-size: x-small;"></span> |

The status bar takes up a lot of space and provides little information. We should be able to show this information elsewhere and save space.

**OVR/INS markers** are not useful - the caret already looks different in these different states, and modern keyboards don't even have an Insert key any more.

**Line/column numbers** could be shown at the right of the text editor's horizontal scrollbar. This same space could be used for the "go to line" entry, so clicking on the line numbers could be used to activate the "go to line" mode.

**Message strings** could be displayed as a pop-up status tip in the editor like the Chrome web browser does. However, messages aren't always associated with the text editor, so this may be sub-optimal.

**Status Icons** do not have an obvious location they could go, but they are tiny.

There are also things that we don't have in the status bar now would be good to have somewhere visible:

The **active configuration**. This is the only thing I use the toolbar for right now.

The build **error count**, for accessing the error pad if using message bubbles

### New Project/File dialogs

<span> </span>

<span id="_task_a_General.Wb.NewProjectDialog"></span><span> </span>

|----------------------------------------------------------------------------------|--------------------------------------------------------------------|----------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                 | **<span style="font-size: x-small;">Importance</span>**                    | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mhutch</span> | <span class="task-importance-High" style="font-size: x-small;">High</span> | <span class="task-complexity-8d" style="font-size: x-small;">8d</span> | <span class="task-target" style="font-size: x-small;">2.4</span> |

The categorization system makes it hard to find things, and the layout of the list of file types can get very uneven. We could improve this it several ways.

A **Search/Filter** widget, to filter the template list based on keywords

**Options/Properties** for templates, to combine the templates that are simple variations on a theme, e.g. the "ASP.NET page with CodeBehind" and "ASP.NET page without CodeBehind" can get combined into ASP.NET page with a "use Codebehind" toggle property, and ASP.NET content pages can allow picking a master page.

**Smaller icons**, since the textual descriptions are generally more useful that the icons.

A **recently used** category to make it easy to find favourite templates.

Use **keywords** instead of categories so that templates can appear in multiple categories

**Required keyword as option**. We have something like this currently with the "language" category, which is actually an option of the templates. So for example, the "target framework" could also be both a searchable keyword/grouping and an option to the templates.

The **project features** panel is often irrelevant. We should offer the opportunity to skip it.

It would also be nice to have UI for importing/exporting user templates, and loading user templates from an online service.

### Overhaul of the template system

<span> </span>

<span id="_task_a_General.Wb.TemplateSystem"></span><span> </span>

|--------------------------------------------------------------------------------|--------------------------------------------------------------------|----------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                            | **<span style="font-size: x-small;">Owner</span>**                 | **<span style="font-size: x-small;">Importance</span>**                    | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Assigned" style="font-size: x-small;">Assigned</span> | <span class="task-owner" style="font-size: x-small;">mhutch</span> | <span class="task-importance-High" style="font-size: x-small;">High</span> | <span class="task-complexity-1w" style="font-size: x-small;">1w</span> | <span class="task-target" style="font-size: x-small;">2.8</span> |

Create a new template system for creating projects and files which is more flexible and easier to extend. Some ideas:

-   We could use **T4** for this - but how much MD API should we expose to the templates?
-   Make it easier for the end user to **create new templates**. For example, we could allow creating a template out of an existing project.
-   Very interlinked with the new project/file dialogs.
-   Load templates from a **user templates** directory, instead of forcing users to create addins.
-   Templates with **options/properties** - file, class, text w/regex validation, toggles, combobox, etc.
-   Allow **per-solution overriding** of templates, like ASP.NET MVC does?
-   Support features needed by the existing separate ASP.NET MVC template system?

### Solution Pad

<span> </span>

<span id="_task_a_General.Wb.SolutionPad"></span><span> </span>

|--------------------------------------------------------------------------------|-------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                            | **<span style="font-size: x-small;">Owner</span>**                | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Assigned" style="font-size: x-small;">Assigned</span> | <span class="task-owner" style="font-size: x-small;">lluis</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-4d" style="font-size: x-small;">4d</span> | <span class="task-target" style="font-size: x-small;">2.8</span> |

**Finding files** in the solution pad is hard because the GTK treeview's find-as-you-type doesn't find the lazily loaded parts of the tree. We need a custom search.

Maybe the "**go to file**" command could be shown on the solution pad.

It would be good to make the "**show all files**" more discoverable.

### Add References Dialog

<span> </span>

<span id="_task_a_General.Wb.AddReferences"></span><span> </span>

|--------------------------------------------------------------------------------|--------------------------------------------------------------------|----------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                            | **<span style="font-size: x-small;">Owner</span>**                 | **<span style="font-size: x-small;">Importance</span>**                    | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Assigned" style="font-size: x-small;">Assigned</span> | <span class="task-owner" style="font-size: x-small;">mhutch</span> | <span class="task-importance-High" style="font-size: x-small;">High</span> | <span class="task-complexity-1w" style="font-size: x-small;">1w</span> | <span class="task-target" style="font-size: x-small;">2.8</span> |

Usability is lacking here, especially the Assembly file picker.

### Property Pad

<span> </span>

<span id="_task_a_General.Wb.PropertyPad"></span><span> </span>

|--------------------------------------------------------------------------------|-------------------------------------------------------------------|--------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                            | **<span style="font-size: x-small;">Owner</span>**                | **<span style="font-size: x-small;">Importance</span>**                  | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Assigned" style="font-size: x-small;">Assigned</span> | <span class="task-owner" style="font-size: x-small;">lluis</span> | <span class="task-importance-Low" style="font-size: x-small;">Low</span> | <span class="task-complexity-1w" style="font-size: x-small;">1w</span> | <span class="task-target" style="font-size: x-small;">2.8</span> |

The property pad needs to be a lot **denser**, and maybe have a **filter entry**, since finding properties almost always involves scrolling.

The property pad should support **multi-select**, since users expect this.

Perhaps the property pad could also support **actions**, buttons that would expose commands normally hidden in the context menu.

### Option Dialogs

<span> </span>

<span id="_task_a_General.Wb.OptionDialogs"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

The option dialogs for projects, solutions and global preferences can be improved. The problem is that those dialogs are created by merging options coming from different add-ins, and the resulting layout is not very convenient. For example, see the Visual Style panel in the preferences dialog.

A solution could be to add more granularity to the extension model. For example, there could be a panel with a tree-like list of options where add-ins could insert their own options, instead of scattering them in some random place in the panel.

### Structured Output Pads

<span> </span>

<span id="_task_a_General.Wb.OutputPads"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Use a structured text view for the build output pad, so that individual tasks can be collapsed or expanded.

### Hyperlink Error Pad from Status Bar

<span> </span>

<span id="_task_a_General.Wb.HyperlinkErrorPadFromStatus"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

When MD is showing the build results in the status bar it would be useful to hyperlink the error pad and/or build output pad from the result message, like Xcode does.


