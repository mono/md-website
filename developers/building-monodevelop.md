---
title: Building MonoDevelop
redirect_from:
  - /Developers/Building_MonoDevelop/
  - /Developers/Mac_Support/Building_MonoDevelop_on_OS_X/
  - /Developers/Articles/Building_MonoDevelop_on_OS_X/
  - /Developers/Mac_Support/Building_on_OS_X/
  - /Developers/Articles/Building_MonoDevelop_on_Ubuntu/
  - /developers/building_monodevelop/
---

Linux
-----

### Installing dependencies

MonoDevelop requires the following packages (or newer versions):

-   Mono 3.0.4
-   Mono.Addins 0.6
-   Gtk# 2.12.10
-   monodoc 1.0
-   cmake
-   libssh2

You can build them from [git](http://github.com/mono/monodevelop), [source releases](http://download.mono-project.com/sources/) or, even easier, simply install the [pre-built packages](http://www.go-mono.com/mono-downloads/download.html) appropriate for your platform.

**We strongly recommend you install everything from packages if possible.** If not, you should use a [Parallel Mono Environment](http://www.mono-project.com/Parallel_Mono_Environments). Do not install anything to /usr or /usr/local unless you completely understand the implications of doing so.

Note that if your distro has sufficiently up-to-date Gtk# or Mono.Addins packages, you can configure a parallel Mono environment to use them instead of building them from source. See the section on MONO\_GAC\_PREFIX in the Parallel Mono Environment guide.

### Building from Git

After getting the source code from [GitHub](http://github.com/mono/monodevelop), run the following code in the root directory:

    ./configure

It may fail because of missing dependencies; install them, and re-run the command.

This script allows selecting and configuring a set of MonoDevelop modules to be included in an integrated build. The MonoDevelop build system consists of a 'main' module, which contains the main distribution, and a number of additional add-ins in subdirectories of 'extras'.<br/>
 The 'extras' add-ins are designed to be built and distributed separately, and therefore build against your system-installed MonoDevelop by default. However, this script sets them up to build against the MonoDevelop in 'main', and ensures that they will be loaded when MonoDevelop is launched with 'make run' in this top-level directory. This is very useful for development and testing.

You can select the list of extra add-ins to be built by running this command:

    ./configure --select

Further executions of the *configure* script will configure only the selected add-ins.<br/>
 You can also configure a predefined list of modules by specifying a build profile using the --profile option. Use the --help option to get information about available profiles and other build options.

#### Linux: Running

Since you'll be working on the development version, it's best **not** to install it; instead, you can use

``` bash
make run
```

to run it without installing it. It is a good idea to keep separate copies for using and developing.

### Building from Tarballs

MonoDevelop is split in several tarballs: one for the main application, and one for each optional add-in. You can get the tarballs from the [Download](/download/) page.

First of all you have to configure and install the main tarball:

    ./configure
    ./make
    ./make install

The configure script may fail because of missing dependencies; install them, and re-run the command.

After this, you can build and install any of the additional tarballs using the same procedure.

Mac OSX
-------

Building MonoDevelop from source on the Mac is straightforward when the latest **Mono SDK** package is installed. In general, the instructions in [Development:Getting Started](/developers/articles/development-getting-started/) can be applied directly to building MD on OS X. However, there are a few caveats, so this page explains the Mac build process in more detail.

### Building using Makefiles

#### Building

First you will need Xcode installed. If you have Xcode 4.3 or later, you will need to then install the Xcode Commandline tool from Xcode preferences, and install `autoconf` and `automake` from [brew](http://mxcl.github.com/homebrew/).

Before running the `configure` script, tell aclocal where to find the pkgconfig M4 macro (pkg.m4), e.g.

    export ACLOCAL_FLAGS="-I /Library/Frameworks/Mono.framework/Versions/Current/share/aclocal"

and ensure that the Mono framework comes first in your PATH so you do not end up accidentally using conflicting versions of utilities from packages such as MacPorts:

    export PATH="/Library/Frameworks/Mono.framework/Versions/Current/bin:$PATH"

You will also need to add the GTK+ libraries' location to the Mac dynamic loader path:

    export DYLD_FALLBACK_LIBRARY_PATH=/Library/Frameworks/Mono.framework/Versions/Current/lib:/lib:/usr/lib

**NOTE: Please ensure that you have the very latest Mono MDK.**

Check out MD, configure using the Mac profile:

    git clone git://github.com/mono/monodevelop.git
    pushd monodevelop
    ./configure --profile=mac
    make
    make run

**NOTE:** DO NOT use *configure --select* on Mac - the Mac profile passes adds required arguments to the configuration of *main*.  Instead edit *profiles/mac* manually to add any additional modules.

**IMPORTANT**: Do not install MonoDevelop into the install prefix. MonoDevelop will pick up libraries from the prefix automatically. If you configured with a non-default prefix, then when you build an app bundle, the **entire prefix** will be merged into the app bundle.

#### Building extras

To include additional addins from extras in the build, instead of using the Mac profile, use `configure --select` to select addins. This will *write* the default profile. Next, replace the line in profiles/default that begins with "main"  with the one from profiles/mac, then run configure again using the default profile.

#### Mac: Running

To run MD, simply use<span style="font-size: 11px;">:</span>

    make run

#### Building the App package

To build the app package, navigate to the OS X build directory:

    cd main/build/MacOSX

From here, build the MonoDevelop.app or a zipped version using `make MonoDevelop.app` or `make MonoDevelop.app.zip` respectively. You can then build the .dmg using the `./make-dmg-bundle.sh` script. To include addins from extras, manually copy their build directories into the MonoDevelop.app directory, e.g.

    cp -r ../../../extras/MonoDevelop.AspNet.Mvc/build/* MonoDevelop.app/Contents/MacOS/lib/monodevelop/AddIns/MonoDevelop.AspNet.Mvc/

### Building using MonoDevelop

When building MonoDevelop using MonoDevelop, be sure to select the Mac configuration, as this will enable building only the addins that work on Mac.

#### Main

Building main is straightforward. Open main/Main.sln, select the mac configuration, and run the Build command. Note that *running* MonoDevelop from within MD will currently only work if you export `DYLD_FALLBACK_LIBRARY_PATH` as described above.``

#### Extras

Loading the full MonoDevelop.mdw workspace and building the addin solutions from extras will only work if the Makefiles' configure script has been run. Even then, not all of them will build correctly. Until this is resolved, use the makefiles to build extras.

### TL;DR - Getting a MD Master App Bundle

Install the latest Mono MDK (2.10.6 at the time of writing) and git. Then run the following commands

    export PATH="/Library/Frameworks/Mono.framework/Versions/Current/bin:$PATH"
    export ACLOCAL_FLAGS="-I /Library/Frameworks/Mono.framework/Versions/Current/share/aclocal"
    export DYLD_FALLBACK_LIBRARY_PATH=/Library/Frameworks/Mono.framework/Versions/Current/lib:/lib:/usr/lib
    git clone git://github.com/mono/monodevelop.git
    cd monodevelop
    ./configure --profile=mac
    make
    cd main/build/MacOSX && make MonoDevelop.app && open MonoDevelop.app

To update, run the following commands in the `monodevelop` directory:

    git pull
    make
    cd main/build/MacOSX && make MonoDevelop.app && open MonoDevelop.app

Windows
-------

### Prerequisites and Source

-   Install Gtk# ([installer](http://download.xamarin.com/GTKforWindows/Windows/gtk-sharp-2.12.22.msi)).
-   Install the Mono libraries package ([installer](https://files.xamarin.com/~jeremie/MonoLibraries.msi))
-   Install the Microsoft Build Tools 2013 ([installer](http://www.microsoft.com/en-us/download/details.aspx?id=40760)).
-   Install the Microsoft Build Tools 2015 ([installer](https://www.microsoft.com/en-us/download/details.aspx?id=48159)).
-   Install MSysGit (from [here](http://code.google.com/p/msysgit/))
-   Install GNU Gettext tools (from [here](http://gnuwin32.sourceforge.net/packages/gettext.htm))
-   Install Visual F# Tools 4.0 (from [here](https://www.microsoft.com/en-us/download/details.aspx?id=48179))
-   Get MonoDevelop from [GitHub](http://github.com/mono/monodevelop).

### Building using Visual Studio or MonoDevelop

You need at least Visual Studio 2015 or MonoDevelop 5.10.1(build 6)  

-   Open main/Main.sln.
-   Select the **DebugWin32 **configuration.
-   Build the solution.

### Building using MSBuild

Open a terminal in main and run winbuild.bat (or winbuild.sh from MSysGit bash). You can easily run MD directly after building with the winrun.bat/sh script.
