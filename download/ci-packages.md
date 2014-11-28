---
title: Continuous Integration packages
---

Continuous Integration packages
===============================

The Mono Project hosts a [public Jenkins instance](http://jenkins.mono-project.com/), which attempts to compile distribution packages for major GNU/Linux distributions for every commit made to the public MonoDevelop git repository on [GitHub](https://github.com/mono/monodevelop).

Requirements
------------

We are building our packages twice, in the most cross-release-compatible way we can manage.

For **Debian-derived** distributions (any distribution which uses .deb files), you need the **GNU C library 2.13** or above, and an **x86-64** or **x86** processor - this should cover Debian 7+, Ubuntu 11.04+, Mint 11+, Elementary 0.2+, and a huge number of other distributions.

For **Red Hat-derived** distributions (any distribution which uses .rpm files), you need the **GNU C library 2.17** or above, and an **x86-64** processor - this should cover CentOS 7+, Mageia 3+, Fedora 19+, openSUSE 12.3+, and a huge number of other distributions.

Installation
------------

Regardless of your distribution, you will need the Mono Project GPG signing key, which package managers require.

### Debian, Ubuntu, and derivatives

Add the Mono Project GPG signing key (if you don't use sudo, be sure to switch to root):

``` bash
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
```

Next, add the package repository (if you don't use sudo, be sure to switch to root):

``` bash
echo "deb http://jenkins.mono-project.com/repo/debian sid main" | sudo tee /etc/apt/sources.list.d/mono-jenkins.list
```

Update your package cache if necessary (i.e. run `apt-get update`).

### CentOS, Fedora, and derivatives

Add the Mono Project GPG signing key **in a root shell** with:

``` bash
rpm --import "https://pgp.mit.edu/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
```

Next, add the package repository **in a root shell**:

``` bash
yum-config-manager --add-repo http://jenkins.mono-project.com/repo/centos/
```

Update your package cache if necessary.

Usage
-----

Search your package manager for **monodevelop-snapshot** to find a number of possible packages to install.

Install the **monodevelop-snapshot-XXXXXXXXX** package for a specific version, or **monodevelop-snapshot-latest** to install whatever the latest available version is. With **monodevelop-snapshot-latest**, your package manager will keep updating you to the latest available version whenever it runs.

Whenever you install any snapshot package, the **`mono-snapshot`** utility will be installed alongside it. Run **`mono-snapshot`** to see which snapshot packages are available and installed:

``` bash
[directhex@centossy ~]$ mono-snapshot
This script will help you to set up your environment to use a
snapshot package of Mono. To use it, run:

    . mono-snapshot APP/VER

You have the following possible combinations of APP/VER:

    monodevelop/20140807112602
    monodevelop/20140807155904

Calling APP without specifying VER will load the latest version
```

You can then configure your environment to use the desired version by calling **`. mono-snapshot APP/VER`** - for example, **`. mono-snapshot monodevelop/20140807112602`** (or simply **`. mono-snapshot monodevelop`**). Please note the leading "**`. `**":

Then simply launch `monodevelop` to start the selected build of the IDE.
