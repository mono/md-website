---
title: Architecture Overview
redirect_from:
  - /Developers/Articles/Architecture_Overview/
  - /Architecture_Overview/
  - /Articles/Architecture_Overview/
---

### Introduction

This document is an overview of the new assembly organization of MonoDevelop. The goal is to provide a general idea of what is each module for, and the extension points it provides. This is not a reference document. Detailed technical information will be provided in another document.

### Architecture

MonoDevelop is not just an IDE, it's an extensible platform upon which any kind of development tool can be built (in fact, any kind of application).

The platform has a modular design, so you can freely choose the level of features that better fits your needs, and avoid unneeded dependencies. This is a general view of what MonoDevelop provides:

![Image:Md-architecture.png](/images/404.png)

There are basically three layers:

-   The **Core** layer provides basic services for applications (not specific to development tools).
-   The **Projects** layer implements the project object model, which development tools can use to organize files. Using this API it is possible to develop applications that create, open, change, build and do whatever you need to do with MonoDevelop projects.
-   The top **IDE** layer is an application that puts together all the previous services to offer a powerful and extensible IDE for managing development projects.

In the Core and Projects layers, GUI dependent functionality is implemented in separate assemblies.

#### MonoDevelop.Core

This assembly implements the core runtime of MonoDevelop, which include:

-   Add-in engine. It has two parts: the runtime engine (manages loading of add-ins and its extensions), and the add-in management API (manages installation of add-ins).
-   Process management: methods for creating and controlling processes, and for creating out-of-process objects.
-   Configuration properties: a service for storing configuration information.
-   Progress monitoring: A set of classes and interfaces that implement a pattern for monitoring the progress of operations.

The main extension points are:

-   Applications: add-ins can register new applications which can be executed from the command line using the mdtool command.
-   Services: Services are singleton objects which are created and initialized under demand.
-   Execution Handlers: these handlers are used by the project layer to make it possible to execute projects using different runtimes (mono, mint or whatever), and different contexts (debugger, profiler, etc).

#### MonoDevelop.Core.Gui

This assembly implements the following services:

-   Resources: It can be used to get fonts and stock icons.
-   MessageService: Common methods for displaying error dialogs, warning dialogs, informative dialogs and yes/no question dialogs.
-   DispatchService: Provides methods which simplify the thread management in MonoDevelop (see [Thread Management](/developers/articles/thread-management/ "Developers/Articles/Thread_Management")).
-   Common dialogs to build wizards and options panels.
-   Some basic progress monitors.

The only extension point of this assembly can be used by add-ins to define new stock icons.

#### MonoDevelop.Projects

This assembly implements the project object model of MonoDevelop: the Project class, ProjectFile, Combine, CombineEntry etc. It provides the following functionalities:

-   Loading/Saving projects.
-   Building projects.
-   Executing projects.
-   Parse source code files and assemblies, and query class information.

It also provides several extension points:

-   Project Types: project types can define specific build rules or particular file organizations.
-   File Formats: a file format extension can implement a custom reader and writer for projects.
-   Language Bindings: can be used to add support for additional .NET languages

#### MonoDevelop.Projects.Gui

This assembly provides:

-   Some dialogs for displaying project information, such as project or combine options.
-   The IconService, which can be used to get icons that represent projects, classes, methods, etc.
-   The code completion engine.

Add-ins can extend the project and combine options dialog by adding new custom options panels.

#### MonoDevelop.Ide

This assembly implements the MonoDevelop IDE, which is based on all services described so far. It provides a root object (IdeApp) which gives access to all IDE features:

-   The workbench: Documents, pads, layouts, status bar, progress monitors.
-   Project operations: this is a GUI front-end to everything you can do with a project: loading, saving, building, running, showing options, etc.
-   The Command Service: it can be used to define new commands, create menus, context menus and toolbars (see [The Command System](/developers/articles/the-command-system/ "Developers/Articles/The_Command_System")).

The IDE provides many extension points. Here are some of them:

-   Pads: dockable pads.
-   Views: file content viewers.
-   Commands: add-in can define new commands and integrate them in menus and toolbars.
-   Tree Node Builders: can be used to extend the solution pad, the class pad and any other TreeViewPad based pad. Node builders can create or hide nodes, add overlay icons, add menu options, etc.
-   Menus and Toolbars: add-ins can add new commands to existing menus and toolbars, or create new menus or toolbars.
-   Preferences panels: the preferences dialog can be extended with new options panels.
