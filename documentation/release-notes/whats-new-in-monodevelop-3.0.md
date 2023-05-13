---
title: What's new in MonoDevelop 3.0
redirect_from:
  - /Download/What's_new_in_MonoDevelop_3.0/
  - /Download/Release_Notes/Release_Notes_for_MonoDevelop_2.9.3/
  - /Download/Whats_new_in_MonoDevelop_3.0/
---

The major focus of MonoDevelop 3.0 is a new C# code completion engine, which provides more accurate and reliable code completion and navigation, semantic highlighting for C# files, and a reliable on-the-fly code formatter.

However, there are many other new features and improvements, including a revamped Assembly Browser, preliminary support for Portable Library Projects, better handling of large projects, and virtual indenting in the source editor.

The Mono for Android addin, available on Mac and Windows, now has a visual drag-and-drop designer for Android user interfaces, and there is a new MonoMac addin that has much better support for the Mac App Store.

These features are described in detail below.

New C# Completion Engine
-------------------------

This release of MonoDevelop features a new resolver and code completion engine for C# based on Mono's C# Compiler as a Service. This means that improvements that are done to Mono's C# compiler, such as new features added to the language or fixes done to it, now flow naturally into MonoDevelop. The compiler as a service is encapsulated in the easy-to-use [NRefactory 5](https://github.com/icsharpcode/NRefactory) library, which both MonoDevelop and SharpDevelop consume.

This work has allowed us to substantially improve many existing features, and to introduce new ones, and it provides a solid foundation for future changes.

### C# Code Completion

![md30\_codecompletion.png](/images/374-md30_codecompletion.png)

The reliability and accuracy of the C# code completion has been improved substantially. In particular, code completion is now more robust in its handling of incomplete code, and better at providing correctly contextual suggestions. Type inference in code completion is much more reliable, which fixes cases where MonoDevelop failed to provide code completion for lambdas and LINQ expressions.

Many known issues in C# code completion have been fixed, and are now covered by a large automated test suite.

### Navigation and Refactoring

![md30\_createmember.png](/images/375-md30_createmember.png)

The *Find References* navigation command now uses the new C# resolver. It is more accurate and many times faster, particularly for members. This also makes the *Rename* refactoring command much faster.

Many new refactorings and code transformation actions are available from the context menu in the source editor.

### Semantic Highlighting

![md30\_semantic\_highlighting.png](/images/376-md30_semantic_highlighting.png)

Semantic highlighting for C# has returned! It is now much faster, and is enabled by default. It makes code more readable by allowing the syntax highlighting engine to highlight different kinds of symbols differently in a mneaingful way. For example, type names are highlighted a different color than member names, and unresolved symbols are highlighted red.

### Code Formatting

![md30\_code\_formatting.png](/images/383-md30_code_formatting.png)

The on-the-fly C# code formatter automatically reformats your code to match your project's code style settings as you edit it in the source editor. The newest version is much improved. It's more reliable and less intrusive, and is now enabled by default. It can be disabled in the *Text Editor-\>Behavior* preferences panel.

By [popular demand](http://xamarin.uservoice.com/forums/144858-xamarin-suggestions/suggestions/2697145-code-formatting-exactly-like-in-visual-studio), there is a new pre-defined C# code style scheme called "Allman" that is compatible with the default code formatting of Visual Studio. There's also a choice of built in schemes for other popular styles, and an editor that allows you to customise the scheme to match your personal preferences.

### Experimental Source Analysis

![md30\_source\_analysis.png](/images/377-md30_source_analysis.png)

When enabled, the experimental source analysis engine inspects your code on the fly, detects problems and potential improvements, and highlights them various ways depending on their severity. The vertical scrollbar provides a high-level view of inspection results and search results for the whole file.

The new *Quick Fix* command offers contextual actions for transforming and refactoring code, including automatic fixes for many inspections. It improves discovery of refactoring commands by hinting when they are available with a lightbulb icon.

The source analysis engine and context actions now use the new C# resolver, which has enabled the efficient implementation of many more inspection rules. It's straightforward to [implement new actions](http://mikemdblog.blogspot.com/2012/03/how-to-write-context-action-using.html) using the NRefactory 5 context actions model.

![md\_30\_minimap\_scrollbar.png](/images/378-md_30_minimap_scrollbar.png)

When source analysis is enabled, there is also an optional minimap scrollbar. This can be enabled from the context menu on the source editor scrollbar.

Source analysis features are experimental, and may not be supported in future versions. For this reason they're disabled by default, but they can be enabled in the *Other-\>Source Analysis* preferences panel.

Mac and Android
---------------

### New MonoMac Addin

![md30\_monomac\_entitlements.png](/images/380-md30_monomac_entitlements.png)

The MonoMac add-in has been updated to improve support for deploying to the Mac App Store. The features and functionality now closer match the MonoTouch add-in.

There is a user-friendly editor for the Info.plist manifest, including editing of Mac App Store entitlements for app sandboxing. Packaging and signing options are now in the project options and can be enabled as part of the build process.

### Enhanced PList Support

![md30\_plisteditor.png](/images/379-md30_plisteditor.png)

The usability of the PList editor for both MonoTouch and MonoMac projects has been greatly improved, and many quirks have been fixed. The enhanced editor now uses information about known keys to:

-   offer a list of valid subkeys when adding children to a key of type Dictionary or Array
-   set the correct type for subkeys automatically
-   offer valid values for keys of type String and Number
-   automagically add required subkeys when a key is added

### Portable Library Projects (PLP)

Initial support for PLP has been implemented. This is preliminary and is currently intended to allow loading and consuming PLP libraries within solutions that are shared with Visual Studio; it's still not possible to create new PLP projects, or change the target profile of PLP projects in the Project Options. Full PLP support will follow in a future release.

On Windows, PLP projects are built using the Microsoft PLP targets. Building PLP projects on Mac OS X works too, although these projects are currently not built against the actual .NETPortable framework profile, but rather against the MonoTouch or Mono for Android frameworks, or against the .NET Framework 4.0 if neither of the mobile frameworks are installed.

### Android UI Designer

![md30\_android\_designer.png](/images/382-md30_android_designer.png)

The Xamarin packages of MonoDevelop on Mac and Windows include a new visual drag-and-drop UI designer for editing Android XML layouts in Mono for Android projects. It has full support for resources and qualifiers, and can be used to view and edit the layout in various simulated device specifications.

For more information, see the [Mono for Android Designer Tutorial](http://docs.xamarin.com/android/tutorials/Designer_Overview).

Other Features
--------------

### Virtual Indent Mode

The new virtual indent mode in the text editor handles leading whitespace on new lines much better. It places the caret on new lines as if it were indented, but doesn't insert actual whitespace characters until they're needed.

This is a more reliable way to keep blank lines empty compared to the old option for removing trailing whitespace. It has the added benefit that it cannot add noise to VCS history by accidentally affecting existing code.

### Revamped Assembly Browser

![md30\_assemblybrowser.png](/images/381-md30_assemblybrowser.png)

The assembly browser has been substantially overhauled. Performance has been improved, search and navigation are more reliable.

It can now be opened directly from the *View* menu, and can be used to browse types from projects as well as assemblies.

### Improved Performance for Large Projects

The performance of large projects has been greatly improved. Many common operations such as opening, closing, building, cleaning and adding files are significantly faster.
