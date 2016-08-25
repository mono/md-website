---
title: MonoDevelop 2.4.2 Released
redirect_from:
  - /Download/MonoDevelop_2.4.2_Released/
---

The MonoDevelop team is proud to announce the release of **MonoDevelop 2.4.2**.

MonoDevelop is an IDE primarily designed for C# and other .NET languages. MonoDevelop enables developers to quickly write desktop and ASP.NET Web applications on Linux, Windows and Mac OSX. MonoDevelop makes it easy for developers to port .NET applications created with Visual Studio to Linux and Mac OSX and to maintain a single code base for all platforms.

This is a release based on the **2.4 stable** **branch**, and includes many bug fixes and some feature improvements.

New Features
------------

 This release is mainly a bug fix release, but it also includes some new features and improvements:

-   Support for future MonoDroid releases
-   Support for running ASP.NET 4.0 applications (XSP4).

Bug Fixes
---------

Here is a summary of the most important fixes:

Projects

-   656696 - project (both C# and VB) properties aren't deserialized correctly from vb/csproj files
-   659511 - After Build events do not work as expected
-   663305 - Deleting project configurations is not persistent
-   657619 - Crashing on adding files from 'Solutions' (runtime error)
-   658583 - The error is not displayed and the app closes
-   659131 - Build failed: The system cannot find the file specified
-   625370 - MD adds duplicate MSBuild imports to VS2008+ projects
-   643250 - Compiler does not embed resources into assembly [Boo binding]
-   Improve project deletion confirmation message
-   Improved support for the xbuild based build engine
-   634308 - MonoDevelop crashes at custom command (Django)
-   640248 - Mono-2.8 p5 on openSUSE 11.3 i586: System.ObjectDisposedException on run

Text editor

-   651660 - Exception in parser service with unsaved file

Gtk# Designer

-   654372 - Display string[] property from gtk custom widget in property pad.

Debugger

-   644650 - monodevelop crash when debug c++ project with gdb
-   Fix expression evaluation bug
-   Fix visualizer display issue

iPhone

-   Support for zipping app bundles

Other

-   658794 - IDE crash during a copy/paste operation in the assembly content window
-   Fixed url for windows add-in repository
-   Improved schema-driven XML code completion

Getting MonoDevelop
-------------------

Packages for several distros and platforms, as well as source code tarballs and build instructions are available in the MonoDevelop [Download](/download) page.

This release of MonoDevelop needs at least **Mono 2.6.1** and **Gtk# 2.12.8** to run.
