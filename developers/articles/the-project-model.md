---
title: The Project Model
---

## Introduction

MonoDevelop 6.0 introduces a new Project Model. The Project Model is a model of classes that implement the functionality of loading, saving, building and doing all kind of operations on projects.

The old project model was designed with several layers of abstraction, so that the same model could be used to support different file formats for the same kind of project. This allowed, for example, supporting a native format (.mdp) while migrating to MSBuild. The drawback of this approach is that the abstraction layer required to support this model makes it hard to introduce format specific features.

The new project model has less abstraction layers and is more focused to MSBuild. From the outside, the project model API is very similar. The class hierarchy is more simple in some cases, and some methods change a bit, but in general it is the same. However, on the inside there are many changes. The file format abstraction is gone, and the extension model has been completely revamped. Also, the new API takes advantage of async.

## Class hierarchy

The following UML diagram is a simplified view of the project model:

<img src="/developers/articles/the-project-model-images/model.png" width="500" alt="UML diagram of the project model"/>

This model is not very different from the old model, although the semantics are a bit different in some cases.

The most important classes are:

* **WorkspaceObject**: base class for most of project model objects. It implements basic infrastructure for extensibility, threading, file management and other functionality required for most classes.
* **WorkspaceItem**: this is the base class for any item that can be loaded into the IDE. The most important subclasses are Workspace and Solution. This class is the same we had in the old model.
* **Workspace**: Workspaces can be used to group together solutions and other workspace items. This class is also the same we had in the old model.
* **Solution**: This class represents a Visual Studio solution (using the sln format). It contains a set of solution items (usually projects). Each solution item has an ID and a type, identified using GUIDs.
* **SolutionItem**: An item that can belong to a solution. Solution items are stored in independent files. At this level, the file format is undefined, serialization is implemented by subclasses.
* **Project**: An MSBuild-based project. The external API has not changed much. The Project class is an "interpretation" of the underlying MSBuild project. It converts well known MSBuild constructs into an model of files, references and configurations which can be queried and managed more easily than directly on MSBuild files. In any case, direct access to the MSBuild model is also provided.
* **DotNetProject**: a type of project specialized in building and executing .NET assemblies. It extends the Project class by adding a .NET assembly reference model, .NET framework handling and everything necessary for handling assemblies.

## Extension model

There are two ways of extending the project model: by subclassing an existing class or by creating an object extension.

**Subclassing** allows creating new classes based on existing project model classes. For example, to add support for a new language you would subclass the `Project` class and implement the methods for building and executing the project.

On the other hand, **object extensions** allow overriding the behavior of an existing project model class. Extensions can perform custom operations that can be executed before, after or in replacement of a project model object operation. Any subclass of `WorkspaceObject` can be extended using object extensions. For example, iOS support is implemented with an extension object that implements custom build and execution logic for the existing C# project class.

Project **flavors** are a special case of object extensions. A project flavor is an extension for objects of type `Project`, and it is identified by a GUID.

By subclassing the project model and creating object extensions it is possible to extend the project model in many different ways, such as adding support for new languages, new frameworks or new project types.

### Creating new Solution Item types

Support for new types of projects can be added by subclassing `SolutionItem` or any of its subclasses:

* Support for new .NET languages can be easily added by creating a `DotNetProject` subclass.
* Support for other non-.NET but MSBuild based languages can be implemented with a `Project` subclass.
* If you are implementing support for any project type or language that is
  not based on MSBuild, you can subclass `SolutionItem`.

<img src="/developers/articles/the-project-model-images/Subclassing.png" width="700" alt="Subclassing SolutionItem"/>

All Project Model classes have virtual methods that can be overriden to provide custom behavior.

Once a class is implemented, it needs to be registered. New project types must be registered in the `MonoDevelop/ProjectModel/MSBuildItemTypes` extension point, and there are 3 types of extensions you can register:

