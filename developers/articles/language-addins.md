---
title: Language Addins
redirect_from:
  - /Developers/Articles/Language_Addins/
---

There are a number of extension points that need to be implemented when creating a Language Addin for MonoDevelop.

#### 1. Stub out the addin

Create a project with an addin manifest defining the ID, dependencies, etc.

#### 2. File type definitions

Define mimetypes for new file types using /MonoDevelop/Core/MimeTypes

Register any icons you need using /MonoDevelop/Core/StockIcons

Define file filters for "open" dialog using /MonoDevelop/Ide/FileFilters

#### 3. IDotNetLanguageBinding for project and compilation support

Register project extension, MSBuild imports and type GUID using /MonoDevelop/ProjectModel/MSBuildItemTypes

Implement IDotNetLanguageBinding and register at /MonoDevelop/ProjectModel/LanguageBindings, and implement the IDotNetLanguageBinding. Not all the members need to be implemented at this point.

Register parameters/configuration settings classes used by your language binding at /MonoDevelop/ProjectModel/SerializableClasses

#### 4. File and Project Templates

Write file and project templates and register at /MonoDevelop/Ide/FileTemplates /MonoDevelop/Ide/ProjectTemplates

**At this point you should be able to create/save/load/compile/run projects for your language.**

#### 5. Options Panels

Implement options panels for editing your language-specific settings classes and register at /MonoDevelop/ProjectModel/Gui/ItemOptionPanels

#### 6) Syntax Highlighting

Write a syntax definition for your source files' mimetypes and register at /MonoDevelop/SourceEditor2/SyntaxModes

#### 7) Parser

A parser provides type information to the MonoDevelop type system, automatically enabling the class pad, the document outline, the class member breadcrumbs, and the go-to-type commands. It's used by code completion fby projects that reference the current project. It also provides code folding and error undelrining information*.*

Implement the parser and register at /MonoDevelop/ProjectModel/DomParser

#### 8) Ambience

Ambiences format type information shown in info tooltips, the document outline, and so on.

Implement an ambience class and register at /MonoDevelop/ProjectModel/Ambiences

#### 9) Code Completion

Implement a CompletionTextEditorExtension subclass and register at /MonoDevelop/Ide/TextEditorExtensions.

There are further extension points that can be implemented to add more features and integrate further -

-   code formatter
-   references finder
-   refactorer implementation
-   specific refactorings
-   expression finder 
-   debugger evaluator
-   smart indentation
-   ASP.NET inline code completion
