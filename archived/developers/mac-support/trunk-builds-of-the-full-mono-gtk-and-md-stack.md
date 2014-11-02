---
title: Trunk Builds of the Full Mono, GTK and MD Stack
redirect_from:
  - /Developers/Mac_Support/Trunk_Builds_of_the_Full_Mono,_GTK_and_MD_Stack/
  - /Developers/Mac_Support/Mac_Trunk_Builds/
  - /Developers/Mac_Support/Trunk_Builds_of_the_Full_Mono//GTK//MD_Stack/
---

<span style="color: rgb(255, 0, 0);">**NOTE: THESE INSTRUCTIONS ARE DEPRECATED**</span><span style="color: rgb(255, 0, 0);">**.**</span>

Recently, we've been trying to make the experience for users of MonoDevelop on OS X just a bit better. Things were in a pretty sorry shape in terms of comfortableness. This is still an ongoing effort, but hopefully the automated build process we've put together below will make it just a bit easier for users to try the cutting edge which includes many features and fixes for OS X.  Namely, better gtk+ support and a working debugger.

Instead of rewriting an entire build daemon we have opted to re-use jhbuild.  It seems to work pretty well on OS X already which is a plus.  Since many will not be familiar with the setup of jhbuild and how to add modulesets there is a short script to do so. This should get everything you need to enable trunk builds of mono, mono-debugger, monodevelop, and Christian's gtk+ branch with various OS X patches applied. It is also rebased on gtk+ master fairly requently.

Regrettably, webkit-gtk does not currently build on our current OS X installations.  There were a couple small fixes required where the macros for checking the platform weren't used correctly.  But even after fixing those, the build system was trying to create a 1.6 Gb static library. Naturally, the mmap() output file consumed the rest of the memory in the user-split of the 32bit address space and caused the vm allocator to throw-up.

Everything installed by jhbuild will be within its own prefix, so you need not worry about it effecting the rest of your system.

First off, you will need the **Git** version control system to check out code.  If you do not yet have this then you can get it from <http://code.google.com/p/git-osx-installer/downloads/list?can=3>.

Alternatively, here is a direct link <http://git-osx-installer.googlecode.com/files/git-1.6.4-intel-leopard.dmg>.

For those wanting the very succinct installation instructions, those are directly below. If you want the “why” then go down a few lines where comments are provided inline.

`curl -o setup.py http://git.dronelabs.com/mono-osx-fi...ono_jhbuild.py `

<span style="font-family: Courier New;">`chmod +x setup.py`</span>

<span style="font-family: Courier New;">`./setup.py –prefix=/Users/chergert/mono`</span>

<span style="font-family: Courier New;">`~/.local/bin/jhbuild build monodevelop`</span>

<span style="font-family: Courier New;">`~/.local/bin/jhbuild shell`</span>

`monodevelop`

Now for those of you wanting the “why”, let me step you through the process quick by example. Fire up Terminal.app from /Applications/Utilities.

`# grab my python script to set everything up`

`curl -o setup.py http://git.dronelabs.com/mono-osx-fi...ono_jhbuild.py `

`# make the script executable`

`chmod +x setup.py `

`# execute the script with our desired installation prefix`

`# after running this you will see a bunch of output related`

`# to bootstrapping your system's build environment`

`./setup.py –prefix=/Users/chergert/mono`

`…`

`# after the above has completed successfully, you'll see a a short`

`# overview of how to use it. We'll reiterate that right here for`

`# completeness`

`# !!!`

`# You will need to start a new terminal instance at this point`

`# since shell paths were modified`

`# !!!`

`# lets build glib, mono, gtk+, mono-debugger, gtk-sharp, mono-addins`

`# monodevelop and a few other necessities`

`jhbuild build monodevelop`

`…`

`# after some time has passed, you should have an up to date system`

`# as long as mono trunk is not broken. The reason we depend on`

`# trunk right now is for the OS X debugger`

`# Let's run monodevelop!`

`jhbuild shell`

`monodevelop`

`# That's it!`

If you have any problems with the script, email Christian directly at "chris at dronelabs dot com" or vwduder in IRC.  If you have any bugs with gtk+, email Christian directly with a short example and screenshot if you can (Command Shift 3) and I'll file the bug and hopefully fix it for you.