* **DotNetProjectType**: use this extension node if the new project is a
  `DotNetProject` subclass.
* **ProjectType**: if the new project is a `Project` subclass.
* **SolutionItemType**: to be used in any other case.

#### Registering a SolutionItem

The SolutionItemType extension node can be used to register any kind of solution item that is not based on MSBuild. For example:

``` xml
<Extension path="/MonoDevelop/ProjectModel/MSBuildItemTypes">
    <SolutionItemType
        extension="myproj"
        guid="{D954291E-2A0B-460D-934E-DC6B0785DB48}"
        alias="CustomItem"
        type="MyAddin.CustomItem" />
</Extension>
```

The available attributes are:

* **extension**: extension of the file to be used for this solution item type.
* **guid**: GUID of the new solution item type.
* **alias**: friendly ID to be used to reference this type (it can be used
  instead of the GUID).
* **type**: class that implements this solution type (must be a
  SolutionItem subclass).

#### Registering a Project

The ProjectType extension node can be used to register any `Project` subclass. For example:

``` xml
<Extension path="/MonoDevelop/ProjectModel/MSBuildItemTypes">
    <ProjectType
        extension="shproj"
        guid="{D954291E-2A0B-460D-934E-DC6B0785DB48}"
        alias="SharedAssetsProject"
        type="MonoDevelop.Projects.SharedAssetsProjects.SharedAssetsProject" />
</Extension>
```

The node takes the same attributes as the SolutionItemType extension node, with one addition:

* **msbuildSupport**: It can be one of the following:
  * NotSupported: Even though the project uses the MSBuild file format, it doesn't use MSBuild
    for building the project.
  * Supported (default): The project can be built using MSBuild or the internal build engine.
  * Required: The project is always built using MSBuild.

#### Registering a DotNetProject subclass

The DotNetProjectType extension node can be used to register a class that implements support for a new language. For example:

``` xml
<Extension path="/MonoDevelop/ProjectModel/MSBuildItemTypes">
    <DotNetProjectType
        language="C#"
        extension="shproj"
        guid="{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}"
        type="MonoDevelop.CSharp.Project.CSharpProject" />
</Extension>
```

The node takes the same attributes as the SolutionItemType extension node, with one change:

* **language**: name of the language. It is used as an identifier of the project type.
  Its also registered as an alias of the project type GUID, so this
  name can be used in place of the GUID.

#### Custom SolutionItem instantiation with SolutionItemFactory

When loading a project, the project service checks the file extension to find the type that has to be instantiated for the file. That's why the extension is provided when registering the item type. However, in cases when the file extension is not enough to determine the item type, it is possible to specify a `SolutionItemFactory`, which can implement some logic that checks the project file and creates the correct instance.

The `SolutionItemFactory` type is specified in the **type** attribute, for example:

``` xml
<Extension path="/MonoDevelop/ProjectModel/MSBuildItemTypes">
    <SolutionItemType
        extension="myproj"
        guid="{D954291E-2A0B-460D-934E-DC6B0785DB48}"
        alias="CustomItem"
        type="MyAddin.CustomItemFactory" />
</Extension>
```

The `CustomItemFactory` type would be implemented like this:

``` csharp
public class CustomItemFactory: SolutionItemFactory
{
    public override async Task<SolutionItem> CreateItem (string fileName, string typeGuid)
    {
      if (...)
        return new CustomItemFoo();
      else
        return new CustomItemBar();
    }
}
```

### Using extensions to customize object behavior

Every instance of `WorkspaceObject` or any of its subclasses has an **extension chain**. An extension chain is a collection of extension objects that can override some functionality of the project model object they are bound to. `WorkspaceObjectExtension` is the base class for all extensions, but there are specialized extension classes that allow overriding the behavior of some specific project model types. This diagram shows the hierarchy of extension classes:

<img src="/developers/articles/the-project-model-images/Extensions.png" width="500" alt="Extension chain"/>

Some information about those classes:

