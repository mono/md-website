---
title: Install MonoDevelop on Linux
---

Install MonoDevelop on Linux
============================

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
