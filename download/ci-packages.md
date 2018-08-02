---
title: Continuous Integration packages
---

Continuous Integration packages
===============================

The Mono Project hosts a [public Jenkins instance](http://jenkins.mono-project.com/), which attempts to compile distribution packages for major GNU/Linux distributions for every commit made to the public MonoDevelop git repository on [GitHub](https://github.com/mono/monodevelop).

The first step is to add the CI repository to your system, please follow the guide for your distribution on the Mono website:

- [Debian, Ubuntu, and derivatives](https://www.mono-project.com/docs/getting-started/install/linux/ci-packages/#debian-ubuntu-and-derivatives)
- [CentOS, Fedora and derivatives](https://www.mono-project.com/docs/getting-started/install/linux/ci-packages/#centos-fedora-and-derivatives)
- [openSUSE and SLES](https://www.mono-project.com/docs/getting-started/install/linux/ci-packages/#opensuse-and-sles)

After you added the CI repository, search your package manager for **monodevelop-snapshot** to find a number of possible packages to install.

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

You can then configure your environment to use the desired version by calling **`. mono-snapshot APP/VER`** - for example, **`. mono-snapshot monodevelop/20140807112602`** (or simply **`. mono-snapshot monodevelop`**). Please note the leading "**`.`**":

Then simply launch `monodevelop` to start the selected build of the IDE.