* **WorkspaceObjectExtension**: it is the base class for all extensions. The most important method that can be override in `GetService()` which returns an instance of the requested service class.
* **SolutionItemExtension**: allows overriding the behavior of a SolutionItem. It can participate on item serialization, configuration management, and build and execution operations.

Extensions can perform custom operations that can be executed before, after or in replacement of a project model object operation. For example, the `Project` class has a `RunTarget()` method, and a corresponding overridable `OnRunTarget()` method. The `ProjectExtension` class also has a corresponding `OnRunTarget()` method. An extension can decide to override that method and implement some custom behavior:

``` csharp
protected override async Task<TargetEvaluationResult> OnRunTarget (ProgressMonitor monitor, string target,
        ConfigurationSelector configuration, TargetEvaluationContext context)
{
  // Custom code before running target

  // The base method will execute the default behavior
  va result = await base.OnRunTarget (monitor, target, configuration, context);

  // Custom code after running target

  return result;
}
```

The following diagram shows how method calls flow through the extension chain:

<img src="/developers/articles/the-project-model-images/flow.png" width="700" alt="Method call flow through extension chain"/>

Methods overriden in extensions are called first, so they have the first chance of customizing the behavior. The default implementation of the virtual method will invoke the override in next extension, and finally on the model object class (`Project` in this example), which can also be overriden in subclasses (such as `DotNetProject` in this example).

Extension chains are specific to the project model object they are bound to, so for example a project extension can load and store project specific information (in the old model, the project service extension chain was shared among all projects).

#### Registering Extension types

Extension types must be registered in the `/MonoDevelop/ProjectModel/ProjectModelExtensions` extension point, using the **Class** node. For example:

``` xml
<Extension path="/MonoDevelop/ProjectModel/ProjectModelExtensions">
    <Class class="MonoDevelop.NUnit.NUnitProjectServiceExtension" />
</Extension>
```

Extensions that are project flavors must be registered using the **ProjectFlavor** node:

``` xml
<Extension path="/MonoDevelop/ProjectModel/ProjectModelExtensions">
    <ProjectFlavor
        id="MonoDevelop.AspNet.Projects.AspNetAppProjectFlavor"
        guid="{349C5851-65DF-11DA-9384-00065B846F21}"
        type="MonoDevelop.AspNet.Projects.AspNetAppProjectFlavor"
        alias="AspNetApp" />
</Extension>
```

The following attributes must be supplied when registering a project flavor:

* **guid**: GUID of the project flavor.
* **alias**: friendly ID to be used to reference this flavor (it can be used
  instead of the GUID).
* **type**: class that implements the flavor (must be a
  `ProjectExtension` subclass).

#### Migration Handlers

When registering a flavor type it is possible to specify a Migration Handler. This is useful for example when a project flavor is being made obsolete in favor of a new flavor.

``` xml
<Extension path="/MonoDevelop/ProjectModel/ProjectModelExtensions">
    <ProjectFlavor
        id="MonoDevelop.AspNet.Projects.OldAspNetAppProjectFlavor"
        guid="{118C5851-FEA1-8810-C790-00065B846AAA}"
        type="MonoDevelop.AspNet.Projects.OldAspNetAppProjectFlavor"
        migrationHandler="MonoDevelop.AspNet.Projects.MigrationHandler"
        migrationRequired="true" />
</Extension>
```

The following attributes can be used to specify a migration handler:

* **migrationHandler**: name of a subclass of `ProjectMigrationHandler`. This class has a `Migrate()`
  method that implements the migration.
* **migrationRequired**: if true, the migration is mandatory, so project load will fail
  if the user decides to not migrate when prompted.

## Serialization

In general, Project Model objects implement their own serialization. For example, the `SolutionItem` class has `OnLoad()` and `OnSave()` methods that are invoked to load and store instances. Subclasses of `SolutionItem` such as `Project` have a default serialization infrastructure, and provide more specialized serialization methods.

