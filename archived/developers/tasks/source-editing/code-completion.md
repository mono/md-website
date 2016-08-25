---
title: Code Completion
redirect_from:
  - /Developers/Tasks/Source_Editing/Code_Completion/
  - /Proposal%3A_Code_Completion/
  - /Proposals/Proposal%3A_Code_Completion/
  - /Developers/TODO/Proposals/Proposal%3A_Code_Completion/
  - /Developers/Proposals/Proposal%3A_Code_Completion/
  - /Developers/Proposals/Code_Completion/
---

### ! as code completion closing key

<span> </span>

<span id="_task_a_SourceEditing.CodeCompletion.ClosingKey"></span><span> </span>

|----------------------------------------------------------------------------------|----------------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|-----------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                   | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**         |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mkrueger</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;">2h</span> |

We should have intelligent '!' as closing key.

For example:

if (myObj.$\<- code completion In the list is: GetIsValid ()

The user hits '!' it should be changed to if it's the only option:

if (!myObj.GetIsValid ()$

if GetIsValid has overloads or contains parameters:

if (!myObj.GetIsValid ($

The '!' should be inserted automatically to negate the expression.

### Custom Filtering/Sorting/Grouping

<span> </span>

<span id="_task_a_SourceEditing.CodeCompletion.CustomSortFilterGroup"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Buttons along the bottom of the completion list for toggling custom group/filter modes:

-   group by inheritance level, for example a GtkButton would show:
    -   [GtkButton]
        -   Text
    -   [GtkContainer]
        -   ContainerMethod1
        -   ContainerMethod2
    -   [GtkWidget]
        -   WidgetMethod1
        -   WidgetMethod2
    -   [GtkObject]   
        -   GtkObjectMethod1
    -   [System.Object]
        -   Equals
        -   GethashCode
-   The captions should be present, but not selectable.
-   only show commonly used items (VB has this)

Grouping would interfere somewhat with the keyboard matching for the normal filter/sort behaviour, so would need some tuning to make it usable. Perhaps when grouping is active, the keyboard matching could only match within the current group, and there could be keybindings for jumping between groups, maybe ctrl-up/ctrl-down.

It would also be important to have keyboard shortcuts for these buttons - though maybe just alt-mnemonics would do.

Other options, but these need to be evaluated based on actual requirements and interest from the community and not just dump them in there:

-   group by item type (fields/methods/properties/types/templates/keywords)
-   group by accessibility

### Weight matches by History

<span> </span>

<span id="_task_a_SourceEditing.CodeCompletion.MatchOnHistory"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Restore the feature where history is taken into account when weighting matches in the completion list against what the user's typed.
