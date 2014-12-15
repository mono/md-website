---
title: Linq to Sql
redirect_from:
  - /Documentation/Linq/
---

Sql Metal Integration
---------------------

*Currently only available on svn version  with mono 2.6.x*

MonoDevelop [Database Addin](/documentation/database-addin/) implements SqlMetal integration. The responsive addin for this integration is MonoDevelop.Database.CodeGenerator:

![AddinManager.png](/images/271-AddinManager.png)

 How to Use it
--------------

This addin insert 2 **Tools menu** at:

-   Tools - Database - **Generate Linq Class**

![Project Tools Menu.png](/images/273-Project%20Tools%20Menu.png)

-   Right click on a Project or a folder - Tools Menu - **Generate Linq Class**

![Tools Menu.png](/images/272-Tools%20Menu.png)

Creating a new Linq to SQL Class
--------------------------------

Clicking on any of the above detailed menus you'll see a dialog like the following:

![Generate Linq Class.png](/images/276-Generate%20Linq%20Class.png)

In this dialog you will have to select the *Database Connection*.

> *This connection could be added in this dialog by clicking **New** or you can **Edit** the selected connection.*

The output options are the generated output (Code or Dbml file), target language, case style,anfilename.

The target project has to be selected and if it is needed the folder of the target project to. The namespace is the class namespace of the generated file.

After filling all the required information, you must press OK and the file will be generated and added to the project.
