---
title: Environment Variables
redirect_from:
  - /Developers/Articles/Environment_Variables/
  - /Environment_Variables/
---

MonoDevelop allows its behavior the be changed by several Environment variables. Some of those will come in handy when developing new MonoDevelop addins or when using a parallel MonoDevelop install.

### Logging

-   **MONODEVELOP\_CONSOLE\_LOG\_LEVEL**
    -   Default value: UpToWarn
    -   Possible Values
        -   None
        -   All
        -   Fatal
        -   Error
        -   Warn
        -   Debug
        -   UpToFatal
        -   UpToError
        -   UpToWarn
        -   UpToInfo
        -   UpToDebug

This variable allows to change the level of details that are logged into the console.

-   **MONODEVELOP\_CONSOLE\_LOG\_USE\_COLOUR**
    -   Default value: false
    -   Possible Values
        -   true
        -   false

If true, messages logged in the console will be colored according to their severity.

-   **MONODEVELOP\_LOG\_FILE**
    -   Default value: *not set*
    -   Possible Value: *a filename*

If set, all log messages will be appended to the specified file.

-   **MONODEVELOP\_FILE\_LOG\_LEVEL**
    -   Default value: UpToInfo
    -   Possible Values
        -   See MONODEVELOP\_CONSOLE\_LOG\_LEVEL

This variable allows to change the level of details that are logged using the file logger.

-   **MONODEVELOP\_LOGGING\_PAD\_LEVEL**
    -   Default value: UpToInfo
    -   Possible Values
        -   See MONODEVELOP\_CONSOLE\_LOG\_LEVEL

This variable allows to change the level of details that are shown inside the "Internal Message Log" pad.

### Additional Debug Information

-   **MONODEVELOP\_DISPATCH\_DEBUG**
    -   Default value: *not set*
    -   Possible Value: *anything (doesn't matter), eg: "true"*

When this variable is set, exceptions generated inside a dispatched method will also log their stacktrace.

### Other

-   **MONO\_ADDINS\_REGISTRY**
    -   Default value: ~/.config/MonoDevelop

This variable allows to override the location of the addin repository. This is especially useful when working with a parallel MonoDevelop install, to completely seperate all addins so they can't override each other.
