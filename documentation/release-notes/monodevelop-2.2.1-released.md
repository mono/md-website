---
title: MonoDevelop 2.2.1 Released
redirect_from:
  - /Download/MonoDevelop_2.2.1_Released/
---

**MonoDevelop 2.2.1** has been released. MonoDevelop is a GNOME IDE primarily designed for C# and other .NET languages.

This is a release based on the 2.2 stable branch, and includes many bug fixes and some feature improvements.

Bug Fixes
---------

Here is a summary of the most important fixes:

-   Debugger
    -   Better support for enums.
    -   Show an error message if a breakpoint can't be inserted.
    -   570855 - Poor type resolution in debugger
    -   Don't show 'Expression not Supported' messages when inspecting values with the debugger tooltip.
    -   571232 - System.FormatException: Input string was not in a correct format.
    -   Improved error reporting.
    -   Fixed exception when calling ToString on structs.
-   Mac fixes
    -   New help browser
    -   Fixed issue with floating pad selection
    -   Fix quoting creating log dir
    -   Improved updater.  Added Alpha channel. Add support for opt-in betas.
    -   Fixed dynamic-abbrev mac keybindings.
-   Projects
    -   515013 - Compiling; a method call on an object that does not exist produces incomprehensible /tmp/\*.tmp error
    -   Use WinExe as target project type for Gtk# projects.
    -   Properly update the default target runtime when a new Mono runtime is installed.
    -   Don't copy "support assemblies"; such assemblies should be referenced directly.
-   C#
    -   561964 - Wrong type in tooltip when there are two properties with the same name
    -   564378 - Inline comments in C# with ///\< screw up code coloring
    -   564387 - \#if 0 grayed out until \#endif
    -   550947 - Arrays initailizers should not automatically be split on multiple lines
    -   Brace forcement formatting option is now saved.
    -   Misc formatting fixes.
    -   571175 - ArgumentNullException in C# code completion.
    -   Better FIXME comment parsing & display.
    -   560510 - Preprocessor enabled code shows as comment anyway.
    -   561589 - Infinite loop throwing an exception crashes system.
-   Text editor
    -   566249 - InvalidCastException when deleting some text in the text editor
    -   Fixed bug with windows line endings.
    -   569545 - TextEditor sometimes adds LF on Windows.
-   Gtk# Designer
    -   565492 - Gtk# Visual Designer Doesn't work with Gtk# \<2.12
    -   Disabled checkerboard background in Gtk# designer because it had rendering performance issues.
-   Workbench
    -   Rendering improvements in the dock toolbars.
    -   561609 - Unhandled exception searching in my project
    -   569588 - Pressing 'escape' in the Delete Project dialog removes the project
    -   570188 - Incorrect description of options in delete dialog.
-   Moonlight
    -   Don't generate codebehind for xaml file with no class
    -   Respect Moonlight resources IDs.
    -   when generating fields for fully qualified types, use global references to keep from conflicting type/namespace names.
    -   566233 - Solution doesn't compile if code uses any IsolatedStorageFile method such as DirectoryExists.
-   IPhone
    -   Added iPad app template
    -   Fix project template option handling
    -   Pass SDK version to mtouch when running in sim
    -   Sdk version settable from templates
    -   Fix persisting SDK version and I18n after editing.
    -   Fix new templates' xibs and headers.
    -   Fix displaying I18N options.
    -   Make main nib picker editable so it can be cleared.
    -   Add MonoDoc source for MonoTouch docs.
    -   Added more project templates.
    -   Default empty identities to "developer automatic".
    -   Fixed loading dist certs with commas in name.
    -   Skip duplicate provisioning profiles. Work around bug in Apple's entitlements plist parser.
    -   Merge entitlements from provisioning profiles and report signing problems better.
-   Other
    -   561589 - Infinite loop throwing an exception crashes system
    -   C projects: Allow parsing of headers included from packages
    -   Fix memory leaks.
    -   German translation updates
    -   Fixed null reference exception when running XSP.
    -   Added extension point for snippets, so that add-ins can now register their own snippets.

As this is a stable release, it's no longer run in debug mode by default, which reduces MonoDevelop's memory use.

Getting MonoDevelop
-------------------

Packages for several distros and platforms, as well as source code tarballs and build instructions are available in the MonoDevelop [Download](../../../../Download) page.

This release of MonoDevelop needs at least **Mono 2.4** and **Gtk# 2.12.8** to run.
