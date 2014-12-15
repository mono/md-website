---
title: Mac Support
redirect_from:
  - /Developers/Mac_Support/
---

### Building MonoDevelop

<span style="color:#ff0000;">NOTE: THIS IS NOT UP TO DATE, MANY OF THE BUGS LISTED HERE HAVE BEEN FIXED IN MONODEVELOP 3.x and 4.0 (aka XAMARIN STUDIO)</span>

Detailed instructions for building MonoDevelop on OS X can be found in the following articles:

[Building MonoDevelop](/developers/building-monodevelop/)

However, most users should use the binaries from the main download page.

### Known Issues

This is a list of known Mac-specific issues in MonoDevelop. Older releases likely have many more known issues, so please upgrade to the latest version.

Many of these known issues correspond to existing MonoDevelop or GTK+ bugs, but some have not yet been filed. Note that the Mac native GTK+ (Quartz) is relatively new, and hence many Monodevelop problems are actually GTK+ ones.

Open GTK+ Quartz bugs can be seen here on [GNOME BugZilla](http://bugzilla.gnome.org/buglist.cgi?query=component:quartz+product:gtk%2B+).

Open MonoDevelop bugs can be seen on [Xamarin BugZilla](http://bugzilla.xamarin.com/describecomponents.cgi?product=MonoDevelop).

Bugs marked as ~~strikethough~~ have been fixes that will be released in future versions of MonoDevelop or Mono.

#### Key Bindings

-   There is no Visual Studio keybinding scheme for the Mac
-   ~~The keybinding manager cannot capture certain combinations, in particular those that trigger the dialog button mnemonics (Cmd-C, Cmd-O)  [GTK+ bug]~~
-   Some selection modifiers (Command, Control, Alt) do not match Mac behaviour, e.g.treeview selections.
-   Mac main menu cannot display keybindings with multipress ("Mode"/"Chord") accelerators. Despite not being displayed, these are still functional.
-   Alt-arrow navigation by words doesn't work in GTK text widgets; GTK doesn't support binding the alt key (but the MD command system has a workaround).

#### Mac Integration

-   GTK+ theme doesn't look like other Mac apps
-   ~~File selector dialogs (Open/Save/SaveAs/Add) do not use Mac file navigation.~~
-   Window does not have document icon
-   MonoDevelop Window is SDI, not MDI.
-   Many file associations are missing.
-   MD has a separate recent file/documents list (FreeDesktop ~/.recently-used)
-   Dock icon's menu can't be used to select open documents
-   ~~No detection of file handlers for "Open With" menu.~~

#### Misc

-   ~~Control-click doesn't emulate right-click<br/>
     [[GTK+ bug, patch]](http://bugzilla.gnome.org/show_bug.cgi?id=346609 "http://bugzilla.gnome.org/show_bug.cgi?id=346609")<br/>
     [[Bug 359734 - Control-click doesn't map to right-click]](https://bugzilla.novell.com/show_bug.cgi?id=359734 "https://bugzilla.novell.com/show_bug.cgi?id=359734")~~
-   Context menu submenus can display on wrong monitor [[MD Bug 501553]](https://bugzilla.novell.com/show_bug.cgi?id=501553 "https://bugzilla.novell.com/show_bug.cgi?id=501553") [GTK+ bug]
-   Mouse clicks on dialogs annd menus sometimes have no effect unless MD is defocused and refocused.
-   MD cannot restore maximize or fullscreen state correctly between sessions [[MD bug 561726]](https://bugzilla.novell.com/show_bug.cgi?id=561726 "https://bugzilla.novell.com/show_bug.cgi?id=561726") [GTK+ bug]
-   Errors when opening context menus and configuration dropdown on PPC [[MD Bug 547894]](https://bugzilla.novell.com/show_bug.cgi?id=547894 "https://bugzilla.novell.com/show_bug.cgi?id=547894")
-   Mouse grabs are not always released. Affects treeview disclosures and toolbar buttons. Click on the window decoration to reset grab tracking. 

#### Source Editor

-   Doesn't handle multi-press input methods, e.g. Opt-u, u for ü. This is because GTK+  hasn't implemented IM modules for Mac.
-   Some keyboard layouts are not supported correctly.
-   No font fallbacks if font does not contain glyph [[Pango Bug 608929]](https://bugzilla.gnome.org/show_bug.cgi?id=608929 "https://bugzilla.gnome.org/show_bug.cgi?id=608929")
-   MD crashes when using Menlo font [Pango]
-   ~~Text editor crashes when cutting/copying and Launchbar/Quicksilver is handling clipboard~~.
-   Input methods are not supported, so many languages' characters cannot be input.
-   Doesn't render when QuartzGL is enabled: [[MD Bug 540583]](https://bugzilla.novell.com/show_bug.cgi?id=540583 "https://bugzilla.novell.com/show_bug.cgi?id=540583")[GTK+ bug]

#### Drag-n-drop

-   Generally buggy [[GTK+ bug \#1]](http://bugzilla.gnome.org/show_bug.cgi?id=559904 "http://bugzilla.gnome.org/show_bug.cgi?id=559904") [[GTK+ bug \#2]](http://bugzilla.gnome.org/show_bug.cgi?id=501588 "http://bugzilla.gnome.org/show_bug.cgi?id=501588")
-   Shift-drag [[GTK+ bug]](http://bugzilla.gnome.org/show_bug.cgi?id=569145 "http://bugzilla.gnome.org/show_bug.cgi?id=569145")
-   Drag-n-drop in the solution pad duplicates the item in the pad instead of moving it [GTK+ bug]
-   Drag-n-drop in the solution pad does not show the file icon [GTK-quartz limitation]
-   Drag-n-drop in the text editor does not show a preview of the dragged text [GTK-quartz limitation]

#### Disabled Addins

-   Gettext addin - need more gettext utils installed
-   Python, Vala, Java, Boo - untested

### Misc Issues

#### MonoDevelop crashes when you copy text

Some popular Mac utilities trigger bugs in the GTK+ clipboard. In their options, you may be able to list MonoDevelop as a process they should not interfere with.

This affects MD 2.4 and 2.6 alpha 1, but git master has a workaround.

**UPDATE: Fixed in Mono 2.10.3.**

Utilities that are known to cause this problem include:

-   QuickSilver
-   Google Toolbar
-   LaunchBar
-   Typinator
-   PTHPasteboard
-   QuickKeys
-   Keyboard Maestro
-   Butler
-   ClipboardHistory


