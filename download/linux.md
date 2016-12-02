---
title: Install MonoDevelop on Linux
---

Install MonoDevelop preview via FlatPak
=======================================

[FlatPak](http://flatpak.org/) is a new packaging format for Linux, which allows the same applications to run in a sandboxed environment, across any modern distribution.

We are offering a preview release of MonoDevelop as a FlatPak bundle, which does not require Mono to be installed.

First, [install FlatPak for your distribution](http://flatpak.org/getting.html).

Next, you'll need a minimal FlatPak repository to provide our dependencies:

```bash
wget https://sdk.gnome.org/keys/gnome-sdk.gpg
flatpak remote-add --gpg-import=gnome-sdk.gpg gnome https://sdk.gnome.org/repo/
```

Finally, install MonoDevelop with:

```bash
flatpak install --user --from https://download.mono-project.com/repo/monodevelop.flatpakref
```

You can run newly installed MonoDevelop from shell using  `flatpak run com.xamarin.MonoDevelop`

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
