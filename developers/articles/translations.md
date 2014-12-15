---
title: Translations
redirect_from:
  - /Developers/Articles/Translations/
  - /Translations/
---

### Introduction

MonoDevelop has chosen to use `gettext` instead of resources for translating into other languages. This allows us to take advantage of GNOME translators' familiarity with `gettext`.

### Developers

Instead of using a string directly in your code, you just need to pass it to `gettext` which returns the translated string to you.

1.  Remember to encase all user-visible strings like so:
    -   `GettextCatalog.GetString ("user-visible string")`
    -   `GettextCatalog.GetString ("user-visible string {0}", variable)`

2.  Add files with these strings to `MonoDevelop/po/POTFILES.in`

### Translators

See [Gnome I18N](http://www.gnome.org/i18n/) for information about the GNOME translation project. Much of that material will also apply here. In particular:

-   [Language codes](http://lcweb.loc.gov/standards/iso639-2/englangn.html)
-   [Resources](http://developer.gnome.org/projects/gtp/resources.html)

### Credits, License, and Errata

Send comments to [jluke](mailto:jluke@cfl.rr.com) or the [MonoDevelop mailing list](mailto:monodevelop-list@lists.ximian.com)

Licensed under the [MIT License](http://opensource.org/licenses/mit-license.php)
