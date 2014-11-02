---
title: Logging
redirect_from:
  - /Developers/Articles/Logging/
  - /Logging/
---

### Overview

MonoDevelop's logging system provides a mechanism for AddIns to report errors and warnings that can assist in tracking down bugs or unexpected behaviour. It can also be used to log incidental information that may be of interest to the user, and debugging information for more detailed analysis of the MonoDevelop's internal behaviour.

### Logging Levels

The defined logging levels are, in descending order of importance,

-   **Fatal**: an error of sufficient magnitude that it cannot be handled.
-   **Error**: an error that prevents an operation from completing successfully, but can be handled without affecting MonoDevelop's continued operation.
-   **Warn**: an problem that can be handled without preventing the completion of the affected operation.
-   **Info**: information of incidental value to the user.
-   **Debug**: debug information that will only need to be seen when tracking down specific problems.

For the purpose of specifying logging levels that should be reported, the self-explanatory levels **All** and **None** are defined. Also defined are **UpToFatal**, **UpToError**, **UpToWarn**, **UpToInfo** and **UpToDebug**, which correspond to all levels with importance equal to or greater than the named levels.

### Loggers

#### Console Logger

The console logger is the most important logger for identifying the cause of major problems, as it is enabled by default and its output will survive a major crash. The logging level defaults to *UpToWarn*, and can be set with the environment variable *MONODEVELOP\_CONSOLE\_LOG\_LEVEL*.

Although the messages can be colour-coded in order to aid visual identification of the different levels, this feature has been known to cause unusual console behaviour and hence is disabled by default. It can be enabled by setting the environment variable *MONODEVELOP\_CONSOLE\_LOG\_USE\_COLOUR=True*.

#### File Logger

If the environment variable *MONODEVELOP\_LOG\_FILE* is set, MonoDevelop will log messages to the file named in this variable. The logging level can be specified in the environment variable *MONODEVELOP\_FILE\_LOG\_LEVEL*, and defaults to *UpToInfo*.

#### Internal Message Pad

The internal message pad is a Pad in the MonoDevelop IDE that records all log messages up to the level defined in the environment variable *MONODEVELOP\_LOGGING\_PAD\_LEVEL*. If the variable is not set, it defaults to the value *UpToInfo*.

### The Logging API

MonoDevelop's Logging API is accessible via the static MonoDevelop.Core.LoggingService class, but most of the implementation details are in the namespace MonoDevelop.Core.Logging. It maintains a collection of *ILogger*-implementing loggers and broadcasts log messages to them.

The basic logging call is Log (LogLevel level, string message). For convenience, the following methods log with preset logging levels

-   LogDebug
-   LogInfo
-   LogWarning
-   LogError
-   LogFatalError

each offering the overloads

-   (string message)
-   (string message, Exception ex)
-   (string messageFormat, params object[] args)

New ILoggers may be implemented and added to the LoggingService with a call to *AddLogger (ILogger logger)*. Each logger's Name property must be unique among the registered loggers, so that they can be accessed by name with *ILogger GetLogger (string name)* and unregistered with *void RemoveLogger (string name)*.
