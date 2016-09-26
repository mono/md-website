---
title: Install MonoDevelop on Linux
---

Install MonoDevelop preview via FlatPak
=======================================

[FlatPak](http://flatpak.org/) is a new packaging format for Linux, which allows the same applications to run in a sandboxed environment, across any modern distribution.

We are offering a preview release of MonoDevelop as a FlatPak bundle, which does not require Mono to be installed.

[Download the preview here]({{ site.data.latestrelease.monodevelop_linux_url }}).

First, [install FlatPak for your distribution](http://flatpak.org/getting.html).

Next, you'll need some FlatPak repositories:

```bash
wget https://sdk.gnome.org/keys/gnome-sdk.gpg
flatpak remote-add --gpg-import=gnome-sdk.gpg gnome https://sdk.gnome.org/repo/
```

Finally, you need the core FreeDesktop runtime, to install MonoDevelop:

```bash
flatpak install gnome org.freedesktop.Platform 1.4
```

You can now install our FlatPak bundle, using `flatpak install --user --bundle {{ site.data.latestrelease.monodevelop_linux_url | split: '/' | last }}`

Install MonoDevelop packages on Linux (deprecated)
==================================================

The first step is to install Mono on your system, please follow the guide for your distribution on the Mono website:

- [Debian, Ubuntu, and derivatives](http://www.mono-project.com/docs/getting-started/install/linux/#debian-ubuntu-and-derivatives)
- [CentOS, Fedora and derivatives](http://www.mono-project.com/docs/getting-started/install/linux/#centos-7-fedora-19-and-derivatives)
- [openSUSE and SLES](http://www.mono-project.com/docs/getting-started/install/linux/#opensuse-and-sles)

After you installed Mono and added the package repository, install the ***monodevelop*** package to get the main MonoDevelop application.

Install ***monodevelop-nunit*** to get the MonoDevelop NUnit addin, so you can run unit tests inside the IDE.<br/>
Install ***monodevelop-versioncontrol*** to add Git and SVN integration to the IDE.<br/>
Install ***monodevelop-database*** to add the database addin to the IDE.

*Note:* the separate addin packages only apply to Debian, Ubuntu, and derivates. On CentOS, Fedora, and derivates they are part of the MonoDevelop package.

openSUSE and SLES users can install using SUSE One-Click:

[![monodevelop](/images/OneClick.svg)](http://download.mono-project.com/repo/monodevelop.ymp)
