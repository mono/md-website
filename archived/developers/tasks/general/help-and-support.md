---
title: Help and Support
redirect_from:
  - /Developers/Tasks/General/Help_and_Support/
  - /Developers/Tasks/Help_and_Support/
---

### Document APIs using XML docs

<span> </span>

<span id="_task_a_General.Help.ApiDocs"></span><span> </span>

|--------------------------------------------------------------------------------------|----------------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                                  | **<span style="font-size: x-small;">Owner</span>**                   | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                  | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-In Progress" style="font-size: x-small;">In Progress</span> | <span class="task-owner" style="font-size: x-small;">everyone</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Low" style="font-size: x-small;">Low</span> | <span class="task-target" style="font-size: x-small;"></span> |

The public MD APIs should be documented with XML docs so that developers working on MD or writing addins get tooltips etc. At this point these are much easier to maintain than MonoDoc sources.

### Integrated help for MD

<span> </span>

<span id="_task_a_General.Help.IntegratedHelp"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                  | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Low" style="font-size: x-small;">Low</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

It would be useful for MonoDoc to have integrated help for common topics. This could perhaps be maintained via DocBook and exported to each platform's natuive help system.

### Recording and annotation of MD session for interactive walkthroughs/tours

<span> </span>

<span id="_task_a_General.Help.TourRecording"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                  | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Low" style="font-size: x-small;">Low</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

For tutorials, walkthroughs and tours, it would be useful to be able to record actions and inputs in a MD session and annotate it with tooltips containing explanations. Then users could step through these recordings at their own pace directly in the IDE.

Rather than a full general purpose app recording tool, we would want something deeply integrated into MD taking advantage of the MD APIs.

In recording mode, there would be a pad with a list of walkthrough steps. The use could add, remove and reorder steps. For each step, they could edit the title and description, and enter a recording mode, which would record commands, pad/view focus changes, and text inserted into the text editor. Support for recording additional kinds of actions could be added later.

In playback mode, the user could search all the walkthough from the walkthrough pad, and on selecting one, they would be shown a list of steps. Clicking on a step would make MD draw a highlight & tooltip on the commands or views/pads described in the step. Clicking on a recorded text snippet would insert it into the editor.

The infrastructure would also provide a good basis for a macro system.

### Local MonoDoc server

<span> </span>

<span id="_task_a_General.Help.LocalMonoDocServer"></span><span> </span>

|--------------------------------------------------------------------------------|--------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                            | **<span style="font-size: x-small;">Owner</span>**                 | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Assigned" style="font-size: x-small;">Assigned</span> | <span class="task-owner" style="font-size: x-small;">mhutch</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-1w" style="font-size: x-small;">1w</span> | <span class="task-target" style="font-size: x-small;">2.8</span> |

A MonoDoc web server built into MD so that we have docs browser even on platforms that don't have a MonoDoc GUI. VS 2010 actually removed their dedicated browser in favour of somthing like this.

Should be quite simple because we can re-use xsp and the existing docs server.