Object extensions can also participate on serialization. All serialization methods that can be overriden in `SolutionItem` and its subclasses are also overridable in `SolutionItemExtension` and subclasses.

### Solution Item Serialization

Solution items are loaded following this sequence:

1. The Project Service determines the type of the object that is being loaded. This is done using the information provided when registering the type: the file extension and the type GUID. If the object file is referenced in a solution file, the solution has the GUID of the type. If the file is not being loaded as part of a solution, the extension name is used.
2. Once the type is discovered, an instance of the type is created. The file path is assigned to the object.
3. `OnBeginLoad()` is invoked on the object, to signal that the object is going to be loaded.
4. `OnLoad()` is invoked. This method is in charge of loading the contents of the file into the object.
5. `OnEndLoad()` is invoked when the loading process is finished. **NOTICE**: if the item is being loaded as part of a solution, `OnEndLoad()` will be invoked once **all** items of the solution have been loaded.

The process of saving a solution item is more simple: just an invocation to the `OnSave()` method.

### MSBuild Project Serialization

The `Project` has its own implementation of `OnLoad()` and `OnSave()` that does everything required to load and save projects from/to MSBuild project files. Subclasses of `Project` and project extensions can further customize the serialization behavior.

The serialization process relies heavily on the `MSBuildProject` class. `MSBuildProject` can load, save and evaluate (to some extent) MSBuild project files. MSBuildProject contains all entities of an MSBuild project: property groups and properties, item groups and items, imports, targets, etc.

The `OnLoad()` implementation of the `Project` class loads the project information following this sequence:

1. It loads the project file using an `MSBuildProject` instance. The project file is parsed and evaluated following the MSBuild rules.
2. `OnReadProjectHeader()` is invoked. This method is in charge of loading the core properties of the project, which need to be resolved before loading all the other content.
3. `OnReadProject()` is invoked, which loads the content of the project. This is done by invoking some other methods:
    * `OnCreateProjectItem()` is invoked for each MSBuild item. This method returns an instance of `ProjectItem` (or a subclass).
    * `ProjectItem.Read()` is invoked on each project item. This method loads the data of the item into the `ProjectItem` instance. After that, the item is added to the list of items of the project.
    * `OnCreateConfiguration()` is invoked for each MSBuild property group that is identified as the definition of a configuration. This method returns an instance of ProjectConfiguration (or a subclass).
    * `OnReadConfiguration()` is invoked for each configuration. The default implementation invokes the `ProjectConfiguration.Read()` method.

The `OnSave()` implementation of the `Project` class loads the project information following this sequence:

1. `OnWriteProjectHeader()` is invoked. This method is in charge of storing the core properties of the project into the main property group of the MSBuildProject instance.
2. `OnWriteProject()` is invoked. This method stores the content of the project into the MSBuildProject instance, following this sequence:
    * `OnWriteConfiguration()` is invoked for each project configuration. This method stores the configuration data into the corresponding MSBuild property group. The default implementation invokes `ProjectConfiguration.Write()`.
    * `ProjectItem.Write()` is invoked for each project item. This method stores the item data into the corresponding MSBuild item.
3. The `MSBuildProject` instance, with all the updated information, is saved to disk.

### Custom Property Serialization

The `Project` class has a `ProjectProperties` property of type `IPropertySet` which can be used to read and store custom properties. Those properties will be written to the MSBuild file.

The `ProjectConfiguration` class also has a `Properties` property. In that case, properties will be stored in the MSBuild PropertyGroup bound to the configuration.

The `ProjectItem` class has a Metadata property. Properties stored there will be saved as metadata of the MSBuild project item.

The `IPropertySet` interface has methods for getting and setting property values. The methods for getting values are defined in the base interface `IReadOnlyPropertySet`. This is a summary of the most relevant methods:

