---
title: MonoDevelop 2.2.2 Released
redirect_from:
  - /Download/MonoDevelop_2.2.2_Released/
---

**MonoDevelop 2.2.2** has been released. MonoDevelop is a GNOME IDE primarily designed for C# and other .NET languages.

This is a release based on the 2.2 stable branch, and includes many bug fixes and some feature improvements.

Bug Fixes
---------

Here is a summary of the most important fixes:

-   C#
    -   Find references doesn't work for constructor'
    -   Matching brace shouldn't be added inside comment
    -   Fixes in declare local code generator
    -   Prevent hang from permissions on recently-used file
    -   Fixed verbatim strings in C# formatter
    -   Don't pass MD's MONO\_PATH to app runtimes
    -   C# completion fixes
-   Text editor
    -   Bug 577933 - Text editor cannot be scrolled
    -   Bug 576350 - Middle-click paste clears selection
    -   Bug 580427 - Exception, then crash while editing text
    -   Bug 580395 - Exception deleting several lines in a C# file
    -   Don't insert extra new lines when formatting a file
-   Debugger
    -   Updated soft debugger client, compatible with Mono 2.6.3
    -   Bug \#576427 - Debugger hides any user exception.
    -   Mark unresolved breakpoints as invalid.
    -   Fix catchpoints for System.Exception.
    -   Include System.Exception in Exceptions dialog
-   Web references
    -   Basic authentication in web refs dialog.
-   Moonlight
    -   Bug 575657 - Crash in custom execution modes.
    -   Don't ever use Moonlight smcs.exe directly
    -   Debugger eval resolution fix
    -   Fix building with SL redist assemblies
    -   Debugger evaluation type count fix
-   Mac
    -   Force QuartzGL off.
    -   Properly report build revision.
-   IPhone
    -   Fix duplicate generated classes.
    -   Fix SDK version checks.
    -   Construct default bundle ID from installed profiles.
    -   List all SDKs. Resolve identity before building. Better errors.
    -   Force-regen designer files after cleaning.
    -   Update designer files when project changes.
    -   In generated code, keep track of native wrappers in fields.
    -   Track MonoTouch API change reversions.
    -   Don't try to read the Apple DTD from the web.
    -   Don't pass duplicate refs to mtouch.
    -   Fix the NeedsUploading check.
    -   Handle new IB property.
    -   Fix typo that broke storing i18n options.
    -   Fix typo in template
    -   Don't try to run app if bundle does not exist.
    -   Enable "run" command in device mode.
    -   Don't copy icon unless changed.
-   Translations
    -   Updated german translation
-   Other
    -   Added printing support
    -   Expose Code Generator command in menus.
    -   Don't show Close Workspace checkbox on save.
    -   Prevent occasional NRE in SvnClient
    -   Capture ACLOCAL\_FLAGS for autoreconf
    -   Fixed Toolbox toolbar tooltips.
    -   Add missing framework assemblies.
    -   Fixed crash on Mono.Cecil.Binary.ImageFormatException

Getting MonoDevelop
-------------------

Packages for several distros and platforms, as well as source code tarballs and build instructions are available in the MonoDevelop [Download](../../../../Download) page.

This release of MonoDevelop needs at least **Mono 2.4** and **Gtk# 2.12.8** to run.
