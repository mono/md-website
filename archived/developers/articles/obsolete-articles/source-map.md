---
title: Source Map
redirect_from:
  - /Developers/Articles/Obsolete_Articles/Source_Map/
  - /Source_Map/
  - /Developers/Obsolete_Articles/Source_Map/
---

### Introduction

Sometimes it can be hard to find your way around the MonoDevelop source tree. This is intended as a brief description on where and what things are, and a couple of tips to find things. Beware that MonoDevelop is in heavy active development and things can and do change rapidly.

### Assemblies

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><strong>Name</strong></td>
<td align="left"><strong>Location</strong></td>
<td align="left"><strong>Description</strong></td>
<td align="left"><strong>Dependencies</strong></td>
</tr>
<tr class="even">
<td align="left"><strong>MonoDevelop.Core</strong></td>
<td align="left">src/Libraries/MonoDevelop.Core/</td>
<td align="left">Contains the bare necessities for the IDE</td>
<td align="left"><em>none</em></td>
</tr>
<tr class="odd">
<td align="left"><strong>MonoDevelop.Base</strong></td>
<td align="left">src/Main/Base/</td>
<td align="left">Contains the base of the IDE</td>
<td align="left"><ul>
<li>MonoDevelop.Core</li>
<li>Gtk#/GNOME</li>
</ul></td>
</tr>
<tr class="even">
<td align="left"><strong>gdl-sharp</strong></td>
<td align="left">gdldock/</td>
<td align="left">Binding of the gdl dock C library</td>
<td align="left"><ul>
<li>Gtk#</li>
</ul></td>
</tr>
<tr class="odd">
<td align="left"><strong>ICSharpCode.SharpAssembly</strong></td>
<td align="left">src/Libraries/SharpAssembly/</td>
<td align="left">Assembly reading library</td>
<td align="left"><em>none</em></td>
</tr>
<tr class="even">
<td align="left"><strong>ICSharpCode.SharpRefactory</strong></td>
<td align="left">src/Libraries/SharpRefactory/</td>
<td align="left">C# parser library</td>
<td align="left"><em>none</em></td>
</tr>
<tr class="odd">
<td align="left"><strong>MonoDevelop.SourceEditor</strong></td>
<td align="left">src/AddIns/DisplayBindings/SourceEditor/</td>
<td align="left">Default editor for MonoDevelop</td>
<td align="left"><ul>
<li>Gtk#</li>
<li>gtksourceview-sharp</li>
<li>MonoDevelop.Core</li>
<li>MonoDevelop.Base</li>
<li>MonoDevelop.Gui.Widgets</li>
<li>MonoDevelop.Gui.Utils</li>
</ul></td>
</tr>
<tr class="even">
<td align="left"><strong>MonoDevelop.Gui.Utils</strong></td>
<td align="left">src/Libraries/MonoDevelop.Gui.Utils/</td>
<td align="left">Miscellaneous extra functions</td>
<td align="left"><ul>
<li>Gtk#/GNOME</li>
</ul></td>
</tr>
<tr class="odd">
<td align="left"><strong>MonoDevelop.Gui.Widgets</strong></td>
<td align="left">src/Libraries/MonoDevelop.Gui.Widgets/</td>
<td align="left">Extra Gtk# specific widgets</td>
<td align="left"><ul>
<li>Gtk#/GNOME</li>
<li>MonoDevelop.Core</li>
<li>MonoDevelop.Gui.Utils</li>
</ul></td>
</tr>
<tr class="even">
<td align="left"><strong>MonoDevelop.Debugger</strong></td>
<td align="left">src/AddIns/DebuggerAddIn/</td>
<td align="left">Debugging support library</td>
<td align="left"><ul>
<li>Gtk#</li>
<li>Mono.Debugger</li>
<li>MonoDevelop.Base</li>
<li>MonoDevelop.Core</li>
</ul></td>
</tr>
<tr class="odd">
<td align="left"><strong>MonoDevelop.StartPage</strong></td>
<td align="left">src/AddIns/Misc/StartPage/</td>
<td align="left">IDE start page</td>
<td align="left"><ul>
<li>gecko-sharp</li>
<li>Gtk#</li>
<li>MonoDevelop.Core</li>
<li>MonoDevelop.Base</li>
</ul></td>
</tr>
<tr class="even">
<td align="left"><strong>CSharpBinding</strong></td>
<td align="left">src/AddIns/BackendBindings/CSharpBinding/</td>
<td align="left">Backend for C# langauge support</td>
<td align="left"><ul>
<li>MonoDevelop.Core</li>
<li>MonoDevelop.Base</li>
<li>MonoDevelop.SourceEditor</li>
<li>ICSharpCode.SharpRefactory</li>
<li>MonoDevelop.Gui.Widgets</li>
</ul></td>
</tr>
<tr class="odd">
<td align="left"><strong>JavaBinding</strong></td>
<td align="left">src/AddIns/BackendBindings/JavaBinding/</td>
<td align="left">Backend for Java langauge</td>
<td align="left"><ul>
<li>External java runtime and compiler</li>
</ul></td>
</tr>
<tr class="even">
<td align="left"><strong>StartUp</strong></td>
<td align="left">src/Main/StartUp/</td>
<td align="left">Parses command line and invokes the rest</td>
<td align="left"><ul>
<li>MonoDevelop.Core</li>
<li>MonoDevelop.Base</li>
<li>MonoDevelop.SourceEditor</li>
<li>ICSharpCode.SharpRefactory</li>
<li>MonoDevelop.Gui.Widgets</li>
</ul></td>
</tr>
</tbody>
</table>

### Others

Add-in files:

`build/AddIns/`
 Resources:

`build/data/resources/`
`data/resources/`
 Templates:

`build/data/templates/`
 Glade:

`data/resources/glade/`

### Last Resort

If you still can't find what you're looking for, here's a couple of example `find` commands that might help:

``` eval
find . -name '*TypeName*.cs'
find . -name '*.cs' | xargs grep TypeName
```

### Credits, License, and Errata

Send comments to [jluke](mailto:jluke@cfl.rr.com "mailto:jluke@cfl.rr.com") or the [MonoDevelop mailing list](mailto:monodevelop-list@lists.ximian.com "mailto:monodevelop-list@lists.ximian.com")

Licensed under the [MIT License](http://opensource.org/licenses/mit-license.php "http://opensource.org/licenses/mit-license.php")