``` csharp
    public interface IReadOnlyPropertySet
    {
        string GetValue (string name, string defaultValue = null);
        FilePath GetPathValue (string name, FilePath defaultValue = default(FilePath),
                bool relativeToProject = true, FilePath relativeToPath = default(FilePath));
        bool TryGetPathValue (string name, out FilePath value, FilePath defaultValue = default(FilePath),
                bool relativeToProject = true, FilePath relativeToPath = default(FilePath));
        T GetValue<T> (string name);
        T GetValue<T> (string name, T defaultValue);
        object GetValue (string name, Type type, object defaultValue);
    }
```

Some comments about the methods and its arguments arguments:

* `GetValue()`: returns a value as string, or as whatever type is specified as type argument.
  * **name**: name of the property.
  * **defaultValue**: value to be returned if the property doesn't exist.
* `GetPathValue()`: returns the value of a property interpreted as a path.
  The path is converted from the MSBuild (Windows) format to the local system format.
  * **relativeToProject**: if **true**, the value is interpreted as a path relative to the project,
    and the returned value is converted to an absolute path, using the project path as base path.
  * **relativeToPath**: if specified, the value is interpreted as a path relative to the specified path,
    and the returned value is converted to an absolute path, using that path as base path.

The methods for setting values are defined in the `IPropertySet` interface. This is a summary of the methods:

``` csharp
    public interface IPropertySet: IReadOnlyPropertySet
    {
        void SetValue (string name, string value, string defaultValue = null,
                bool preserveExistingCase = false, bool mergeToMainGroup = false,
                string condition = null, MSBuildValueType valueType = null);
        void SetValue (string name, FilePath value, FilePath defaultValue = default(FilePath),
                bool relativeToProject = true, FilePath relativeToPath = default(FilePath),
                bool mergeToMainGroup = false, string condition = null);
        void SetValue (string name, object value, object defaultValue = null,
                bool mergeToMainGroup = false, string condition = null);

        bool RemoveProperty (string name);

        void SetPropertyOrder (params string[] propertyNames);
    }
```

Some comments about the methods and its arguments arguments:

* `SetValue()`: sets the value of a property.
  * **name**: name of the property to set.
  * **value**: new value of the property.
  * **defaultValue**: value that this property has by default. If the provided value matches
    the default value, instead of storing the value, the property will be removed.
  * **preserveExistingCase**: if **true**, the property won't be modified if the new value and
    the current value only differ in case.
  * **mergeToMainGroup**: Only used in `ProjectConfiguration`. If set to **true**, and the new value
    is the same for all configurations, the property will be removed from the configurations and
    will be defined in the main group.
  * **condition**: MSBuild condition to be applied to the property.
  * **valueType**: a hint about how the value must be interpreted. It is useful to avoid
    unnecessary changes in some cases. For example, if the type is set to MSBuildValueType.Guid,
    the current value is "27096e7f-c91c-4ac6-b289-6897a701df21", and the new value is
    "{27096E7F-C91C-4AC6-B289-6897A701DF21}", the method will consider that the values are the
    same and the property will not be modified.
  * **relativeToProject**: if **true**, the provided absolute path will be converted to a path relative to
    the base project path.
  * **relativeToPath**: if specified, the provided absolute path will be converted to a path relative to
    the specified path.
* `SetPropertyOrder()`: sets the relative order of some properties. This order is only taken into account
   when new properties are added. If the properties are already set, the existing order won't be modified.

### Automatic MSBuild Property Serialization

There are several attribtues that can be applied to fields or properties to enable automatic serialization of those fields or properties:

* `[ItemProperty]`: for properties of any type.
* `[ProjectPathItemProperty]`: for properties that store a path.
* `[RelativeProjectPathItemProperty]`: for properties that store a path relative to the project.
* `[MergeToProjectAttribute]`: it can be applied together with any of the above attributes.
  When applied, it has the same effect as setting mergeToMainGroup=true in `IPropertySet.SetValue()`
  (see Custom Property Serialization section above).

