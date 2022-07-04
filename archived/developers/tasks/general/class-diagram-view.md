---
title: Class Diagram View
redirect_from:
  - /Developers/Tasks/General/Class_Diagram_View/
  - /Class_Diagrams/
  - /Class_Diagram_View_Proposal/
  - /Class_diagram_view_proposal/
  - /Proposals/Class_Diagram_View_Proposal/
  - /Developers/TODO/Proposals/Class_Diagram_View_Proposal/
  - /Developers/Proposals/Class_Diagram_View_Proposal/
---

<span> </span>

<span id="_task_a_General.ClassDiagram"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|----------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                    | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-High" style="font-size: x-small;">High</span> | <span class="task-target" style="font-size: x-small;"></span> |

### Overview

It would be useful to has a visual tool for browsing and editing the class hierarchy, like the class diagram tool in Visual Studio or UML editors.

### Features

#### Exploring

The canvas would allow exploring the types available in MonoDevelop's internal Code DOM. This means it will work for source code and assemblies.

-   The canvas would show types (classes/interfaces/enums/structs) as items with lists of members and the base classes/interfaces.
-   The different kinds of members within each type should be grouped into collapsible sections.
-   Items' members and base class/interfaces should be expandable with a click. This would add the corresponding type's item to the diagram, linked by an arrow (or a double-arrow for IEnumerable collections).
-   It should be possible to rearrange items on the canvas by dragging the headers.
-   Double-clicking on an item should jump to the source code.
-   The diagram should be serialised to/from a file, preferably the XML .cd file format the Visual Studio uses.
-   Printing and exporting PNG files would be useful.

#### Editing

-   When the language binding for a project supports refactoring features, the class diagram should expose some of those features from the GUI, e.g. renaming, adding/removing members, creating classes, etc.

### Implementation

#### Tasks

-   Basic addin infrastructure
    -   Extend /MonoDevelop/Ide/DisplayBindings with a view that can handle .cd files.
    -   Registering the mimetype with MonoDevelop.
    -   Add a template for a new .cd file.
    -   Add a command to the code context menu to launch the diagram view from an existing class.
-   Implement the canvas using moonlight
    -   dragging objects
    -   links/arrows and routing
    -   autolayout
-   Interface it to the code completion database for type information.
-   Implement a property provider for editing types using MD's Refactorer engine.
-   Add a pad for editing types' members using the Refactorer.
-   Implement a toolbox provider so that new types can be dragged from the toolbox.

#### Justification for using Moonlight

-   A stable canvas
-   Has a good Mono binding
-   Can load shapes and animations from XAML -- makes theming and graphical prettiness much easier
-   Good demo of Moonlight in an app; dogfooding Moonlight

#### Shared Designer Canvas

It would be useful if the designer canvas were a re-usable component, so that it could be used for visualising things like database tables and relationship. As long as the canvas is well-separated from the form of the actual data it's visualising, this should not be hard.
