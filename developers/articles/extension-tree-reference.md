---
title: Extension Tree Reference
redirect_from:
  - /Developers/Articles/Extension_Tree_Reference/
  - /Extension_Tree_Reference/
---

Introduction
------------

This document shows the complete extension tree available to add-in developers.

Modules
-------

-   [ASP.NET Project Support](#aspnet-project-support)
-   [C/C++ Language Binding](#cc-language-binding)
-   [Debugger support for MonoDevelop](#debugger-support-for-monodevelop)
-   [Deployment Services Core](#deployment-services-core)
-   [Gettext Translations Support](#gettext-translations-support)
-   [Gtk# Visual Designer](#gtk-visual-designer)
-   [HeapBuddy Profiler Add-in](#heapbuddy-profiler-add-in)
-   [HeapShot Profiler Add-in](#heapshot-profiler-add-in)
-   [Makefile generation](#makefile-generation)
-   [MonoDevelop Database Components](#monodevelop-database-components)
-   [MonoDevelop Database ConnectionManager](#monodevelop-database-connectionmanager)
-   [MonoDevelop Database Query](#monodevelop-database-query)
-   [MonoDevelop Database Sql](#monodevelop-database-sql)
-   [MonoDevelop GUI for Project Services](#monodevelop-gui-for-project-services)
-   [MonoDevelop Gui Services](#monodevelop-gui-services)
-   [MonoDevelop Ide](#monodevelop-ide)
-   [MonoDevelop Profiling Addin](#monodevelop-profiling-addin)
-   [MonoDevelop Project Services](#monodevelop-project-services)
-   [MonoDevelop Runtime](#monodevelop-runtime)
-   [MonoDevelop Source Editor](#monodevelop-source-editor)
-   [NUnit support](#nunit-support)
-   [Project Web References](#project-web-references)
-   [Vala Language Binding](#vala-language-binding)
-   [Version Control Support](#version-control-support)
-   [Visual Designer Support](#visual-designer-support)
-   [XML Editor](#xml-editor)

ASP.NET Project Support
-----------------------

Support for ASP.NET projects, including editing, compiling, previewing and deploying to remote servers.

|-----------|-------------|
| Id        | AspNet      |
| Namespace | MonoDevelop |
| Version   | 2.1.0       |

Extension Points:

-   /MonoDevelop/Html/DocTypes

#### /MonoDevelop/Html/DocTypes

Extension Nodes

**DocType**

|-----------------------|---------------|----------|-------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Name                  | Type          | Required | Localizable | Description                                                                                                                          |
| name                  | System.String | True     | False       | The human-readable name of the schema. It's expected to be a substring of the full doctype declaration that's uniquely identifiable. |
| fullName              | System.String | True     | False       | The full doctype declaration.                                                                                                        |
| xsdFile               | System.String | False    | False       | An XML schema that can be used to provide code completion for documents using this doctype.                                          |
| completionDocTypeName | System.String | False    | False       | The name of another doctype declaration that can be used to provide useful code completion for for documents using this doctype.     |

C/C++ Language Binding
----------------------

C/C++ Language binding

|-----------|-------------|
| Id        | CBinding    |
| Namespace | MonoDevelop |
| Version   | 2.1.0       |

Extension Points:

-   Packages folder context menu
-   ProjectPackage context menu
-   /CBinding/Compilers

#### Packages folder context menu

Context menu for packages folder in the solution pad.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### ProjectPackage context menu

Context menu for a package in the solution pad.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### /CBinding/Compilers

Extension Nodes

**Type**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

Debugger support for MonoDevelop
--------------------------------

Support for Debugging projects

|-----------|-------------|
| Id        | Debugger    |
| Namespace | MonoDevelop |
| Version   | 2.1.0       |

Extension Points:

-   /MonoDevelop/Debugging/DebuggerFactories

#### /MonoDevelop/Debugging/DebuggerFactories

Debug session factories. Specified classes must implement Mono.Debugging.IDebuggerSessionFactory.

Extension Nodes

**DebuggerFactory**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

Deployment Services Core
------------------------

Provides basic deployment services

|-----------|-------------|
| Id        | Deployment  |
| Namespace | MonoDevelop |
| Version   | 2.1.0       |

Extension Points:

-   /MonoDevelop/DeployService/PackageBuilders
-   File copiers
-   Deploy service extensions
-   /MonoDevelop/Deployment/PackageBuilderEditors
-   Editors for file copy congigurations
-   Package context menu
-   Packaging project context menu
-   Deploy directories
-   Deploy platforms
-   Deploy directory resolvers

#### /MonoDevelop/DeployService/PackageBuilders

Deployment handlers. Specified classes must implement IDeployHandler.

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### File copiers

File copiers for deployment handlers. Specified classes must implement IDeployFileCopier.

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Deploy service extensions

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### /MonoDevelop/Deployment/PackageBuilderEditors

Editors for package builders. Specified classes must implement IPackageBuilderEditor.

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Editors for file copy congigurations

Editors for file copy congigurations. Specified classes must implement IFileCopyConfigurationEditor.

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Package context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Packaging project context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Deploy directories

Extension Nodes

**DeployDirectory**

|---------|---------------|----------|-------------|-------------|
| Name    | Type          | Required | Localizable | Description |
| \_label | System.String | False    | False       |            |

#### Deploy platforms

Extension Nodes

**DeployPlatform**

|---------|---------------|----------|-------------|-------------|
| Name    | Type          | Required | Localizable | Description |
| \_label | System.String | False    | False       |            |

#### Deploy directory resolvers

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

Gettext Translations Support
----------------------------

Provides support for adding/editing PO files.

|-----------|-------------|
| Id        | Gettext     |
| Namespace | MonoDevelop |
| Version   | 2.1.0       |

Extension Points:

-   Translation project context menu
-   Translation context menu
-   File scanners

#### Translation project context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Translation context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### File scanners

Extension Nodes

**Scanner**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

**RegexScanner**

Specifies a file scanner which can extract strings to be translated using regular expressions.

|-----------|-----------------|----------|-------------|-----------------------------------------------------------------------------------------------|
| Name      | Type            | Required | Localizable | Description                                                                                   |
| extension | System.String[] | False    | False       | Extensions of the files supported by this scanner (use comma to separate multiple extensions) |
| mimeType  | System.String[] | False    | False       | Mime types of the files supported by this scanner (use comma to separate multiple mime types) |

**XmlRegexScanner**

Specifies an xml file scanner which can extract strings to be translated using regular expressions.

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

Gtk# Visual Designer
---------------------

Provides support for visual design of Gtk# windows, dialogs and widgets.

|-----------|-------------|
| Id        | GtkCore     |
| Namespace | MonoDevelop |
| Version   | 2.1.0       |

Extension Points:

-   /MonoDevelop/GtkCore/ContextMenu/ProjectPad.ActionGroup
-   /MonoDevelop/GtkCore/ContextMenu/ProjectPad.UserInterfaceFolder
-   /MonoDevelop/GtkCore/ContextMenu/ProjectPad.Component
-   /MonoDevelop/GtkCore/ContextMenu/ProjectPad.StockIcons

#### /MonoDevelop/GtkCore/ContextMenu/ProjectPad.ActionGroup

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### /MonoDevelop/GtkCore/ContextMenu/ProjectPad.UserInterfaceFolder

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### /MonoDevelop/GtkCore/ContextMenu/ProjectPad.Component

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### /MonoDevelop/GtkCore/ContextMenu/ProjectPad.StockIcons

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

HeapBuddy Profiler Add-in
-------------------------

HeapBuddy Profiler Add-in

|-----------|---------------------|
| Id        | Profiling.HeapBuddy |
| Namespace | MonoDevelop         |
| Version   | 0.2.0               |

Extension Points:

-   HeapBuddy snapshot node context menu
-   HeapBuddy Types node context menu
-   HeapBuddy Backtraces node context menu
-   HeapBuddy History node context menu

#### HeapBuddy snapshot node context menu

HeapBuddy snapshot node context menu.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### HeapBuddy Types node context menu

HeapBuddy Types node context menu.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### HeapBuddy Backtraces node context menu

HeapBuddy Backtraces node context menu.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### HeapBuddy History node context menu

HeapBuddy History node context menu.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

HeapShot Profiler Add-in
------------------------

HeapShot Profiler Add-in

|-----------|--------------------|
| Id        | Profiling.HeapShot |
| Namespace | MonoDevelop        |
| Version   | 0.2.0              |

Extension Points:

-   HeapShot snapshot node context menu

#### HeapShot snapshot node context menu

HeapShot snapshot node context menu.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

Makefile generation
-------------------

Allows generating simple makefiles and Autotools based makefiles for projects

|-----------|-------------|
| Id        | Autotools   |
| Namespace | MonoDevelop |
| Version   | 2.1.0       |

Extension Points:

-   /MonoDevelop/Autotools/SimpleSetups
-   /MonoDevelop/Autotools/MakefileHandlers

#### /MonoDevelop/Autotools/SimpleSetups

Simple autotools setups. Specified classes must implement ISimpleAutotoolsSetup

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### /MonoDevelop/Autotools/MakefileHandlers

Makefile handlers. Specified classes must implement IMakefileHandler

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

MonoDevelop Database Components
-------------------------------

Database Components Module

|-----------|---------------------|
| Id        | Database.Components |
| Namespace | MonoDevelop         |
| Version   | 2.1.0               |

Extension Points:

-   DataGrid renderers
-   DataGrid object visualizers
-   /MonoDevelop/Database/ContextMenu/DataGrid
-   /MonoDevelop/Database/ContextMenu/SqlEditor

#### DataGrid renderers

DataGrid renderers.

Extension Nodes

**Renderer**

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### DataGrid object visualizers

DataGrid object visualizers.

Extension Nodes

**Visualizer**

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### /MonoDevelop/Database/ContextMenu/DataGrid

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### /MonoDevelop/Database/ContextMenu/SqlEditor

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

MonoDevelop Database ConnectionManager
--------------------------------------

Database ConnectionManager Module

|-----------|----------------------------|
| Id        | Database.ConnectionManager |
| Namespace | MonoDevelop                |
| Version   | 2.1.0                      |

Extension Points:

-   Connection Manager pad toolbar
-   Aggregates context menu
-   Columns context menu
-   Column context menu
-   Connections context menu
-   Connection context menu
-   Constraint context menu
-   Constraints context menu
-   Groups context menu
-   Languages context menu
-   Operators context menu
-   Parameter context menu
-   Parameters context menu
-   Procedure context menu
-   Procedures context menu
-   Roles context menu
-   Rules context menu
-   Sequences context menu
-   Table context menu
-   Tables context menu
-   Trigger context menu
-   Triggers context menu
-   Types context menu
-   User context menu
-   Users context menu
-   View context menu
-   Views context menu

#### Connection Manager pad toolbar

Connection manager pad toolbar items.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Aggregates context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Columns context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Column context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Connections context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Connection context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Constraint context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Constraints context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Groups context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Languages context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Operators context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Parameter context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Parameters context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Procedure context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Procedures context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Roles context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Rules context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Sequences context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Table context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Tables context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Trigger context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Triggers context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Types context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### User context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Users context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### View context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Views context menu

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

MonoDevelop Database Query
--------------------------

Database Query Module

|-----------|----------------|
| Id        | Database.Query |
| Namespace | MonoDevelop    |
| Version   | 2.1.0          |

Extension Points:

-   /MonoDevelop/Database/ToolBar/SqlQueryView

#### /MonoDevelop/Database/ToolBar/SqlQueryView

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

MonoDevelop Database Sql
------------------------

Database Module

|-----------|--------------|
| Id        | Database.Sql |
| Namespace | MonoDevelop  |
| Version   | 2.1.0        |

Extension Points:

-   MonoDevelop database providers

#### MonoDevelop database providers

MonoDevelop database factory addins.

Extension Nodes

**DatabaseFactory**

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

MonoDevelop GUI for Project Services
------------------------------------

Provides GUI resources for managing MonoDevelop projects

|-----------|--------------------------|
| Id        | MonoDevelop.Projects.Gui |
| Namespace |                         |
| Version   | 2.1.0                    |

Extension Points:

-   Dialog panels for item options
-   Default policy panels

#### Dialog panels for item options

Dialog panels for item options. Those panels will be shown for all kind of solution items, solutions and workspaces.

Extension Nodes

#### Default policy panels

Panels for editing default policies. Must derive from PolicyOptionsPanel. Should be the same policy panel registered for ItemOptionPanels.

Extension Nodes

MonoDevelop Gui Services
------------------------

Provides basic GUI services

|-----------|-------------|
| Id        | Core.Gui    |
| Namespace | MonoDevelop |
| Version   | 2.1.0       |

Extension Points:

-   Platform Service
-   Stock icons
-   Web Browsers
-   Mime types

#### Platform Service

Implementations of platform-dependent code wrapped in a platform-agnostic API. Specified classes must inherit from MonoDevelop.Core.PlatformService.

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Stock icons

Available from MonoDevelop.Core.Gui.Services.Resources.

Extension Nodes

**StockIcon**

A stock icon. It is possible to register several icons with the same 'id' and different sizes.

|----------|---------------|----------|-------------|------------------------------------------------------------------------|
| Name     | Type          | Required | Localizable | Description                                                            |
| stockid  | System.String | True     | False       | Id of the stock icon.                                                  |
| size     | Gtk.IconSize  | False    | False       | Size of the icon.                                                      |
| resource | System.String | False    | False       | Name of the resource where the icon is stored.                         |
| icon     | System.String | False    | False       | Id of another icon or combination of icons to assign to this stock id. |

#### Web Browsers

Used optionally to provides a web browser widget. Must implement MonoDevelop.Core.Gui.WebBrowser.IWebBrowserLoader

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Mime types

Mime type to file extension mappings. Mime types defined here override the ones provided by the operating system.

Extension Nodes

**MimeType**

|---------------|----------------|----------|-------------|-------------|
| Name          | Type           | Required | Localizable | Description |
| icon          | System.String  | False    | False       |            |
| \_description | System.String  | False    | False       |            |
| baseType      | System.String  | False    | False       |            |
| isText        | System.Boolean | False    | False       |            |

MonoDevelop Ide
---------------

The MonoDevelop IDE application.

|-----------|-------------|
| Id        | Ide         |
| Namespace | MonoDevelop |
| Version   | 2.1.0       |

Extension Points:

-   Display bindings
-   Startup handlers
-   User interface commands
-   Key binding schemes
-   Namespace node context menu in the class pad
-   Method node context menu in the class pad
-   Field node context menu in the class pad
-   Event node context menu in the class pad
-   Combine node context menu in the class pad
-   Class node context menu in the class pad
-   Property node context menu in the class pad
-   Project node context menu in the class pad
-   Reference node context menu in the class pad
-   Project pad context menu
-   Task list views
-   Workbench pads
-   Workbench contexts
-   Global options panels
-   Combine file filters
-   File filters
-   Main toolbar
-   Main menu
-   File templates
-   File template types
-   File template condition types
-   File template types
-   Text editor extensions
-   Project feature editors
-   View Context Menu

#### Display bindings

Display bindings.

Extension Nodes

**DisplayBinding**

A display binding. The specified class must implement MonoDevelop.Ide.Codons.IDisplayBinding.

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Startup handlers

Commands to be automatically executed when the IDE starts.

Extension Nodes

**Class**

A subclass of MonoDevelop.Components.Commands.CommandHandler

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### User interface commands

User interface commands.

Extension Nodes

**Command**

A user interface command. The 'id' of the command must match the full name of an existing enumeration. An arbitrary string can also be used as an id for the command by just using '@' as prefix for the string.

|-----------------|----------------|----------|-------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name            | Type           | Required | Localizable | Description                                                                                                                                                                                                                                                            |
| \_label         | System.String  | True     | False       | Label                                                                                                                                                                                                                                                                  |
| \_description   | System.String  | False    | False       | Description of the command                                                                                                                                                                                                                                             |
| shortcut        | System.String  | False    | False       | Key combination that triggers the command. Control, Alt, Meta, Super and Shift modifiers can be specified using '+' as a separator. Multi-state key bindings can be specified using a '|' between the mode and accel. For example 'Control+D' or 'Control+X|Control+S' |
| macShortcut     | System.String  | False    | False       | Mac version of the shortcut. Format is that same as 'shortcut', but the 'Meta' modifier corresponds to the Command key.                                                                                                                                                |
| icon            | System.String  | False    | False       | Icon of the command. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png'                                                                                  |
| disabledVisible | System.Boolean | False    | False       | Set to 'false' if the command has to be hidden when disabled. 'true' by default.                                                                                                                                                                                       |
| type            | System.String  | False    | False       | Type of the command. It can be: normal (the default), check, radio or array.                                                                                                                                                                                           |
| widget          | System.String  | False    | False       | Class of the widget to create when type is 'custom'.                                                                                                                                                                                                                   |
| defaultHandler  | System.String  | False    | False       | Class that handles this command. This property is optional.                                                                                                                                                                                                            |

**Category**

A command category

|--------|---------------|----------|-------------|-------------|
| Name   | Type          | Required | Localizable | Description |
| \_name | System.String | True     | False       | Name        |

#### Key binding schemes

Key binding schemes.

Extension Nodes

**Scheme**

|----------|----------------|----------|-------------|--------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                            |
| \_name   | System.String  | False    | False       | Name of the key bindings scheme                        |
| file     | System.String  | False    | False       | Name of the key bindings file                          |
| forMac   | System.Boolean | False    | False       | Whether the keybinding file is for Macs.               |
| resource | System.String  | False    | False       | Name of the resource containing the key bindings file. |

#### Namespace node context menu in the class pad

Context menu for namespaces in the class pad.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Method node context menu in the class pad

Context menu for methods in the class pad.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Field node context menu in the class pad

Context menu for fields in the class pad.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Event node context menu in the class pad

Context menu for events in the class pad.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Combine node context menu in the class pad

Context menu for combines in the class pad.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Class node context menu in the class pad

Context menu for classes in the class pad.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Property node context menu in the class pad

Context menu for properties in the class pad.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Project node context menu in the class pad

Context menu for projects in the class pad.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Reference node context menu in the class pad

Context menu for references in the class pad.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Project pad context menu

Context menu for nodes in the solution pad.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Task list views

Task list views to be shown in the task list pad.

Extension Nodes

**TaskListView**

Registers a task list view to be shown in the task list pad.

|---------|---------------|----------|-------------|---------------------------|
| Name    | Type          | Required | Localizable | Description               |
| \_label | System.String | False    | False       | Display name of the view. |
| class   | System.String | False    | False       | Class of the view.        |

#### Workbench pads

Pads shown in the workbench.

Extension Nodes

**Pad**

Registers a pad to be shown in the workbench.

|------------------|---------------|----------|-------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name             | Type          | Required | Localizable | Description                                                                                                                                                                                                                                                                                                                                                                                |
| \_label          | System.String | False    | False       | Display name of the pad.                                                                                                                                                                                                                                                                                                                                                                   |
| class            | System.String | False    | False       | Class name.                                                                                                                                                                                                                                                                                                                                                                                |
| icon             | System.String | False    | False       | Icon of the pad. It can be a stock icon or a resource icon (use 'res:' as prefix in the last case).                                                                                                                                                                                                                                                                                        |
| defaultPlacement | System.String | False    | False       | Default placement of the pad inside the workbench. It can be: left, right, top, bottom, or a relative position, for example: 'ProjectPad/left'would show the pad at the left side of the project pad. When using relative placements several positions can be provided. If the pad can be placed in the first position, the next one will be tried. For example 'ProjectPad/left; bottom'. |

**SolutionPad**

Registers a pad which shows information about a project in a tree view.

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**Category**

|--------|---------------|----------|-------------|---------------|
| Name   | Type          | Required | Localizable | Description   |
| \_name | System.String | True     | False       | Category name |

#### Workbench contexts

Workbench contexts.

Extension Nodes

**WorkbenchContext**

A workbench context.

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Global options panels

Dialog panels for global MonoDevelop options.

Extension Nodes

**Section**

|------|---------------|----------|-------------|-------------|
| Name | Type          | Required | Localizable | Description |
| icon | System.String | False    | False       |            |

#### Combine file filters

File filters to be shown in the Project Open dialog.

Extension Nodes

**FileFilter**

A file filter to be used in the Open File dialog.

|------------|-----------------|----------|-------------|------------------------------|
| Name       | Type            | Required | Localizable | Description                  |
| \_label    | System.String   | True     | False       | Display name of the filter.  |
| extensions | System.String[] | True     | False       | Extensions to use as filter. |

#### File filters

File filters to be shown in the File Open dialog.

Extension Nodes

**FileFilter**

A file filter to be used in the Open File dialog.

|------------|-----------------|----------|-------------|------------------------------|
| Name       | Type            | Required | Localizable | Description                  |
| \_label    | System.String   | True     | False       | Display name of the filter.  |
| extensions | System.String[] | True     | False       | Extensions to use as filter. |

#### Main toolbar

Main toolbar items.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Main menu

Main menu items.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### File templates

File templates to be shown in the New File dialog.

Extension Nodes

**FileTemplate**

A project template.

|----------|---------------|----------|-------------|----------------------------------------------------|
| Name     | Type          | Required | Localizable | Description                                        |
| resource | System.String | False    | False       | Name of the resource where the template is stored. |
| file     | System.String | False    | False       | Name of the file where the template is stored.     |

#### File template types

Template types which can be used to create file templates.

Extension Nodes

**FileTemplateType**

A file template type. The specified class must be a subclass of MonoDevelop.Ide.Templates.FileDescriptionTemplate

|------|---------------|----------|-------------|-----------------------------------------------------------------|
| Name | Type          | Required | Localizable | Description                                                     |
| name | System.String | True     | False       | Name to use to reference this template type in a file template. |

#### File template condition types

Condition types which can be used to limit when file templates can be created.

Extension Nodes

**FileTemplateConditionType**

A condition that limits when a file template is shown. The specified class must be a subclass of MonoDevelop.Ide.Templates.FileTemplateCondition

|------|---------------|----------|-------------|------------------------------------------------------------------|
| Name | Type          | Required | Localizable | Description                                                      |
| name | System.String | True     | False       | Name to use to reference this condition type in a file template. |

#### File template types 2

Project templates to be shown in the New Project dialog.

Extension Nodes

**ProjectTemplate**

A project template.

|----------|---------------|----------|-------------|----------------------------------------------------|
| Name     | Type          | Required | Localizable | Description                                        |
| resource | System.String | False    | False       | Name of the resource where the template is stored. |
| file     | System.String | False    | False       | Name of the file where the template is stored.     |

#### Text editor extensions

Extensions to the text editor. Classes must be a subclass of TextEditorExtension.

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Project feature editors

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### View Context Menu

The context menu for all open files.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

MonoDevelop Profiling Addin
---------------------------

MonoDevelop Profiling Addin

|-----------|-------------|
| Id        | Profiling   |
| Namespace | MonoDevelop |
| Version   | 0.2.0       |

Extension Points:

-   Profiling pad toolbar
-   Profiling pad 'Profiling Snapshots' node
-   Profilers
-   File filters

#### Profiling pad toolbar

Profiling pad toolbar items.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Profiling pad 'Profiling Snapshots' node

Profiling pad root node.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Profilers

Profilers addins.

Extension Nodes

**Profiler**

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### File filters 2

File filters to be shown in the Profiling Snapshot Open dialog.

Extension Nodes

**FileFilter**

A file filter to be used in the Open File dialog.

|------------|-----------------|----------|-------------|------------------------------|
| Name       | Type            | Required | Localizable | Description                  |
| \_label    | System.String   | True     | False       | Display name of the filter.  |
| extensions | System.String[] | True     | False       | Extensions to use as filter. |

MonoDevelop Project Services
----------------------------

Provides support for loading and building MonoDevelop projects.

|-----------|-------------|
| Id        | Projects    |
| Namespace | MonoDevelop |
| Version   | 2.1.0       |

Extension Points:

-   Language ambiences
-   Project bindings
-   Solution file format handlers
-   Serializable classes
-   Serializable classes
-   Project service extensions
-   Language bindings
-   MSBuild item types
-   /MonoDevelop/ProjectModel/MD1SerializationMaps
-   Parsers
-   Formatters
-   Pretty Printers
-   Format definitions
-   Policy types
-   Named policy sets

#### Language ambiences

Language ambiences. Specified classes must implement IAmbience.

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Project bindings

Project bindings

Extension Nodes

**ProjectBinding**

A project binding. The specified class must implement MonoDevelop.Projects.IProjectBinding.

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Solution file format handlers

File format handlers for workspaces, solutions and projects

Extension Nodes

**FileFormat**

A file format handler. The specified class must implement MonoDevelop.Projects.IFileFormat.

|------|---------------|----------|-------------|-------------|
| Name | Type          | Required | Localizable | Description |
| name | System.String | False    | False       |            |

#### Serializable classes

Classes to be registered for serialization.

Extension Nodes

**DataType**

A type name.

|-------|---------------|----------|-------------|-------------|
| Name  | Type          | Required | Localizable | Description |
| class | System.String | True     | False       |            |

#### Serializable classes 2

Custom properties for projects and other types.

Extension Nodes

**ItemProperty**

A custom property. The type specified in the 'class' property is the type to which the property has to be added. Only types which implement IExtendedDataItem can be extended in this way.

|-----------|----------------|----------|-------------|-----------------------------------------------------------|
| Name      | Type           | Required | Localizable | Description                                               |
| name      | System.String  | True     | False       | Name of the property                                      |
| type      | System.String  | True     | False       | Full name of the property type                            |
| external  | System.Boolean | False    | False       | Set to true if the property is an extension               |
| skipEmpty | System.Boolean | False    | False       | Set to true if empty elements don't have to be serialized |

#### Project service extensions

Project service extensions. Specified classes must be a subclass of ProjectServiceExtension

Extension Nodes

**Class**

A subclass of ProjectServiceExtension.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Language bindings

Language bindings.

Extension Nodes

**LanguageBinding**

A language binding. The specified class must implement MonoDevelop.Projects.ILanguageBinding

|---------------------|-----------------|----------|-------------|---------------------------------------------------------------------------------|
| Name                | Type            | Required | Localizable | Description                                                                     |
| supportedextensions | System.String[] | False    | False       | File extensions supported by this binding (to be shown in the Open File dialog) |

#### MSBuild item types

Item types supported by MSBuild

Extension Nodes

**SolutionItem**

|------|---------------|----------|-------------|-------------|
| Name | Type          | Required | Localizable | Description |
| type | System.String | True     | False       |            |

**DotNetProject**

|-----------------|---------------|----------|-------------|-------------|
| Name            | Type          | Required | Localizable | Description |
| language        | System.String | True     | False       |            |
| resourceHandler | System.String | False    | False       |            |

**DotNetProjectSubtype**

|--------|---------------|----------|-------------|-------------|
| Name   | Type          | Required | Localizable | Description |
| guid   | System.String | False    | False       |            |
| type   | System.String | False    | False       |            |
| import | System.String | False    | False       |            |

#### /MonoDevelop/ProjectModel/MD1SerializationMaps

Serialization maps for the MonoDevelop 1.0 file format

Extension Nodes

**SerializationMap**

|----------|---------------|----------|-------------|-------------|
| Name     | Type          | Required | Localizable | Description |
| resource | System.String | False    | False       |            |

#### Parsers

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Formatters

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Pretty Printers

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Format definitions

Extension Nodes

**Definition**

A xml definition.

|----------|---------------|----------|-------------|-----------------------------------------------|
| Name     | Type          | Required | Localizable | Description                                   |
| resource | System.String | False    | False       | Name of the resource where the xml is stored. |
| file     | System.String | False    | False       | Name of the file where the xml is stored.     |

#### Policy types

Types for per-project policies language binding. These types must be serializable.

Extension Nodes

**PolicyType**

A type name.

|-------|---------------|----------|-------------|-------------|
| Name  | Type          | Required | Localizable | Description |
| class | System.String | True     | False       |            |

#### Named policy sets

Extension Nodes

**PolicySet**

A named set of defined policies

|--------|---------------|----------|-------------|-------------|
| Name   | Type          | Required | Localizable | Description |
| \_name | System.String | True     | False       |            |

MonoDevelop Runtime
-------------------

Provides the core services of the MonoDevelop platform

|-----------|-------------|
| Id        | Core        |
| Namespace | MonoDevelop |
| Version   | 2.1.0       |

Extension Points:

-   Execution modes
-   Execution handlers
-   File system extensions
-   Applications
-   /MonoDevelop/Core/SupportPackages
-   /MonoDevelop/Core/Runtimes

#### Execution modes

Execution modes such as default, debug, profiler, etc.

Extension Nodes

**Mode**

|--------|---------------|----------|-------------|-------------|
| Name   | Type          | Required | Localizable | Description |
| \_name | System.String | False    | False       |            |

**ModeSetType**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Execution handlers

Execution handlers for the default execution mode. Specified types must implement IExecutionHandler.

Extension Nodes

**ExecutionHandler**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### File system extensions

File system extensions which can provide specific behavior when handling files. Specified classes must implement MonoDevelop.Core.FileSystem.FileSystemExtension.

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Applications

MonoDevelop tools.

Extension Nodes

**Application**

|-------------|--------------------------------------------------------------------------------------------|----------|-------------|-------------------------|
| Name        | Type                                                                                       | Required | Localizable | Description             |
| class       | System.Type, mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089   | False    | False       | Name of the class       |
| description | System.String, mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Description of the tool |

#### /MonoDevelop/Core/SupportPackages

Extension Nodes

**Package**

|-----------------|-----------------------------|----------|-------------|-------------|
| Name            | Type                        | Required | Localizable | Description |
| name            | System.String               | True     | False       |            |
| version         | System.String               | True     | False       |            |
| targetFramework | System.String               | False    | False       |            |
| clrVersion      | MonoDevelop.Core.ClrVersion | False    | False       |            |
| gacRoot         | System.Boolean              | False    | False       |            |

#### /MonoDevelop/Core/Runtimes

Runtime factories.

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

MonoDevelop Source Editor
-------------------------

Provides a text editor for the MonoDevelop based on Mono.TextEditor

|-----------|---------------|
| Id        | SourceEditor2 |
| Namespace | MonoDevelop   |
| Version   | 2.0           |

Extension Points:

-   Editor context menu
-   Editor context menu
-   Custom edit actions
-   Formatters
-   Tooltip providers
-   Text editor syntax modes
-   Text editor styles

#### Editor context menu

Context menu for the editor.

Extension Nodes

#### Editor context menu 2

Context menu for the editor's icon margin.

Extension Nodes

#### Custom edit actions

Custom edit actions for the editor.

Extension Nodes

**EditAction**

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Formatters 2

Custom edit actions for the editor.

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Tooltip providers

Tooltip providers. Classes must implement ITooltipProvider.

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Text editor syntax modes

Syntax modes

Extension Nodes

**Templates**

A template for color and syntax shemes.

|----------|---------------|----------|-------------|----------------------------------------------------|
| Name     | Type          | Required | Localizable | Description                                        |
| resource | System.String | False    | False       | Name of the resource where the template is stored. |
| file     | System.String | False    | False       | Name of the file where the template is stored.     |

#### Text editor styles

Styles

Extension Nodes

**Templates**

A template for color and syntax shemes.

|----------|---------------|----------|-------------|----------------------------------------------------|
| Name     | Type          | Required | Localizable | Description                                        |
| resource | System.String | False    | False       | Name of the resource where the template is stored. |
| file     | System.String | False    | False       | Name of the file where the template is stored.     |

MonoDevelop Source Editor 2
---------------------------

Provides a text editor for the MonoDevelop based on Mono.TextEditor

|-----------|---------------|
| Id        | SourceEditor2 |
| Namespace | MonoDevelop   |
| Version   | 2.1.0         |

Extension Points:

-   Editor context menu
-   Editor context menu
-   Custom edit actions
-   Formatters
-   Tooltip providers
-   Text editor syntax modes
-   Text editor styles
-   Text editor custom syntax modes

#### Editor context menu 3

Context menu for the editor.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Editor context menu 4

Context menu for the editor's icon margin.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Custom edit actions 2

Custom edit actions for the editor.

Extension Nodes

**EditAction**

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### Formatters 3

Custom edit actions for the editor.

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Tooltip providers 2

Tooltip providers. Classes must implement ITooltipProvider.

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Text editor syntax modes 2

Syntax modes

Extension Nodes

**Templates**

A template for color and syntax shemes.

|----------|---------------|----------|-------------|----------------------------------------------------|
| Name     | Type          | Required | Localizable | Description                                        |
| resource | System.String | False    | False       | Name of the resource where the template is stored. |
| file     | System.String | False    | False       | Name of the file where the template is stored.     |

#### Text editor styles 2

Styles

Extension Nodes

**Templates**

A template for color and syntax shemes.

|----------|---------------|----------|-------------|----------------------------------------------------|
| Name     | Type          | Required | Localizable | Description                                        |
| resource | System.String | False    | False       | Name of the resource where the template is stored. |
| file     | System.String | False    | False       | Name of the file where the template is stored.     |

#### Text editor custom syntax modes

Styles

Extension Nodes

**SyntaxMode**

A syntax mode. The specified class must be a valid syntax mode.

|-----------|---------------|----------|-------------|--------------------------------|
| Name      | Type          | Required | Localizable | Description                    |
| mimeTypes | System.String | True     | False       | Mime types of the syntax mode. |

NUnit support
-------------

Integrates NUnit into the MonoDevelop IDE.

|-----------|-------------|
| Id        | NUnit       |
| Namespace | MonoDevelop |
| Version   | 2.1.0       |

Extension Points:

-   Test providers
-   /MonoDevelop/NUnit/ContextMenu/TestChart
-   /MonoDevelop/NUnit/ContextMenu/TestPad
-   /MonoDevelop/NUnit/ContextMenu/TestResultsPad
-   /MonoDevelop/NUnit/ContextMenu/ProjectPad/NUnitAssemblyGroup
-   /MonoDevelop/NUnit/ContextMenu/ProjectPad/TestAssembly
-   /MonoDevelop/NUnit/ContextMenu/ProjectPad/NUnitAssemblyGroupConfiguration
-   /MonoDevelop/NUnit/UnitTestOptions/GeneralOptions
-   /MonoDevelop/NUnit/UnitTestOptions/ConfigurationOptions

#### Test providers

Test providers. Specified classes must implement ITestProvider.

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### /MonoDevelop/NUnit/ContextMenu/TestChart

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### /MonoDevelop/NUnit/ContextMenu/TestPad

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### /MonoDevelop/NUnit/ContextMenu/TestResultsPad

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### /MonoDevelop/NUnit/ContextMenu/ProjectPad/NUnitAssemblyGroup

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### /MonoDevelop/NUnit/ContextMenu/ProjectPad/TestAssembly

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### /MonoDevelop/NUnit/ContextMenu/ProjectPad/NUnitAssemblyGroupConfiguration

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### /MonoDevelop/NUnit/UnitTestOptions/GeneralOptions

Extension Nodes

**Section**

|------|---------------|----------|-------------|-------------|
| Name | Type          | Required | Localizable | Description |
| icon | System.String | False    | False       |            |

#### /MonoDevelop/NUnit/UnitTestOptions/ConfigurationOptions

Extension Nodes

**Section**

|------|---------------|----------|-------------|-------------|
| Name | Type          | Required | Localizable | Description |
| icon | System.String | False    | False       |            |

Project Web References
----------------------

Provides support for adding and maintianing Web References for CSharp and VB projects.

|-----------|---------------|
| Id        | WebReferences |
| Namespace | MonoDevelop   |
| Version   | 2.1.0         |

Extension Points:

-   /MonoDevelop/WebReferences/ContextMenu/ProjectPad/WebReferenceFolder
-   /MonoDevelop/WebReferences/ContextMenu/ProjectPad/WebReferenceItem

#### /MonoDevelop/WebReferences/ContextMenu/ProjectPad/WebReferenceFolder

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### /MonoDevelop/WebReferences/ContextMenu/ProjectPad/WebReferenceItem

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

Vala Language Binding
---------------------

Vala Language binding

|-----------|-------------|
| Id        | ValaBinding |
| Namespace | MonoDevelop |
| Version   | 2.1.0       |

Extension Points:

-   Packages folder context menu
-   ProjectPackage context menu
-   /ValaBinding/Compilers

#### Packages folder context menu 2

Context menu for packages folder in the solution pad.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### ProjectPackage context menu 2

Context menu for a package in the solution pad.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

#### /ValaBinding/Compilers

Extension Nodes

**Type**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

Version Control Support
-----------------------

A MonoDevelop addin for using version control systems like Subversion

|-----------|----------------|
| Id        | VersionControl |
| Namespace | MonoDevelop    |
| Version   | 2.1.0          |

Extension Points:

-   Version control systems
-   Commit dialog extensions
-   Status View Commands

#### Version control systems

Version control systems

Extension Nodes

**Class**

The specified class must subclass VersionControlSystem.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Commit dialog extensions

Commit dialog extensions.

Extension Nodes

**Class**

The specified class must subclass CommitDialogExtension.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Status View Commands

Commands to be shown in the context menu of the status view. The id must match an existing code. The provided type must be a subclass of VersionControlCommandHandler.

Extension Nodes

**CommandItem**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

Visual Designer Support
-----------------------

Supporting services and pads for visual design tools.

|-----------|-----------------|
| Id        | DesignerSupport |
| Namespace | MonoDevelop     |
| Version   | 2.1.0           |

Extension Points:

-   Toolbox item providers
-   Toolbox loaders
-   Providers for the property grid
-   Toolbox item context menu

#### Toolbox item providers

Provides items to the toolbox. Must implement MonoDevelop.DesignerSupport.Toolbox.IToolboxDefaultProvider and/or IToolboxDynamicProvider

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Toolbox loaders

Used to load ItemToolboxNodes into the ToolboxMust implement MonoDevelop.DesignerSupport.Toolbox.IToolboxItemLoader

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Providers for the property grid

Extension Nodes

**Class**

Specifies a class that will be used to create an extension object.

|-------|---------------------------------------------------------------------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------|
| Name  | Type                                                                                        | Required | Localizable | Description                                                                                         |
| class | System.Type, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 | False    | False       | Name of the class. If a value is not provided, the class name will be taken from the 'id' attribute |

#### Toolbox item context menu

Context menu for toolbox items.

Extension Nodes

**CommandItem**

A command menu or toolbar item. The id of the element must match the id of a registered command.

|-----------------|----------------|----------|-------------|-----------------------|
| Name            | Type           | Required | Localizable | Description           |
| \_label         | System.String  | False    | False       | Label                 |
| disabledVisible | System.Boolean | False    | False       | Visible when disabled |

**SeparatorItem**

A separator menu or toolbar item

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

**ItemSet**

A submenu

|----------|----------------|----------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | Type           | Required | Localizable | Description                                                                                                                                                                           |
| \_label  | System.String  | False    | False       | Label of the submenu                                                                                                                                                                  |
| icon     | System.String  | False    | False       | Icon of the submenu. The provided value must be a registered stock icon. A resource icon can also be specified using 'res:' as prefix for the name, for example: 'res:customIcon.png' |
| autohide | System.Boolean | False    | False       | Whether the submenu should be hidden when it contains no items.                                                                                                                       |

**LinkItem**

A menu or toolbar item that opens an URL when activated

|---------|---------------|----------|-------------|--------------------|
| Name    | Type          | Required | Localizable | Description        |
| \_label | System.String | False    | False       | Label of the item. |
| link    | System.String | False    | False       | URL to open.       |

**LocalCommandItem**

Allows the definition of a complete command item inside a menu or toolbar description

|------|------|----------|-------------|-------------|
| Name | Type | Required | Localizable | Description |

XML Editor
----------

XML Editor

|-----------|-------------|
| Id        | XmlEditor   |
| Namespace | MonoDevelop |
| Version   | 2.1.0       |

Extension Points:

-   /MonoDevelop/XmlEditor/XmlFileExtensions

#### /MonoDevelop/XmlEditor/XmlFileExtensions

Extension Nodes

**XmlFileExtension**

|-----------|---------------|----------|-------------|-------------|
| Name      | Type          | Required | Localizable | Description |
| extension | System.String | True     | False       |            |
