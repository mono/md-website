---
title: Database Addin
redirect_from:
  - /Documentation/Database_Addin/
---

The addin database consists of the following Addins:<br/>
 **MonoDevelop.Database.ConnectionManager.** This addin is responsible for connectivity, database explorer (Connection Manager Pad) and all nodes in a database (tables, procedures, functions, etc.).

**MonoDevelop.Database.Components.** Common dialogs and widgets for the database addin.

**MonoDevelop.Database.Designer.** Common Providers Operations Dialogs/Widgets: (Create Table, procedure, and others).

**MonoDevelop.Database.Query.** Display Binding, Result view, Sql Query Text Editor.

**MonoDevelop.Database.Sql.** This addin is the responsible for: Common schema, Query Services, Sql Factories, Connection Context Services, Abstract Connection Pool.

**Provider specific Addins:** MonoDevelop.Database.Sql.\* (MySql - Npgsql - Sqlite - Sql Server . Firebird - Oracle - Sybase - ODBC)

Providers
---------

The available providers are:

-   MySql: MySql provider use a bundled Mysql.Data assembly [[1]](http://dev.mysql.com/usingmysql/dotnet "http://dev.mysql.com/usingmysql/dotnet")<span style="font-size: xx-small"> </span>
-   Npgsql.
-   Sqlite.
-   Sql Server.
-   Firebird: need a mantainer.
-   Oracle: need a mantainer.
-   Sybase: need a mantainer.
-   Odbc: need a mantainer.

Futures
-------

### Connect to a database

### Create a database

### Drop Database

### Query Database

### Create / Alter / Drop Table

### Create/ Alter / Drop Procedures

### Query to Target

### Working with results

### Other futures

Developers
----------

### Implementing a Provider 

 In order to implement a new provider you have to implement the following classes

**AbstractConnectionProvider**: <span style="font-family: Verdana"><span><span style="font-size: xx-small">[2]</span></span></span> This class is the responsible of connection creation and check if a connection already exists.

**IDbFactory**: <span style="font-size: xx-small"><span style="font-family: Verdana">[3]</span></span> This is the main provider class, it expose all the objects needed for manage a Provider: Dialect, Gui Provider, Connection Provider, the connection pool creation and schema provider creation.

**IGuiProvider**: <span style="font-size: xx-small"><span style="font-family: Verdana">[4]</span></span> Expose all the GUI operations. Example: If a new addin provides Create Database operation, the method *IGuiProvider.ShowCreateDatabaseDialog  (IDbFactory)* is called. In this method it should be implemented the basic operations of creating a new Database, the Gui Dialog/Window.

**AbstractPooledDbConnection:** <span style="font-family: Verdana"><span style="font-size: xx-small">[5]</span></span> This represent a Pooled db connection (becareful, this doesn't represent the pooling system, it only represent a connection. The pooling system should implement IConnectionPool or use DefaultConnectionPool class). All the database operations will be here: Execute a DataReader, Execute a DataTable, and others.

**AbstractEditSchemaProvider**: <span style="font-size: xx-small">[6] </span>It expose the database operations as Creates, Drops, Alters and others database operations. This class, with IGuiProvider implements all the databases operations, the second implements the Gui part, and this implements the operations.

### Optional Implementations

**IDbLinq: **<span style="font-size: xx-small">[7]</span>** **This represent the Linq generation interface, the connection between the provider and a generator (i.e.: sqlmetal).

**AbstractSqlDialect**: <span style="font-size: xx-small">[8]</span> Expose dialect or provider specific techniques of generating Sql language. Currently isn't really in use.

### Addin Manifest

``` xml
<Addin id="Database.Sql.ProviderName" namespace="MonoDevelop" name="Provider for MonoDevelop addin Sql" author="Your Name" copyright="MIT X11" url="http://www.monodevelop.com" description="Database Provider Module" category="Database" version="2.2">

  <Runtime>
    <!-- Your dll -->
    <Import assembly="MonoDevelop.Database.Sql.Provider.dll"/>
  </Runtime>

  <Localizer type="Gettext" catalog="monodevelop-database"/>

  <!-- Your Dependencies-->
  <Dependencies>
    <Addin id="Core" version="2.2"/>
    <Addin id="Core.Gui" version="2.2"/>
    <Addin id="Ide" version="2.2"/>
    <Addin id="Database.Sql" version="2.2"/>
    <Addin id="Database.Components" version="2.2"/>
    <Addin id="Database.Designer" version="2.2"/>
  </Dependencies>

  <!-- The implemented Factory-->
  <Extension path = "/MonoDevelop/Database/Sql">
    <DatabaseFactory id = "Provider" class = "MonoDevelop.Database.Sql.Provider.ProviderDbFactory" />
  </Extension>

  <!-- Syntax mode file (if it has)-->
  <Extension path = "/MonoDevelop/SourceEditor2/SyntaxModes">
    <Templates resource="ProviderSyntaxMode.xml" />
  </Extension>
</Addin>
```

References
----------

[1] <http://dev.mysql.com/usingmysql/dotnet/><br/>
[2] <http://anonsvn.mono-project.com/viewvc/trunk/monodevelop/extras/MonoDevelop.Database/MonoDevelop.Database.Sql/Providers/AbstractConnectionProvider.cs><br/>
[3] <http://anonsvn.mono-project.com/viewvc/trunk/monodevelop/extras/MonoDevelop.Database/MonoDevelop.Database.Sql/IDbFactory.cs><br/>
[4] <http://anonsvn.mono-project.com/viewvc/trunk/monodevelop/extras/MonoDevelop.Database/MonoDevelop.Database.Sql/Providers/IGuiProvider.cs><br/>
[5] <http://anonsvn.mono-project.com/viewvc/trunk/monodevelop/extras/MonoDevelop.Database/MonoDevelop.Database.Sql/ConnectionPool/AbstractPooledDbConnection.cs><br/>
[6] <http://anonsvn.mono-project.com/viewvc/trunk/monodevelop/extras/MonoDevelop.Database/MonoDevelop.Database.Sql/Providers/AbstractSchemaProvider.cs><br/>
[7] <http://anonsvn.mono-project.com/viewvc/trunk/monodevelop/extras/MonoDevelop.Database/MonoDevelop.Database.Sql/IDbLinq.cs><br/>
[8] <http://anonsvn.mono-project.com/viewvc/trunk/monodevelop/extras/MonoDevelop.Database/MonoDevelop.Database.Sql/Dialect/ISqlDialect.cs>
