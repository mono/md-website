---
title: Install MonoDevelop on Linux
---

Install MonoDevelop on Linux
============================

Regardless of your distribution, you will need the Mono Project GPG signing key, which package managers require.

Debian, Ubuntu, and derivatives
-------------------------------

Add the Mono Project GPG signing key **in a root shell** with:

``` bash
apt-key adv --keyserver pgp.mit.edu --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
```

Next, add the package repository **in a root shell**:

``` bash
echo "deb http://download.mono-project.com/repo/debian wheezy main" > /etc/apt/sources.list.d/mono-xamarin.list
```

Update your package cache if necessary (i.e. run `apt-get update`), and run a package upgrade to upgrade existing packages to the latest available. Then install MonoDevelop as described in the [usage](#usage) section.

Note: While the APT package is built against Debian Wheezy, it is compatible with a number of Debian derivatives (including Ubuntu) which means you can use the same repository across all these distributions.

CentOS, Fedora, and derivatives
-------------------------------

Add the Mono Project GPG signing key **in a root shell** with:

``` bash
rpm --import "https://pgp.mit.edu/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
```

Next, add the package repository **in a root shell**:

``` bash
yum-config-manager --add-repo http://download.mono-project.com/repo/centos/
```

Update your package cache if necessary, and run a package upgrade to upgrade existing packages to the latest available.

Users of CentOS or RHEL (or similar distributions) may need to add the [EPEL repository](https://fedoraproject.org/wiki/EPEL) to their system to satisfy all dependencies

Usage
-----

The package ***monodevelop*** should be installed to get the main MonoDevelop application.

Install ***monodevelop-nunit*** to get the MonoDevelop NUnit addin, so you can run unit tests inside the IDE.<br/>
Install ***monodevelop-versioncontrol*** to add Git and SVN integration to the IDE.<br/>
Install ***monodevelop-database*** to add the database addin to the IDE.

openSUSE
--------

[MonoDevelop](http://software.opensuse.org/package/monodevelop) is part of the official distribution. The latest stable version released as tarballs is also available from the [openSUSE build service](http://software.opensuse.org/download.html?project=Mono%3AFactory&package=monodevelop) development repository via One-Click-Install.

The package ***monodevelop*** contains the IDE including version control and unit test integration. ***monodevelop-database*** contains the database addins and ***monodevelop-debugger-gdb*** adds support for the GNU Debugger.
