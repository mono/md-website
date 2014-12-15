---
title: MonoDevelop 2.2 Released
redirect_from:
  - /Download/MonoDevelop_2.2_Released/
---

The MonoDevelop team is proud to announce the release of **MonoDevelop 2.2**.

MonoDevelop is an IDE primarily designed for C# and other .NET languages. MonoDevelop enables developers to quickly write desktop and ASP.NET Web applications on Linux, Windows and Mac OSX. MonoDevelop makes it easy for developers to port .NET applications created with Visual Studio to Linux and Mac OSX and to maintain a single code base for all platforms.

New Features
------------

This release contains lots of new features and improvements. Here is a summary of the new features. You will find a more detailed description of what's new in the [What's new in MonoDevelop 2.2](/documentation/release-notes/whats-new-in-monodevelop-2.2/) page.

-   Multi-platform
    -   [Windows](/documentation/release-notes/whats-new-in-monodevelop-2.2/#windows-support) and [Mac OSX](/documentation/release-notes/whats-new-in-monodevelop-2.2/#mac-support) are now officially supported platforms
-   [Project Management](/documentation/release-notes/whats-new-in-monodevelop-2.2/#project-management)
    -   Multiple target runtimes
    -   Per-mime type and per-project formatting policies
    -   Custom execution modes
    -   Global assembly folders
    -   Drag & Drop from file explorer to solution tree
    -   Initial support for .NET 4.0
-   [Debugger](/documentation/release-notes/whats-new-in-monodevelop-2.2/#debugger)
    -   Support for the new Mono Soft Debugger
    -   Support for Win32 debugging
    -   ASP.NET debugging
    -   Moonlight debugging
    -   New expression evaluation options
    -   Immediate window
-   [Text Editor](/documentation/release-notes/whats-new-in-monodevelop-2.2/#text-editor)
    -   Autosave
    -   Code templates
    -   Block selection
    -   Code focus
    -   Big performance improvements
    -   C# code formatter
    -   Acronym matching in code completion
    -   Xml documentation shown in code completion
    -   Dynamic abbrev command
    -   Code generator
-   [Refactoring Operations](/documentation/release-notes/whats-new-in-monodevelop-2.2/#refactoring)
    -   Resolve namespace
    -   Rename refactoring with preview
    -   Extract method
    -   Declare local variable
    -   Integrate temporary variable
    -   Introduce constant
    -   Move type to own file
    -   Remove unused namespace imports
    -   Sort namespace imports
    -   Create/Remove backing store
    -   Inline rename
-   [Version Control](/documentation/release-notes/whats-new-in-monodevelop-2.2/#version-control)
    -   New Show Annotations command
    -   Create Patch command
-   New add-ins
    -   [Python add-in](/documentation/release-notes/whats-new-in-monodevelop-2.2/#python-binding)
    -   [ASP.NET MVC add-in](/documentation/release-notes/whats-new-in-monodevelop-2.2/#aspnet-mvc-add-in)
    -   [IPhone add-in](/documentation/release-notes/whats-new-in-monodevelop-2.2/#iphone-add-in)
    -   [Moonlight add-in](/documentation/release-notes/whats-new-in-monodevelop-2.2/#iphone-add-in)

Notice that not all features are supported in all platforms. See the [Feature Matrix](/documentation/release-notes/whats-new-in-monodevelop-2.2/#feature-matrix) to find out which features are supported.

Please see [What's new in MonoDevelop 2.2](/documentation/release-notes/whats-new-in-monodevelop-2.2/) for more details.

Getting MonoDevelop
-------------------

Packages for several distros and platforms, as well as source code tarballs and build instructions are available in the MonoDevelop [Download](/download/) page.

This release of MonoDevelop needs at least **Mono 2.4** and **Gtk# 2.12.8** to run on Linux and Mac OSX.

Credits
-------

### Contributors to this Release

-   Lluis Sanchez (project management, debugger, Windows port)
-   Mike Krueger (text editor, refactoring)
-   Michael Hutchinson (IPhone add-in, Mac port, ASP.NET MVC addin, T4 addin, Moonlight add-in)
-   Mike Kestner (Gtk# designer)
-   Ankit Jain (msbuild support)
-   Levi Bard (annotation support, create patch command, C/C++ binding)
-   Christian Hergert (Python binding, GTK+ fixes for Mac)
-   Luciano N. Callero (database add-in)
-   Zach Lute (go to file dialog)
-   Jérémie Laval (makefile generation switches)
-   Carlo Kok
-   Viktoria Dudka
-   Jonathan Pobst (Windows setup)
-   Marc Christensen (QA)
-   Andrew Jorgensen (packaging)

### All Contributors

Aaron Bockover, Alberto Paro, Alejandro Serrano, Alexandre Gomes, Alex Graveley, Andrés G. Aragoneses, Andre Filipe de Assuncao e Brito, Andrew Jorgensen, Antonio Ognio, Ankit Jain, Ben Maurer, Ben Motmans, Carlo Kok, Christian Hergert, Daniel Kornhauser, Daniel Morgan, David Makovský, Eric Butler, Erik Dasque, Franciso Martinez, Geoff Norton, Gustavo Giráldez, Iain McCoy, Inigo Illan, Jacob Ilsø Christensen, James Fitzsimons, Jeff Stedfast, Jérémie Laval, Jeroen Zwartepoorte, John BouAnton, John Luke, Joshua Tauberer, Jonathan Hernández Velasco, Jonathan Pobst, Levi Bard, Lluis Sanchez Gual, Luciano N. Callero, Marc Christensen, Marcos David Marín Amador, Martin Willemoes Hansen, Marek Sieradzki, Matej Urbas, Maurício de Lemos Rodrigues Collares Neto, Michael Hutchinson, Miguel de Icaza, Mike Krüger, Muthiah Annamalai, Nick Drochak, nricciar, Paco Martínez, Pawel Rozanski, Pedro Abelleira Seco, Peter Johanson, Philip Turnbull, Richard Torkar, Rolf Bjarne Kvinge, Rusty Howell, Scott Ellington, Thomas Wiest, Todd Berman, Viktoria Dudka, Vincent Daron, Vinicius Depizzol, Wade Berrier, Yan-ren Tsai and Zach Lute.

This list may not be complete, some contributors who sent patches by email or via our bugzilla may be missing. Your work is still greatly appreciated. If your name was left off the list, it was not intentional, please send an email to the MonoDevelop mailing list and it will be corrected as soon as possible.

### Translators

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><table>
<tbody>
<tr class="odd">
<td align="left">Catalan</td>
<td align="left">Jonathan Hernández Velasco, Jordi Mas i Hernández</td>
</tr>
<tr class="even">
<td align="left">Czech</td>
<td align="left">David Makovský</td>
</tr>
<tr class="odd">
<td align="left">Danish</td>
<td align="left">Martin Willemoes Hansen, Jacob Ilsø Christensen</td>
</tr>
<tr class="even">
<td align="left">German</td>
<td align="left">Mike Krüger, Gustav Schauwecker, Martin Dederer</td>
</tr>
<tr class="odd">
<td align="left">Spanish</td>
<td align="left">Antonio Ognio, Alejandro Serrano, Andrés G. Aragoneses</td>
</tr>
<tr class="even">
<td align="left">French</td>
<td align="left">Vincent Daron, Nicolas Favre-Félix</td>
</tr>
<tr class="odd">
<td align="left">Galician</td>
<td align="left">Ignacio Casal Quinteiro</td>
</tr>
<tr class="even">
<td align="left">Hungarian</td>
<td align="left">Bálint Kriván, Gergely Kiss</td>
</tr>
<tr class="odd">
<td align="left">Indonesian</td>
<td align="left">Fajrin Azis</td>
</tr>
<tr class="even">
<td align="left">Italian</td>
<td align="left">Alberto Paro, Milo Casagrande</td>
</tr>
<tr class="odd">
<td align="left">Japanese</td>
<td align="left">Atsushi Eno</td>
</tr>
</tbody>
</table>
<p> </p></td>
<td align="left"><table>
<tbody>
<tr class="odd">
<td align="left">Dutch</td>
<td align="left">André Offringa</td>
</tr>
<tr class="even">
<td align="left">Polish</td>
<td align="left">Marek Sieradzki</td>
</tr>
<tr class="odd">
<td align="left">Portuguese</td>
<td align="left">Vitor Hugo Barros</td>
</tr>
<tr class="even">
<td align="left">Portuguese<br /> (Brazil)</td>
<td align="left">Mauricio de Lemos Rodrigues Collares Neto, Andre Filipe de Assuncao e Brito, Rafael Teixeira</td>
</tr>
<tr class="odd">
<td align="left">Russian</td>
<td align="left">Maxim Krentovskiy, Semyon Soldatov, Daniel Abramov</td>
</tr>
<tr class="even">
<td align="left">Slovenian</td>
<td align="left">Matej Urbas</td>
</tr>
<tr class="odd">
<td align="left">Swedish</td>
<td align="left">Daniel Nylander</td>
</tr>
<tr class="even">
<td align="left">Turkish</td>
<td align="left">Enver Altin</td>
</tr>
<tr class="odd">
<td align="left">Chinese<br /> (China)</td>
<td align="left">Yu Lindong, Funda Wang</td>
</tr>
<tr class="even">
<td align="left">Chinese<br /> (Taiwan)</td>
<td align="left">Yan-ren Tsai</td>
</tr>
<tr class="odd">
<td align="left"> </td>
<td align="left"> </td>
</tr>
</tbody>
</table>
<p> </p></td>
</tr>
</tbody>
</table>
