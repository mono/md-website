---
title: Download
latest_monodevelop: 5.7.0
latest_monodevelop_mac: http://download.xamarin.com/studio/Mac/XamarinStudio-5.7.0.660-0.dmg
latest_monodevelop_win: http://download.xamarin.com/studio/Windows/XamarinStudio-5.7.0.660-0.msi
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

The latest stable release is **{{ page.latest_monodevelop }}**. See the [Release Notes](/documentation/release-notes/).

Source code is available on [GitHub](https://github.com/mono/monodevelop) or as a [Tarball](http://download.mono-project.com/sources/monodevelop/).

For Mac and Windows, you can download **Xamarin Studio** which is a bundle of MonoDevelop along with Xamarin iOS/Android plugins and branding. Note that a [Xamarin license](https://store.xamarin.com) is only required if you develop iOS/Android projects, all other project types are free without restrictions.

<hr/>

<h3 id="mac"><i class="fa fa-apple"></i> Mac OS X</h3>

To install this release, you also need to install the following packages:

- Mono + GTK#: [Download](http://www.mono-project.com/download/)

<a href="{{ page.latest_monodevelop_mac }}" class="button radius"><i class="fa fa-download"></i> Download Xamarin Studio</a>

<hr/>

<h3 id="win"><i class="fa fa-windows"></i> Windows</h3>

To install this release, you also need to install the following packages:

- .NET Framework 4.5: [Download](http://go.microsoft.com/fwlink/p/?LinkId=397703)
- GTK# for .NET 2.12.25: [Download](http://download.xamarin.com/GTKforWindows/Windows/gtk-sharp-2.12.25.msi)

<a href="{{ page.latest_monodevelop_win }}" class="button radius"><i class="fa fa-download"></i> Download Xamarin Studio</a>

<hr/>

<h3 id="lin"><i class="fa fa-linux"></i> Linux</h3>

#### Xamarin packages

MonoDevelop for Linux is available for various distributions. The following packages are built, tested and distributed by Xamarin. Use these if you want to use a stable, official and up-to-date version of MonoDevelop.

- [Debian, Ubuntu, and derivatives](/download/linux/)
- [CentOS, Fedora and derivatives](/download/linux/)
- [openSUSE and SLES](/download/linux/)

#### Linux distribution packages

MonoDevelop is also packaged in various Linux distributions by third-party maintainers. Some of these packages do not ship the latest MonoDevelop version; this depends on the distribution/maintainer.

-   [Arch Linux](https://www.archlinux.org/packages/extra/i686/monodevelop/)
-   CentOS
-   [Debian](https://packages.debian.org/monodevelop)
-   [Gentoo](https://packages.gentoo.org/package/dev-util/monodevelop)
-   [openSUSE](https://software.opensuse.org/package/monodevelop)
-   [Ubuntu](http://packages.ubuntu.com/monodevelop)

#### Community packages

These packages are provided by the community and linked here for your convenience. They are not tested by Xamarin, so use them at your own risk.

- [Latest SUSE monodevelop packages, part of the official "Factory" repository](http://software.opensuse.org/download/package?project=Mono:Factory&package=monodevelop) (contains the IDE, version control and unit test integration)
  - [monodevelop-database](http://software.opensuse.org/download/package?project=Mono:Factory&package=monodevelop-database) contains the database addins
  - [monodevelop-debugger-gdb](http://software.opensuse.org/download/package?project=Mono:Factory&package=monodevelop-debugger-gdb) adds support for the GNU Debugger

<h4 id="ci-packages">Continuous Integration Packages</h4>

Packages for some distros are built regularly from source code snapshots. These are *CI builds* that have undergone little or no QA testing.

<a href="/download/ci-packages/"><i class="fa fa-book"></i> Learn more about CI packages</a>