Those attributes can be used in any subclass of the following classes:

* Project
* ProjectConfiguration
* ProjectExtension
* ProjectItem
* SolutionExtension (when SolutionDataSectionAttribute is applied to the type)

### Solution Serialization

Solution serialization behavior can be customized by implemnting a `SolutionExtension` subclass and overriding `OnReadSolution` and `OnWriteSolution`. The provided `SlnFile` instance can be used to read and write data to the solution file.

Automatic property serialization is supported as described above. However, for automatic serialization to work the `SolutionDataSectionAttribute` attribute must be applied to the `SolutionExtension` subclass. This attribute taks the name of the custom data section as first argument. For example:

``` csharp
  [SolutionDataSection ("TestData")]
  class TestSolutionExtension: SolutionExtension
  {
    [ItemProperty ("customData")]
    public string CustomData { get; set; }

    [ItemProperty ("extra")]
    public ComplexSolutionData Extra { get; set; }
  }

  class ComplexSolutionData
  {
    [ItemProperty ("prop1")]
    public string Prop1 { get; set; }

    [ItemProperty ("prop2")]
    public string Prop2 { get; set; }
  }
```

The solution extension properties could end being serialized in the solution file like this:

```text
...
Global
  ...
  GlobalSection(TestData) = postSolution
    customData = one
    extra = $0
    $0.prop1 = two
    $0.prop2 = three
  EndGlobalSection
  ...
EndGlobal
```

### WorkspaceItem Serialization

The Project Model already implements support for loading solutions and workspaces. If you are implementing your own `WorkspaceItem` subclass, you need to implement serialization support for it.

The first step is to implement a `WorkspaceObjectReader` subclass. This class will be in charge of loading the bits from the file that contains the workspace item. It has the following API:

``` csharp
    public abstract class WorkspaceObjectReader
    {
        public abstract bool CanRead (FilePath file, Type expectedType);

        public virtual Task<SolutionItem> LoadSolutionItem (ProgressMonitor monitor,
                SolutionLoadContext ctx, string fileName, MSBuildFileFormat expectedFormat,
                string typeGuid, string itemGuid);

        public virtual Task<WorkspaceItem> LoadWorkspaceItem (ProgressMonitor monitor, string fileName)
    }
```

The methods you need to implement are `CanRead()` and `LoadWorkspaceItem()`.

Object reader implementations must be registered in the `/MonoDevelop/ProjectModel/WorkspaceObjectReaders` extension point. For example:

``` xml
    <Extension path="/MonoDevelop/ProjectModel/WorkspaceObjectReaders">
        <Class class="MyAddin.MyObjectReader" />
    </Extension>
```

The save operation can be implemented by overriding the `OnSave()` virtual method of `WorkspaceItem`.

## Threading model

The general rule is that the project model is thread safe for reading but not for writing. Methods that modify the model must be called in the UI thread, other methods can be called by background threads (unless otherwise specified).

### Shared objects

Any `WorkspaceObject` subclass can be in two states: **Shared** and **Not Shared**. Objects in **Shared** state can only be modified in the UI thread. This is ensured by calls to `AssertMainThread()` in methods that modify the object, which will throw an exception if the method is not called from the UI thread.

Objects in **Not Shared** state are still not thread safe for modifications, but thread access is not checked, so it is up to the object creater to decide how to ensure that only one single thread is modifying the object at a given time.

By default (when instantiated), objects are in **Not Shared** state. The state can be switched to **Shared** by calling `SetShared()` on the object. There is no way to transition back. When an object switches to **Shared**, the `OnSetShared()` virtual method is called, both in the object and all its extensions.

Project and solution loading is done in a background thread, so they are in **Not Shared** state during all loading process. Once they are fully loaded, they are switched to **Shared** state.

### Async methods

Methods that may take long time to execute are exposed as async methods. Continuations of async methods will be executed in the calling context.
