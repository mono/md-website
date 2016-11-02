---
title: Download
redirect_from:
  - /Download/
  - /Download/Windows_Preview/
  - /Download/Mac_MonoTouch/
  - /Download/Mac_Preview/
  - /MonoDevelopWin32/
  - /download/trunk_builds/
---

Download
========

The latest stable release is **{{ site.data.latestrelease.version }}**. See the [Release Notes](/documentation/release-notes/).

Source code is available on [GitHub](https://github.com/mono/monodevelop) or as a [Tarball](http://download.mono-project.com/sources/monodevelop/).

For Mac and Windows, you can download **Xamarin Studio** which is a bundle of MonoDevelop along with Xamarin iOS/Android plugins and branding. Note that a [Xamarin license](https://store.xamarin.com) is only required if you develop iOS/Android projects, all other project types are free without restrictions.

<hr/>

<h3 id="mac"><i class="fa fa-apple"></i> Mac OS X</h3>

To install this release, you also need to install the following packages:

- Mono + GTK#: [Download](http://www.mono-project.com/download/)

<a href="{{ site.data.latestrelease.monodevelop_mac_url }}" class="button radius"><i class="fa fa-download"></i> Download Xamarin Studio</a>

<hr/>

<h3 id="win"><i class="fa fa-windows"></i> Windows</h3>

To install this release, you also need to install the following packages:

- .NET Framework 4.5: [Download](http://go.microsoft.com/fwlink/p/?LinkId=397703)
- GTK# for .NET: [Download from mono-project.com](http://www.mono-project.com/download/#download-win)

<a href="{{ site.data.latestrelease.monodevelop_windows_url }}" class="button radius"><i class="fa fa-download"></i> Download Xamarin Studio</a>

<hr/>

<h3 id="lin"><i class="fa fa-linux"></i> Linux</h3>

#### FlatPak package

To install this release, you also need to install the following packages:

- FlatPak: [Download](http://flatpak.org/getting.html)

<a href="{{ site.data.latestrelease.monodevelop_linux_url }}" class="button radius"><i class="fa fa-download"></i> Download MonoDevelop</a>

For more instructions on installing the FlatPak package, see [here](/download/linux/).

#### Xamarin packages (Legacy)

MonoDevelop for Linux is available for various distributions. The following packages are built, tested and distributed by Xamarin. These packages are no longer updated beyond version 5.10.

- [Debian, Ubuntu, and derivatives](/download/linux/)
- [CentOS, Fedora and derivatives](/download/linux/)
- [openSUSE and SLES](/download/linux/)

#### Linux distribution packages

MonoDevelop is also packaged in various Linux distributions by third-party maintainers. Some of these packages do not ship the latest MonoDevelop version; this depends on the distribution/maintainer.

-   [Arch Linux](https://www.archlinux.org/packages/extra/i686/monodevelop/)
-   [CentOS EPEL](https://apps.fedoraproject.org/packages/monodevelop)
-   [Debian](https://packages.debian.org/monodevelop)
-   [Fedora](https://apps.fedoraproject.org/packages/monodevelop)
-   [Gentoo](https://packages.gentoo.org/package/dev-util/monodevelop)
-   [openSUSE](https://software.opensuse.org/package/monodevelop)
-   [Ubuntu](http://packages.ubuntu.com/monodevelop)

#### Community packages

These packages are provided by the community and linked here for your convenience. They are not tested by Xamarin, so use them at your own risk.

- [Latest SUSE monodevelop packages, part of the official "Factory" repository](http://software.opensuse.org/download/package?project=Mono:Factory&package=monodevelop) (contains the IDE, version control and unit test integration)
  - [monodevelop-database](http://software.opensuse.org/download/package?project=Mono:Factory&package=monodevelop-database) contains the database addins
  - [monodevelop-debugger-gdb](http://software.opensuse.org/download/package?project=Mono:Factory&package=monodevelop-debugger-gdb) adds support for the GNU Debugger
- [MonoDevelop installed to /opt for Debian and Ubuntu](http://software.opensuse.org/download/package?project=home:tpokorra:mono&amp;package=monodevelop-opt)
- [MonoDevelop installed to /opt for CentOS](https://copr.fedoraproject.org/coprs/tpokorra/mono-opt/)
- [Latest MonoDevelop for Fedora Rawhide and earlier Fedora versions](https://copr.fedoraproject.org/coprs/tpokorra/mono/)

<h4 id="ci-packages">Continuous Integration Packages</h4>

Packages for some distros are built regularly from source code snapshots. These are *CI builds* that have undergone little or no QA testing.

<a href="/download/ci-packages/"><i class="fa fa-book"></i> Learn more about CI packages</a>
