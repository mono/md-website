---
title: Reporting Bugs
redirect_from:
  - /Developers/Reporting_Bugs/
  - /Help_&_Contact/Bugs/
  - /Bugs/
---

Before reporting a bug follow the steps below:
1.  Ensure the bug you are reporting hasn't already been fixed. Install the latest version of MonoDevelop using the "Current Development" instructions on the download page.
2.  Review the [open MonoDevelop bugs](https://bugzilla.xamarin.com/describecomponents.cgi?product=Xamarin%20Studio) and make sure that your bug hasn't been submitted already.
3.  Review the issues at [MonoDevelop issues on GitHub](https://github.com/mono/monodevelop/issues)
4.  If it hasn't been submitted, submit a new MonoDevelop bug.

New MonoDevelop bugs should be filed at the [MonoDevelop repo on GitHub](https://github.com/mono/monodevelop/issues).
To report a bug, you need a GitHub account.

It's important to include the version number of MonoDevelop and the OS. If MonoDevelop was installed by any means other than the official packages (e.g. Unity's custom MonoDevelop builds, or built from source), please note this and include the Mono version information.

It is also very helpful to gather additional information that can be used to track down a bug, such as traces and logs. The following topics describe how to do this.

### Logs

MonoDevelop outputs logging information that can be useful in tracking down problems. Most log information can be viewed directly in MD using the *Message Log* pad, which can be accessed form *View-\>Pads-\>Message Log*.

The log output is also logged to files and/or the terminal, though the location of this information depends on the platform and on how MonoDevelop is run.

Logging can be controlled using several [environment variables](/developers/articles/environment-variables/#logging). For more information see the article on [logging](/developers/articles/logging/).

#### Linux Launch Script

The log is output to the file *~/.config/MonoDevelop/log*, and to the controlling terminal, if any.

#### Mac App Bundle

The log is output to the file *~/Library/Logs/XamarinStudio-{VERSION}/Ide.log*. This can easily be found in the Console.app log viewer, under the Files heading.

#### Makefiles

Using "make run" during development, the log is output only to the terminal.

### Debugging Hangs on Mac and Linux

If the MonoDevelop process hangs, it is very useful to determine exactly where this occurs. This can be doen by obtaining stack traces from all threads.

First, you must obtain the process ID of the MonoDevelop process:

`ps -A | grep monodevelop`

There should be a single result, assuming you have one MD instance, with the first number being the process ID. We will call this `$PID`.

#### Managed Hangs

If MD has hung in managed code, we can cause Mono to output stack traces for all threads to the terminal and the log. This is done by sending the QUIT signal to the process:

`kill -QUIT $PID`

Note that this does not actually "kill" MonoDevelop or cause it to "quit", but the process should be considered unusable after this, so can be force-quit with e.g.

`kill -9 $PID`

#### Native Hangs

If MonoDevelop has hung in native code, then a trace of the native code can be obtained with the GNU debugger, gdb. First attach gdb to the MD process:

`gdb attach $PID`

Then cause it to backtrace all threads:

`thread apply all bt`

This writes traces to the terminal running GDB, not to MonoDevelop's log, so remember to copy them manually.

### Stack Traces with Release Builds

Various messages in MonoDevelop error dialog and logs contain stack traces. These traces are much more useful with file and line numbers. If you are using MD running on Mono, i.e on Mac or Linux, then these traces will only have this information if Mono is running in debug mode.

The SVN trunk and preview releases of MD have launch scripts that run Mono in debug mode, but release builds do not, because in debug mode Mono uses more memory. To enable debug mode, set the environment variable

`MONO_OPTIONS="--debug"`
