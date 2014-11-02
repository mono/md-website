---
title: Autotools
redirect_from:
  - /Developers/Articles/Autotools/
  - /Autotools/
  - /Developers/Autotools/
---

The Autotools Addin can create a complete set of autotools scripts for a Solution. It provides the capabilities to configure and build as well as run 'make install', 'make uninstall', 'make clean', 'make dist', and 'make distcheck' commands. Currently this addin requires language bindings to connect to an extension point.

Implementing
------------

Language bindings which wish to enable Autotools for their language can follow the C# implementation. C# adds support via a module. Which makes it not dependent on the Autotools addin being present:

``` xml
<Module>
 <Runtime>
  <Import assembly="CSharpBinding.Autotools.dll"/>
 </Runtime>
 <Dependencies>
  <AddIn id="MonoDevelop.Autotools" version="0.1"/>
 </Dependencies>
 <Extension path = "/Autotools/SimpleSetups">
  <Class class="CSharpBinding.Autotools.CSharpAutotoolsSetup" />
 </Extension>
</Module>
```

The binding must connect to "/Autotools/SimpleSetups". This class must implement the ISimpleAutotoolsSetup interface. This provides some basic info like the compiler command, flags, and so forth. See the CSharpBinding for a sample.

TODOs
-----

-   Add a new extension point at IMakefileHandler which will allow much greater flexibility and customization.
-   Handle \*.addin.xml files
-   Handle sub projects / solutions that can be enabled / disabled ( --enable-java , etc... ). Note: configurations resolve a lot of this, but it would still be nice to permit optional modules.
-   include \*.config files for assemblies in installation

Ideas
-----

### Custom Templates

Allow the user to set the default templates (e.g configure.ac, Makefile.am, etc.) application-wide or perhaps even on a project level. This would require an option panel and minimal changes to AutotoolsContext.

### FreeDesktop \*.desktop entries for executables

Add functionality that will create a .desktop file[[1]](http://standards.freedesktop.org/desktop-entry-spec/latest/ "http://standards.freedesktop.org/desktop-entry-spec/latest/") for an executable assembly and install it into the correct place along with the corresponding icon.

This will add a link to the application in GNOME, KDE, and other freedesktop standard compliant application menus.

### FreeDesktop MIME types

Add the ability to set create new mime types and associate them to an executable. This would follow the freedesktop specs[[2]](http://www.freedesktop.org/wiki/Standards/shared-mime-info-spec "http://www.freedesktop.org/wiki/Standards/shared-mime-info-spec").

Basically MD would need to create an xml file and add a call to update-mime-database during "make install" and "make uninstall".

### Internationalization (i18n)

Handle language translation functionality.
