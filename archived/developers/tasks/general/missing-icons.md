---
title: Missing Icons
redirect_from:
  - /Developers/Tasks/General/Missing_Icons/
---

<span> </span>

<span id="_task_a_General.MissingIcons"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                  | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Low" style="font-size: x-small;">Low</span> | <span class="task-target" style="font-size: x-small;"></span> |

We are missing quite a lot of tango-style icons.<span style="color: rgb(255, 0, 0);">**
** </span>

### Concept Icons

Name
Description
Required Sizes
Unit Test
 
Menu, Dialog
Build Configuration
A set of build options which can be used to build a project (e.g. 'Debug', 'Release')
Menu, Large Toolbar

### Mac Filetypes

Filetype icons for MD to register to be shown in MacOS Finder for the filetypes owned & handled by MD.

Required sizes: 512, 256, 128, 32, 16 (will be composed to an icns file using Icon Composer).

We could use icons for pretty much every specific filetype, but they're not very important, and too many to list.

### Option Panel Icons

Icons used sections of options dialogs. Required sizes: Menu, Large Toolbar

Name
Description
Assembly Signing
Code signing (security)
Naming Policies
Controls names for files, namespaces, etc.
Standard Header
The header text that's inserted into new files
Changelog settings
Options for formatting and generation of changelogs
Configurations
Configure groups of settings
Makefile integration
Settings for integrations with makefiles

### Action Icons

Required sizes: Menu and SmallToolbar (at least)

*NOTE: in the next version of MonoDevelop the "Find" functionality will be overhauled, and it is likely that only two search-related actions, "Find/Replace in files" and an incremental searchbar-style "Find in document", will be all that remain.*

### IDE Windows and Pads

Required size: Menu.

Name
Description
Version control output pad
Shows the output of version control operations
Output pad
Pad that shows the output of a tool being run from inside the IDE.
Debug Immediate
Propmt which can be used to type and evaluate expressions
Unit Test Results
List of results of running a test suite

### Pad Toolbars

Required size: Menu and SmallToolbar

*NOTE: Many of the pad toolbar icons exist, and although freely licensed are of poor quality. Please check before tackling these.*

Name
Description
Group in categories
Toggles whether the toolbox or property grid's items should be grouped by category.
Events
Toggles the event editing tab in the property grid
Properties
Toggles the property editing tab in the property grid
Show as icons
Toggles the toolbox items to be shown as a palette of icons rather a list of names

### File/Project Templates

Used only in the New File / New Project dialogs

Required size: Menu, Dialog

Name
Description
Precompiled Text Template
T4 Text templating file
MonoMac project
Project for creating Mac applications

### File Types

File type icons shown in the project tree, and the New File / New Project dialog.

Required size: Menu, Dialog

Name
Description
Text Template
T4 Text templating file
Precompiled Text Template
Precompiled T4 Text templating file
Web Application
ASP.NET web application
Web Form
ASP.NET interactive web page
Web Handler
ASP.NET web request handler
Web Control
ASP.NET web form widget
Web Service
ASP.NET web service
Master Page
ASP.NET master page
Global.asmx
ASP.NET application level objects and events for web app
Web.config
ASP.NET web configuration file

### Gtk# Widget Icons

Pretty much all the icons in the Gtk# designer - widgets, templates, etc. - could be replaced with nicer ones.

### ASP.NET Widget Icons

Required size: 16x16, 32x32

*NOTE: These need to be embedded into Mono's System.Web.dll assembly.*

Name
Description
Button
 
ImageButton
 
LinkButton
 
RadioButton
 
RadioButtonList
 
CheckBox
 
CheckBoxList
 
AdRotator
 
Image
 
Label
 
HyperLink
 
Panel
 
Table
 
DropDownList
 
Calendar
 
ListBox
 
PlaceHolder
 
Xml
 
Repeater
Programmatically repeats its contents a number of times
TextBox
 
ValidationSummary
 
CompareValidator
 
CustomValidator
 
RangeValidator
Validates that the contents of a field are within a given range
RegularExpressionValidator
Validates a field against a regular expression
RequiredFieldValidator
Validates that a field is not empty
Literal
Something to be output verbatim to HTML
DataGrid
A grid bound to a data source
DataList
A list bound to a data source
 

 


