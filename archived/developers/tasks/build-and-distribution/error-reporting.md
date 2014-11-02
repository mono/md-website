---
title: Error Reporting
redirect_from:
  - /Developers/Tasks/Build_and_Distribution/Error_Reporting/
---

### Crash handler that can upload logs

<span> </span>

<span id="_task_a_ErrorReporting.CrashHandler"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

Build a crash handler that can automatically upload error logs and system information when errors/crashes happen. I suggest this should be a small standalone tool so that we can catch native crashes. Then the MD startup script can do somthing like "mono MonoDevelop.exe || mono MDCrashhandler.exe --upload-log" so that if the main MD process exits nonzero then the crash handler will get run. We coul also give this tool the capability to be run directly by the user, in which case it would  run a "kill -QUIT" on a hung MD process, kill the process for real, then upload the log.

It might also be useful to have a method on the logging service that would launch the error handler app. Some erros that are logged are ""normal", e.g. parser errors, unknown project types, etc, but some are definitely errors and it would be useful to report these automatically.

### Detailed build and system information

<span> </span>

<span id="_task_a_ErrorReporting.SystemInformation"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

It would be useful to have detailed information about the MD build and the user's system in the about box, which could be copied into bug reports. Possible info:

Machine info: number of processors, processor speed, amount of RAM
 OS info: OS and version, GTK version, Mono/.NET version
 MD info: version, svn revision, previous versions used w/profile, working set, enabled addins, config dir. size, number of snippets, some prefs, e.g code completion settings, theme, default policy

It should also be possible for addins to provide hooks for additional info.

### Session Logging

<span> </span>

<span id="_task_a_ErrorReporting.SessionLogging"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

It would be useful to be able to log MD sessions for usability, reliability and performance analysis. Such a log could contain:

- A unique client-generated GUID identifying client, so we can link sessions from one client
- Time started, time ended
- All commands run, with timestamp, source, target, id
- Pad/view focus switches
- Solution/project open events, size, type, no of refs, features used, compilation times
- File open events, size, encoding, time to load editor
- PIDB files loaded, names if standard libraries, else size
- Exceptions, errors and warnings
- Other misc. metrics, e.g. time to show code completion

### Opt-in Data Collection

<span> </span>

<span id="_task_a_ErrorReporting.DataCollection"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;"></span> |

It would be useful to be able to collect certain kinds of anonymous data from MD users, which would be analysed to improve reliability, performance and usability.

There could be several levels of opt-in. The default would be to ask each time an error happens by showing a dialog, but users would also be also to choose to upload system information and even session logs.


