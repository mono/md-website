---
title: Development - Getting Started
redirect_from:
  - /Developers/Articles/Development%3A_Getting_Started/
  - /Development%3A_Getting_Started/
  - /Developers/Development%3A_Getting_Started/
---

It's relatively easy to get started working on MonoDevelop, but this page aims to make it easier to get off the ground.

If you're on OS X you can also try @dvdsgl's one step install: [https://github.com/dvdsgl/monodevelop-build](https://github.com/dvdsgl/monodevelop-build)

### Setting up an Environment

MonoDevelop doesn't require the very latest version of Mono, and we specifically depend on GTK+ features no later that GTK+ 2.8. That said, using a recent release of Mono and Gtk# is likely to improve reliability and performance.

**It is strongly recommended to use a packaged release of Mono** for your distribution, as it is very easy to mix up conflicting Mono versions if installing from source. If you must install Mono from source, set up a [Parallel Mono Environment](http://www.mono-project.com/Parallel_Mono_Environments).

Make sure you have git installed, and check MonoDevelop out from [GitHub](https://github.com/mono/monodevelop).

### Building and Installing

Open a terminal in the top-level MonoDevelop directory, and run

``` bash
./configure --profile=core
```

It may fail because of missing dependencies; install them, and re-run the command.

There are a number of other profiles that can be used; the command

``` bash
./configure --help
```

explains how they are used.

Next, use

``` bash
make
```

to build MonoDevelop.

Since you're working on the development version, it's best **not** to install it; instead, you can use

``` bash
make run
```

to run it without installing it.

It is a good idea to keep separate copies for using and developing.

If you do install MonoDevelop, it is best to run the current version uninstalled, to make sure it works, before installing it.

### Working on MonoDevelop

Before hacking on MonoDevelop, don't be afraid to ask questions on [\#monodevelop IRC](http://mono-project.com/IRC) or [MonoDevelop mailing list](http://lists.ximian.com/mailman/listinfo/monodevelop-list). People will be able to give you pointer about where to start and how best to approach the problems you are trying to solve. There are also number of [Articles](/developers/articles/) on the MonoDevelop architecture and on implementing addins.

The MonoDevelop solution can be opened from MonoDevelop, and builds can be preformed from within MonoDevelop. Indeed, some parts of the build (such as Stetic code generation) must be performed within MD. However, the modified MonoDevelop must be run from a terminal with

``` bash
make run
```

You should follow our [contribution rules](/developers/#contribute), for code style and licensing.

After you have made your changes, commit them with a descriptive message and open a pull request on GitHub.

### Troubleshooting the Build

If the MonoDevelop build fails, there are a number of possible fixes.

If the build commands failed, try a clean rebuild:

``` bash
make clean; make
```

and fix any that are in conflict, or delete any that have changed unnecessarily.

If the build *system* failed, check for changed files and re-run the configure script.
