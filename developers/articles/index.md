---
title: Articles
redirect_from:
  - /Developers/Articles/
  - /Articles/
---

The following articles have been written by members of the MonoDevelop comunity. New articles are greatly appreciated!

{% capture docNote %}
Our website is open source on [GitHub](https://github.com/mono/md-website). If you find errors or think a page could be improved, just click the "Edit page on GitHub" link beneath the page title. See [contributing to the website](https://github.com/mono/md-website#contributing-to-the-website) for more details.
{% endcapture %}
{% include note.html type='info' message=docNote %}

Building MonoDevelop
--------------------

[Development: Getting Started](/developers/articles/development-getting-started/)<br/>
It's relatively easy to get started working on MonoDevelop, but this article aims to make it easier to get off the ground.

[Environment Variables](/developers/articles/environment-variables/)<br/>
An in-depth explanation of all environment variables that can be altered in order to simplify the development of MonoDevelop. 

[Building MonoDevelop from source](/developers/building-monodevelop/)<br/>
Basic steps for building MonoDevelop. 

Writing Add-ins
---------------

[Creating a Simple Add-in](/developers/articles/creating-a-simple-add-in/)<br/>
This walkthrough will guide you through the process of creating a simple add-in, introducing the fundamentals of the add-in system and some of MonoDevelop's core APIs.

[Walk through: Extending the Project Pad](/developers/articles/extending-the-project-pad/)<br/>
This tutorial explains how to implement an addin that extends the project pad. The idea for this extension is to be able to show the classes that are implemented in a file as child nodes of that file in the project pad.

[How to extend the Project Model](/developers/articles/how-to-extend-the-project-model/)<br/>
This article explains how to extend the project model to support new types of projects or to add additional information to existing project types.

[Syntax mode definition](/developers/articles/syntax-mode-definition/)<br/>
This article explains how to create a syntax hilighting mode for a new file type.

[Editor color sheme definition](/developers/articles/color-sheme-definition/)<br/>
This article explains how to create a syntax hilighting mode for a new file type.

[Publishing an Add-in](/developers/articles/publishing-an-addin/)<br/>
This article explains how to publish an add-in to make it available to MonoDevelop users.

[Introduction to Mono.Addins](http://www.mono-project.com/Introduction_to_Mono.Addins)<br/>
This article explains the library basics and some examples. Mono.Addins is the add-in engine used by MonoDevelop.

[Mono.Addins Reference Manual](http://www.mono-project.com/Mono.Addins_Reference_Manual)<br/>
An in-depth explanation of all Mono.Addins features. Mono.Addins is the add-in engine used by MonoDevelop.

MonoDevelop API
---------------

[API Overview](/developers/articles/api-overview/)<br/>
An overview of the MonoDevelop API, explaining where to find the most important services and how to use them.

[Using the Data Serializer](/developers/articles/using-the-data-serializer/)<br/>
A programming guide of the generic data serializer provided by the MonoDevelop API.

[The String Parser Service](/developers/articles/the-string-parser-service/)<br/>
A programming guide for the String Parser Service.

[Logging](/developers/articles/logging/)<br/>
MonoDevelop's logging service provides a configurable way for developers to log debug and error messages reported by Addins.

MonoDevelop Design and Architecure
----------------------------------

[Architecture Overview](/developers/articles/architecture-overview/)<br/>
This document is an overview of the new assembly organization of MonoDevelop.

[Add-in Extension Tree Reference](/developers/articles/extension-tree-reference/)<br/>
This document shows the complete extension tree available to add-in developers.

[Error and Exception Handling](/developers/articles/error-and-exception-handling/)<br/>
This document explains how to handle errors and how to show them to the user.

[The Command System](/developers/articles/the-command-system/)<br/>
This article explains how MonoDevelop's Command System works, and how can you take advantage of it for writing your add-ins.

[Thread Management in MonoDevelop](/developers/articles/thread-management/)<br/>
This article explains the some basic rules that every addin developer should follow regarding thread management in MonoDevelop.

[Translations](/developers/articles/translations/)<br/>
MonoDevelop has chosen to use gettext instead of resources for translating into other languages. This allows us to take advantage of GNOME translators' familiarity with gettext.

[Refactoring](/developers/articles/refactoring/)<br/>
This article explains the MonoDevelop refactoring infrastructure. It helps writing own refactorings.

[The Toolbox](/developers/articles/toolbox/)<br/>
MonoDevelop has some infrastructure for supporting visual designers, such as the ASP.NET and Gtk# designers. Some of this — the property grid and toolbox — is now being used elsewhere in MonoDevelop.

Obsolete Articles
-----------------

In the [Obsolete Articles](/archived/developers/articles/obsolete-articles/) section you'll find some outdated articles which are kept just as a reference.
