---
title: FAQ
redirect_from:
  - /FAQ/
  - /faq/
  - /Troubleshooting/
---

General Questions
-----------------

### What is MonoDevelop?

MonoDevelop is a free GNOME IDE primarily designed for C# and other .NET languages, although open to any kind of language. However, MonoDevelop hopes to be more than just an IDE: it intends to be an extensible platform upon which any kind of development tool can be built.

MonoDevelop was originally a port of the [SharpDevelop IDE](http://www.icsharpcode.net/OpenSource/SD/) to Gtk#, but it has evolved a lot since the initial port.

There are numerous goals that MonoDevelop hopes to achieve. Some of these are:

-   To create a best of breed development environment for Unix systems for Mono.
-   Since it's written in Gtk#, and we like Gtk# and we get good support from Gtk#, most likely it will add functionality to improve the Gtk# experience.
-   We integrate the tools we have been building so far, so things like MonoDoc, NUnit-Gtk and the debugger target MonoDevelop.

### Under which license is MonoDevelop available?

The MonoDevelop Core is licensed under the [LGPLv2](http://www.gnu.org/licenses/lgpl-2.1.html), though much of the code and add-ins are licensed under the MIT/X11 license. All the source code is available through the Github file repository. Read the [Download](/download/) page for directions on downloading the source.

### Why another IDE for GNOME?

A unique platform like Mono deserves a unique IDE like MonoDevelop that can take full advantage of the framework capabilities. Features like code completion, integrated unit testing, class browser, etc. would be much more difficult to implement for example in a C based IDE.

The Mono platform also provides some features that are ideal for the development of an IDE. Thanks to Mono, MonoDevelop offers:

-   a fully object oriented API
-   a very powerful add-in engine (based on the reflection capabilities of the framework, and which takes advantage of the portability of .NET assemblies)
-   easy support for multiple languages, both for user projects and for writing add-ins.

Moreover, Gtk# rocks.

### Does MonoDevelop have an integrated GUI designer?

MonoDevelop 0.10 and later has an integrated GUI designer based on [Stetic](http://mysterion.org/~danw/blog/2005/03/stetic).

### Does MonoDevelop work on Windows?

Yes. MonoDevelop can be run on Windows, and can build, run and debug apps with either Mono or .NET. A Windows installer for MonoDevelop is available in the [Download](/download/) page.

### Does MonoDevelop work on Mac OSX?

Yes, it is available on the [Download](/download/) page.

### Can I compile my project with gmcs?

Yes. Right click on your project, select 'Options'-\>'Runtime' and select '2.0' from the drop-down list.

### An Add-in is causing MonoDevelop to crash at startup, how do I remove it?

The Add-in Manager can be launched independently with the command 'mdtool gsetup'

### Can I import my Visual Studio 2K5+ project into MonoDevelop?

MonoDevelop can open, manipulate and save MSBuild-based projects directly in most cases. In fact, since MonoDevelop 2.0 the default project format has been VS2008-style MSBuild projects, but VS2005 and VS2010 formats are also handled.

### I added an assembly to the GAC, why doesn't it appear in the assemblies list when I try to add a reference in a MonoDevelop project?

Because MonoDevelop does not look for assemblies in the GAC. On Mac and Linux, MonoDevelop uses pkg-config to locate installed packages and get the list of assemblies that each package provides. A package specifies this list of assemblies in a .pc file which has to be installed in the standard pkg-config directory.

If you are developing a library, MonoDevelop can automatically generate a .pc file for your project (in the project options dialog, select "Linux Deployment Settings", and check the "Generate .pc file" option).

When targeting .NET on Windows, MonoDevelop uses the same AssemblyFolders mechanism that VS uses.

### Is there a Visual Designer for ASP.NET?

For all practical purposes, **no**.

There was an experimental ASP.NET Visual Designer called AspNetEdit built in the Google Summer of Code 2005, and integrated into MonoDevelop in 2006. It is present in MonoDevelop SVN, and interested parties are welcome to build it and experiment with it, but it is **completely unsupported**.

Although AspNetEdit can be used for simple demonstrations, it never reached a releasable state where it could be used for real projects, mainly because of Mozilla Composer's **extremely poor handling of modern HTML**. There were also many difficulties with embedding Mozilla/Gecko/Firefox, which made it very difficult to install the add-in successfully. As a result of this, a decision was made to [port AspNetEdit to the WebKit engine](/archived/developers/tasks/web-development/webkit-port-of-aspnetedit/#reasons-for-the-redesign). However, since completing this effort would be a massive undertaking, it has currently been put **on hold** in favour of features that will be more immediately useful to users.

If you are interested in contributing to the designer, please email the [mailing list](/help/) or find Michael Hutchinson ('mhutch') on IRC.

Troubleshooting
---------------

### MonoDevelop installed with installer not working

The binary Linux installer is not supported anymore. Please install MonoDevelop using your distro's packages.

### MonoDevelop fails to start with the error message: Unix transport error

This is due to a bad interaction between Mono 1.1.13 and Boo.

To fix this problem, you have three options:

-   Upgrade Boo to 0.7.5, or
-   Uninstall the boo add-in, by running "mdtool gsetup", or
-   Upgrade Mono to 1.1.14 or upper

This is the stack trace:

```text
System.Runtime.Remoting.RemotingException: Unix transport error.
Server stack trace:
   in Mono.Remoting.Channels.Unix.UnixMessageIO:ReceiveMessageStatus (System.IO.Stream networkStream, System.Byte[] buffer)
   in Mono.Remoting.Channels.Unix.UnixClientTransportSink:ProcessMessage (IMessage msg, ITransportHeaders requestHeaders, System.IO.Stream requestStream, ITransportHeaders responseHeaders, System.IO.Stream  responseStream)
   in Mono.Remoting.Channels.Unix.UnixBinaryClientFormatterSink:SyncProcessMessage (IMessage msg)
   Exception rethrown at:
   ---> System.Runtime.Remoting.RemotingException: Connection closed
   in Mono.Remoting.Channels.Unix.UnixMessageIO:StreamRead (System.IO.Stream networkStream, System.Byte[] buffer, Int32 count)
   in Mono.Remoting.Channels.Unix.UnixMessageIO:ReceiveMessageStatus (System.IO.Stream networkStream, System.Byte[] buffer)
   --- End of inner exception stack trace ---
   in Mono.Remoting.Channels.Unix.UnixMessageIO:ReceiveMessageStatus (System.IO.Stream networkStream, System.Byte[] buffer)
   in Mono.Remoting.Channels.Unix.UnixClientTransportSink:ProcessMessage (IMessage msg, ITransportHeaders requestHeaders, System.IO.Stream requestStream, ITransportHeaders responseHeaders, System.IO.Stream responseStream)
   in Mono.Remoting.Channels.Unix.UnixBinaryClientFormatterSink:SyncProcessMessage (IMessage msg)
```

### Copy/Paste is not working in the GUI Designer

If you can't copy/paste (and cut only deletes) any designer objects, then you might have the GNOME applet "glipper" running. You can check that using:

    ps | grep glipper

If that outputs something, then glipper is active and should be disabled.

### Enabling the NUnit Add-in

The NUnit add-in requires mono 1.1.9+. This is do to some cross-appdomain bug fixes. Debian users currently also have another particular problem in that NUnit packages are separated from Mono, and do not include the proper pkg-config files.

Configure monodevelop with the following command.

    ./configure --enable-nunit

**Debian users only**

Install the *nunit* and *libnunit-cil* packages (requires unstable at this moment). Due to the separate packaging of nunit, we need to make a symlink so that monodevelop knows where to find the pkg-config file.

    ln -s /usr/lib/pkgconfig/nunit.pc /usr/lib/pkgconfig/mono-nunit.pc 
