---
title: Missing Icons
redirect_from:
  - /Developers/Tasks/General/Missing_Icons/
---


|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                  | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Low" style="font-size: x-small;">Low</span> | <span class="task-target" style="font-size: x-small;"></span> |

We are missing quite a lot of tango-style icons.

### Concept Icons

Name<br/>
Description<br/>
Required Sizes<br/>
Unit Test<br/>
Menu, Dialog<br/>
Build Configuration<br/>
A set of build options which can be used to build a project (e.g. 'Debug', 'Release')<br/>
Menu, Large Toolbar

### Mac Filetypes

Filetype icons for MD to register to be shown in MacOS Finder for the filetypes owned & handled by MD.

Required sizes: 512, 256, 128, 32, 16 (will be composed to an icns file using Icon Composer).

We could use icons for pretty much every specific filetype, but they're not very important, and too many to list.

### Option Panel Icons

Icons used sections of options dialogs. Required sizes: Menu, Large Toolbar

Name<br/>
Description<br/>
Assembly Signing<br/>
Code signing (security)<br/>
Naming Policies<br/>
Controls names for files, namespaces, etc.<br/>
Standard Header<br/>
The header text that's inserted into new files<br/>
Changelog settings<br/>
Options for formatting and generation of changelogs<br/>
Configurations<br/>
Configure groups of settings<br/>
Makefile integration<br/>
Settings for integrations with makefiles

### Action Icons

Required sizes: Menu and SmallToolbar (at least)

*NOTE: in the next version of MonoDevelop the "Find" functionality will be overhauled, and it is likely that only two search-related actions, "Find/Replace in files" and an incremental searchbar-style "Find in document", will be all that remain.*

### IDE Windows and Pads

Required size: Menu.

Name<br/>
Description<br/>
Version control output pad<br/>
Shows the output of version control operations<br/>
Output pad<br/>
Pad that shows the output of a tool being run from inside the IDE.<br/>
Debug Immediate<br/>
Propmt which can be used to type and evaluate expressions<br/>
Unit Test Results<br/>
List of results of running a test suite

### Pad Toolbars

Required size: Menu and SmallToolbar

*NOTE: Many of the pad toolbar icons exist, and although freely licensed are of poor quality. Please check before tackling these.*

Name<br/>
Description<br/>
Group in categories<br/>
Toggles whether the toolbox or property grid's items should be grouped by category.<br/>
Events<br/>
Toggles the event editing tab in the property grid<br/>
Properties<br/>
Toggles the property editing tab in the property grid<br/>
Show as icons<br/>
Toggles the toolbox items to be shown as a palette of icons rather a list of names

### File/Project Templates

Used only in the New File / New Project dialogs

Required size: Menu, Dialog

Name<br/>
Description<br/>
Precompiled Text Template<br/>
T4 Text templating file<br/>
MonoMac project<br/>
Project for creating Mac applications

### File Types

File type icons shown in the project tree, and the New File / New Project dialog.

Required size: Menu, Dialog

Name<br/>
Description<br/>
Text Template<br/>
T4 Text templating file<br/>
Precompiled Text Template<br/>
Precompiled T4 Text templating file<br/>
Web Application<br/>
ASP.NET web application<br/>
Web Form<br/>
ASP.NET interactive web page<br/>
Web Handler<br/>
ASP.NET web request handler<br/>
Web Control<br/>
ASP.NET web form widget<br/>
Web Service<br/>
ASP.NET web service<br/>
Master Page<br/>
ASP.NET master page<br/>
Global.asmx<br/>
ASP.NET application level objects and events for web app<br/>
Web.config<br/>
ASP.NET web configuration file

### Gtk# Widget Icons

Pretty much all the icons in the Gtk# designer - widgets, templates, etc. - could be replaced with nicer ones.

### ASP.NET Widget Icons

Required size: 16x16, 32x32

*NOTE: These need to be embedded into Mono's System.Web.dll assembly.*

Name<br/>
Description<br/>
Button<br/>
ImageButton<br/>
LinkButton<br/>
RadioButton<br/>
RadioButtonList<br/>
CheckBox<br/>
CheckBoxList<br/>
AdRotator<br/>
Image<br/>
Label<br/>
HyperLink<br/>
Panel<br/>
Table<br/>
DropDownList<br/>
Calendar<br/>
ListBox<br/>
PlaceHolder<br/>
Xml<br/>
Repeater<br/>
Programmatically repeats its contents a number of times<br/>
TextBox<br/>
ValidationSummary<br/>
CompareValidator<br/>
CustomValidator<br/>
RangeValidator<br/>
Validates that the contents of a field are within a given range<br/>
RegularExpressionValidator<br/>
Validates a field against a regular expression<br/>
RequiredFieldValidator<br/>
Validates that a field is not empty<br/>
Literal<br/>
Something to be output verbatim to HTML<br/>
DataGrid<br/>
A grid bound to a data source<br/>
DataList<br/>
A list bound to a data source
