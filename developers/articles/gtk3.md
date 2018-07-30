---
title: MonoDevelop GTK+3 Port
redirect_from:
  - /gtk3/
---

Introduction
------------

MonoDevelop is developed using the GTK+2 windowing toolkit, with some per-platform overrides to render features with OS-native components instead, for a more "native" look and feel.

We have a community project to port MonoDevelop to use GTK+3, the current stable version of GTK+. This will bring performance improvements across all platforms, and significant improvements to the experience on Linux (and Linux derivatives like Chrome OS)

Getting started
---------------

Obtain the latest in-progress work. Right now, this is in `https://github.com/directhex/monodevelop.git`, `hackweek2` branch.

You will need GTK Sharp, and its dependencies, for your platform. Current development work is targeting GTK Sharp 2.99.3.

On Linux, your distribution likely already has this packaged.

On OSX, you will require Brew (https://brew.sh). Download [this Brew formula](https://gist.githubusercontent.com/directhex/2570115252ee4f14773b28b2b36f6d23/raw/71a04c99f18dfcc86638f72d3e1dbf38d61be610/gtk-sharp3.rb), and install it with `brew install ./gtk-sharp3.rb`. You should also install several MonoDevelop dependencies, with `brew install cmake gettext intltool libssh2`. Finally, you'll need to configure MonoDevelop to find all the disparate tools it needs, and to use the GNOME backend (work on porting the Mac backend) has not started yet: `PKG_CONFIG_PATH=/Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/:/usr/local/lib/pkgconfig/:/usr/local/Cellar/openssl/1.0.2o_2/lib/pkgconfig/ PATH=$PATH:/usr/local/Cellar/gettext/0.19.8.1/bin/ ./autogen.sh --enable-gnomeplatform --disable-macplatform`

Building
--------

Run `make`! It is not expected for the whole build to finish, yet (completing work on every single addin is a work in progress).

Running
-------

Use `make run`. This should work well enough to draw the MonoDevelop welcome screen.

<img src="/developers/articles/gtk3-images/gtk3-linux-wip.jpg" width="700" alt="Current progress on MonoDevelop GTK+3, on Linux"/>
