---
title: What's new in MonoDevelop 3.0.4
redirect_from:
  - /Download/What's_new_in_MonoDevelop_3.0.4/
---

#### MonoMac / MonoTouch improvements

-   New Archive support for MonoTouch/Mac projects. The Build / Archive command archives the current build configuration. The View / Archives command shows a list of all archived builds. It allows users to use Xcode’s Archive Organizer to submit archived builds to the App Store.
-   New “Resources” folder. There is no need to clutter root project directory w/ icons or other bundled resources anymore. With the BundledResource build action, you can also override the Bundle Id (so it doesn’t have to match the file name, which means you can use msbuild conditions)

#### Improved Version Control support

-   MonoDevelop detects changes to files which happen in the background and refreshes their version control status.
-   Support for untrusted Https certificates has been improved. MonoDevelop will now prompt to ask if they should be accepted or rejected instead of silently rejecting them. This resolves the issue where some people could not check out repositories on Github.com using Https.
-   Support for the Git Http protocol has been made more robust against servers which have invalid Http headers. This resolves the issues some people may have experienced with repositories hosted on AppHarbor.
-   If publishing a git repository fails, MonoDevelop will now properly roll back all intermediate changes.
-   Fixed many issues with Git support on Windows.

#### Android deployment

-   The Android deployment system has been completely rewritten
-   Shows a progress bar for file uploads
-   Much faster, since it detects and skips unchanged files
-   More robust, with better error reporting
-   Improved support for Jellybean (4.1) devices

#### Projects

-   The checks to decide if a resx file needs rebuilding have been improved. The result is that projects with a large number of resx files should notice that builds and rebuilds are faster.
-   Improved support for .NET 4.5
-   Added support for VB.NET 4.0 projects

#### ASP.NET

-   Improved ASP.NET MVC2 and MVC3 support, including Razor templates (requires Mono 2.11)

#### Other improvements and bug fixes

-   Fixed rendering on MacBook with retina display
-   Fixed several editor issues with code completion and refactoring
-   Fixed assembly browser loading issues
-   Fixed evaluation of DebuggerDisplay expressions
-   Optimized source code analysis
-   Optimized code generation in the Gtk# designer
