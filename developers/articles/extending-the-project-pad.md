---
title: Extending the Project Pad
redirect_from:
  - /Developers/Articles/Extending_the_Project_Pad/
  - /Extending_the_Project_Pad/
---

### Introduction

This tutorial explains how to implement an addin that extends the project pad. The idea for this extension is to be able to show the classes that are implemented in a file as child nodes of that file in the project pad. Something like this:

![ExtendedTreeCaptura.png](/images/238-ExtendedTreeCaptura.png)

Classes are shown as child nodes of the file, and the file label has been extended to include the number of classes (which is not really useful, but this is just an example).

### The Project Pad

First of all, I'll explain how the project pad is defined in the core addin XML file. It looks like this:

``` xml
<Extension path = "/MonoDevelop/Ide/Pads">
    (...)
    <SolutionPad id = "ProjectPad" defaultPlacement = "Left" _label = "Solution" icon = "Icons.16x16.CombineIcon">
        <PadOption id = "ShowAllFiles" _label = "Show All Files" defaultValue = "False" />
        <NodeBuilder id = "Combine" class = "MonoDevelop.Gui.Pads.ProjectPad.CombineNodeBuilder"/>
        <NodeBuilder id = "Project" class = "MonoDevelop.Gui.Pads.ProjectPad.ProjectNodeBuilder"/>
        <NodeBuilder id = "ProjectReferenceFolder" class = "MonoDevelop.Gui.Pads.ProjectPad.ProjectReferenceFolderNodeBuilder"/>
        <NodeBuilder id = "ProjectReference" class = "MonoDevelop.Gui.Pads.ProjectPad.ProjectReferenceNodeBuilder"/>
        <NodeBuilder id = "ProjectFile" class = "MonoDevelop.Gui.Pads.ProjectPad.ProjectFileNodeBuilder"/>
        <NodeBuilder id = "Folder" class = "MonoDevelop.Gui.Pads.ProjectPad.ProjectFolderNodeBuilder"/>
        <NodeBuilder id = "ResourceFolder" class = "MonoDevelop.Gui.Pads.ProjectPad.ResourceFolderNodeBuilder"/>
    </SolutionPad>
    (...)
</Extension>
```

The project pad is defined using a **SolutionPad** element, which has a set of **NodeBuilder** and **PadOption** elements. Each NodeBuilder element defines a node builder class that is in charge of creating the nodes for a specific type of data. For example, the CombineNodeBuilder class will create the nodes for Combine objects. Each type of data that is to be shown in the tree, needs its own node builder.

The solution pad creates the tree of nodes by following several steps:

-   It gets the first object that has to be added to the tree, which is the root combine.
-   It looks for a node builder that can handle this type of data, which happens to be CombineNodeBuilder.
-   It calls a method of the builder to get the text and the icon for the object, and creates the corresponding tree node.
-   It calls a method of the builder to get the children of the object, which will be recursively added to the tree following the same steps.

It is allowed to have several node builders that handle the same type of data. In fact, this is the fundamental feature that makes the solution pad extensible. The idea is that there is a chain of builders for each data type. Addins can add new node builders to the chain. Node builders can transform the text and icon for a node, and can add new children. Of course, an addin can also add node builders for completely new data types.

Node builder classes must inherit either from **TypeNodeBuilder** or **NodeBuilderExtension**, depending on whether we want to implement a node builder for a new data type, or we want to extend existing builders.

For each data type that needs to be rendered in the tree there must be one and only one TypeNodeBuilder subclass. There is no limit or restriction for NodeBuilderExtension subclasses. The first builder in a node builder chain is always the TypeNodeBuilder subclass, and builder extensions come after that one.

What's the difference between TypeNodeBuilder and NodeBuilderExtension? not too much. Both inherit from NodeBuilder and share most of functionality. TypeNodeBuilder has some additional methods to get some information from data objects that would not make sense to be extended by other builders in the chain. I'll show those differences later in the tutorial.

For the sample extension we'll need to create two node builders:

-   a NodeBuilderExtension subclass, which will be added to the ProjectFile builder chain, and which will render the class count and will add the child class objects.
-   a TypeNodeBuilder subclass, which will be in charge of rendering the class objects.

### Creating a NodeBuilderExtension for project files

The FileClassExtension class implements the node builder that extends the ProjectFile's builder chain. This class inherits from NodeBuilderExtension, and the only method that is mandatory to override is **CanBuildNode()**. This method is called by the solution pad to determine if a builder must be added to the builder chain of a given type. This is the first method that we'll implement:

``` csharp
class FileClassExtension: NodeBuilderExtension
{
    public override bool CanBuildNode (Type dataType)
    {
        return typeof(ProjectFile).IsAssignableFrom (dataType);
    }
}
```

The **dataType** parameter is the type to be checked, and the method must return true if the builder can build nodes for this data type. The FileClassExtension builder is only interested in ProjectFile objects, so it only returns true for ProjectFile classes (or subclasses).

Notice that a node builder extension can return true for more than one data type, which means that it will be added to the builder chain of all those data types.

#### Building the tree

The **BuildNode()** method is called sequentially for all node builders in a chain to get the icon and the text of the node being created. It has the following signature:

``` csharp
public virtual void BuildNode (ITreeBuilder builder, object dataObject, NodeInfo nodeInfo)
```

The **dataObject** parameter is the object for which the node is being built. **nodeInfo** has several properties that can be used to set the content and style of the node. Those properties are:

- **Label**: text of the node
- **Icon**: icon to show for the node when it is expanded, and also for when it is collapsed if ClosedIcon is not set
- **ClosedIcon**: icon to show for the node when it is collapsed.
- **OverlayBottomLeft**, **OverlayBottomRight**, **OverlayTopLeft**, **OverlayTopRight**: overlay icons that will be shown in a corner of the main icon.
- **StatusIcon**: icon used to represent the status of the node. It is shown next to the icon text.
- **StatusMessage**: message shown in a tooltip when mouse is moved over the status icon.
- **StatusSeverity**: specifies if the status icon represents an error, warning, or just information.
- **DisabledStyle**: if set to true, the icon is shown with a grey color, meaning that it is disabled.

I'll talk about the **builder** parameter in a minute.

The sample extension overrides this method and extends the label to include the number of classes inside the file:

``` csharp
public override void BuildNode (ITreeBuilder builder, object dataObject, NodeInfo nodeInfo)
{
    ProjectFile file = (ProjectFile) dataObject;
    IClass[] cls = Runtime.ParserService.GetFileContents (file.Project, file.Name);
    nodeInfo.Label = string.Format ("{0} ({1})", label, cls.Length);
}
```

In order to create the child nodes of a tree node, another method is called: **BuildChildNodes()**. The reason for splitting the node creation in two methods is that the tree is lazily created, that is, the children of a node won't be created until that node is expanded. This saves a lot of resources and time for trees with a large number of nodes (see for example the class pad).

The BuildChildNodes method in the sample extension can be implemented like this:

``` csharp
public override void BuildChildNodes (ITreeBuilder builder, object dataObject)
{
    ProjectFile file = (ProjectFile) dataObject;
    IClass[] cls = Runtime.ParserService.GetFileContents (file.Project, file.Name);
    foreach (IClass c in cls)
        builder.AddChild (c);
}
```

Like BuildNode(), this BuildChildNodes() has a **dataObject** parameter which is the object for which the child nodes are being created. The **builder** parameter is an object that implements the **ITreeBuilder** interface and provides several methods for adding, removing and updating tree nodes. Right now we are only interested in adding child nodes, and we can use the AddChild() method for that.

You can see the complete definition of the ITreeBuilder interface in the **ITreeBuilder.cs** file. ITreeBuilder inherits from **ITreeNavigator** (implemented in **itreenavigator.cs**, which offers several methods for navigating around the tree. I'll describe ITreeNavigator later in the tutorial.

Notice that we are not dealing with TreeIters, and tree stores here. We always deal with data objects. When we call AddChild(c) we are adding a new object to the solution pad, and it is the responsibility of the solution pad to find a builder chain for that object and create the node in the tree store. Of course, it is our responsibility to provide a node builder for that data type (we'll do that later on).

We need to implement one more method in our FileClassExtension class: the **HasChildNodes()** method. This method has the same parameters as BuildChildNodes() but it just has to return true if the node being built has children. This method is used by the solution pad to check if it has to show the expand arrow or not (remember, the tree is lazily created). The implementation is very simple:

``` csharp
public override bool HasChildNodes (ITreeBuilder builder, object dataObject)
{
    ProjectFile file = (ProjectFile) dataObject;
    IClass[] cls = Runtime.ParserService.GetFileContents (file.Project, file.Name);
    return cls.Length > 0;
}
```

There is another method that is called when building a tree node: **GetNodeAttributes**. It can be override to return some attributes for the node. Right now there are only two attributes: NodeAttributes.Hidden, to avoid showing the node in the tree, and NodeAttributes.AllowRename, to enable node renaming.

#### Adding a display option

We want to make this new "Show classes inside files" feature optional, so the user can choose whether to show or not the classes by clicking on a checkbox menu option in the contextual menu.

All management of the options (which includes creating the menu option, enabling/disabling the option and updating the tree) is automatically handled by the solution pad. The node builder only needs to check whether the option is enabled or not when building the node. This is the complete FileClassExtension class with support for options:

``` csharp
class FileClassExtension: NodeBuilderExtension
{
    public override bool CanBuildNode (Type dataType)
    {
        return typeof(ProjectFile).IsAssignableFrom (dataType);
    }

    public override void BuildNode (ITreeBuilder builder, object dataObject, NodeInfo nodeInfo)
    {
        if (builder.Options ["ShowFileClasses"]) {
            ProjectFile file = (ProjectFile) dataObject;
            IClass[] cls = Runtime.ParserService.GetFileContents (file.Project, file.Name);
            nodeInfo.Label = string.Format ("{0} ({1})", label, cls.Length);
        }
    }

    public override void BuildChildNodes (ITreeBuilder builder, object dataObject)
    {
        if (builder.Options ["ShowFileClasses"]) {
            ProjectFile file = (ProjectFile) dataObject;
            IClass[] cls = Runtime.ParserService.GetFileContents (file.Project, file.Name);
            foreach (IClass c in cls)
                builder.AddChild (c);
        }
    }

    public override bool HasChildNodes (ITreeBuilder builder, object dataObject)
    {
        if (builder.Options ["ShowFileClasses"]) {
            ProjectFile file = (ProjectFile) dataObject;
            IClass[] cls = Runtime.ParserService.GetFileContents (file.Project, file.Name);
            return cls.Length > 0;
        } else
            return false;
    }
}
```

#### Keeping up to date with data changes

We are almost done with FileClassExtension, but to complete it, we need to make it aware of data changes. This means that when a class is added to a file, it should show the new class as a child of the file node, or it should remove it if the class has been deleted.

With the current design, **only node builders can modify the tree**. This is not how things worked until now. Let's see for example how the Remove command would be handled for removing ProjectFiles. In the old solution pad the Remove command class would do all work: ask for confirmation, remove the ProjectFile from the Project, and remove the corresponding tree node.

In the new solution pad, the Remove command would only remove the ProjectFile from the Project. It can't remove the tree node because it is not a node builder, and has no access to a ITreeBuilder object. It is the responsibility of the Project node builder to subscribe the FileRemovedFromProject event, and update the tree when that event is raised. In this way, the tree is always in sync with the real list of files, it doesn't matter where and when it is modified.

In the FileClassExtension sample, we need to update the tree when the class information about the file changes. We can do it by subscribing the ClassInformationChanged event provided by the parser service:

``` csharp
class FileClassExtension: NodeBuilderExtension
{
    ClassInformationEventHandler changeClassInformationHandler;

    protected override void Initialize ()
    {
        changeClassInformationHandler = (ClassInformationEventHandler) Runtime.DispatchService.GuiDispatch (new ClassInformationEventHandler (OnClassInformationChanged));
        Runtime.ParserService.ClassInformationChanged += changeClassInformationHandler;
    }

    public override void Dispose ()
    {
        Runtime.ParserService.ClassInformationChanged -= changeClassInformationHandler;
    }

    void OnClassInformationChanged (object sender, ClassInformationEventArgs e)
    {
        if (e.Project == null) return;
        ProjectFile file = e.Project.GetProjectFile (e.FileName);
        if (file == null) return;

        ITreeBuilder builder = Context.GetTreeBuilder (file);
        if (builder != null)
            builder.UpdateAll ();
    }

    (...)
}
```

Several things to notice:

-   The ClassInformationChanged is subscribed using a delegate wrapper provided by GuiDispatch, to ensure that the handler runs in the GUI thread. This is mandatory because it is going to change the GUI.
-   The event handler can get a ITreeBuilder object from the Context object. The GetTreeBuilder() method will return an ITreeBuilder positioned at the tree node for the provided data object, or will return null if there is no tree node for that object (remember again, the tree is lazily created, so a tree node may not yet exist for a child data object).
-   The ITreeBuilder.UpdateAll() method will refresh the whole node subtree on which the builder is positioned on. We could be more precise, and see which classes have been added/removed, and use ITreeBuilder.Remove() and ITreeBuilder.AddChild() to add and remove nodes.

The **Initialize** method is called when the node builder is bound to the tree. It can be used to subscribe events, to create the node icons, or whatever is needed. **Dispose()** is called when the builder is no longer needed. The ideal method for unsubscribing events.

Initialize() and Dispose are fine for global events, but sometimes you'll need to subscribe to events which are raised by the data objects being added to the tree. In this case, you can use the **OnNodeAdded** and **OnNodeRemoved** methods. The OnNodeAdded is called when an object which is handled by this node builder is added to the tree, and OnNodeRemoved when it is removed. For example, the builder for Project nodes in the project pad subscribes to the project's NameChanged in this method.

OK, the FileClassExtension class is ready. The complete code can be found in **fileclassextension.cs**.

### Creating a TypeNodeBuilder for the IClass objects

We need to create a new node builder for IClass objects. It will be a TypeNodeBuilder subclass because we are creating a new node type, not extending an existing one. This class is more simple than the FileClassExtension, so I'll show the full code at one time:

``` csharp
class ClassBuilder: TypeNodeBuilder
{
    public override Type NodeDataType {
        get { return typeof (IClass); }
    }

    public override Type CommandHandlerType {
        get { return typeof(ClassCommandHandler); }
    }

    public override string GetNodeName (object dataObject)
    {
        return ((IClass)dataObject).Name;
    }

    public override void BuildNode (ITreeBuilder treeBuilder, object dataObject, ref string label, ref Gdk.Pixbuf icon, ref Gdk.Pixbuf closedIcon)
    {
        IClass cls = (IClass) dataObject;
        icon = Context.GetIcon (Runtime.Gui.Icons.GetIcon (cls));
        label = cls.Name;
    }
}
```

Some comments:

-   When implementing a TypeNodeBuilder subclass, you don't have a CanBuildNode() method to override. You have to override the **NodeDataType** property instead, and return the data type that this builder handles. It's obvious then that unlike builder extensions, TypeNodeBuilder can only manage a single type of data.
-   You can override the **CommandHandlerType** property and return a class that will be in charge of handling the commands and actions that the user performs over nodes of this type. I'll talk about this in the next section.
-   The **GetNodeName()** method is a mandatory override, and must return the name that will be used to identify the nodes that this builder creates. This is not the label of the tree, although it will often have the same value. The node name can be used to locate nodes in the tree.
-   The **BuildNode()** method works like in the FileClassExtension class. The ClassBuilder object will be the first builder in the builder chain for IClass, so it has to provide the text and the icon for IClass objects.
-   We don't need to override BuildChildNodes or HasChildNodes, since IClass nodes won't have children.

### Handling user actions

#### Common commands

To handle user actions such as item activation, we need to create a new class, which must inherit from NodeCommandHandler. This class has several overridable methods that are called for common user actions:

-   **ActivateItem**: called when the user double-clicks a node.
-   **RenameItem**: called when the node is renamed by the user.
-   **RemoveItem**: called when the user executes the Remove command.

For our sample extension, we'll override the ActivateItem method, and will open the file where the class is implemented:

``` csharp
class ClassCommandHandler: NodeCommandHandler
{
    public override void ActivateItem ()
    {
        IClass cls = (IClass) CurrentNode.DataItem;
        if (cls.Region.FileName != null) {
            Runtime.FileService.OpenFile (cls.Region.FileName);
        }
    }
}
```

The **CurrentNode** property of NodeCommandHandler returns an **ITreeNavigator** object positioned at the node to which the user action applies. The ITreeNavigator can be used to navigate through the tree and locate the information we need to perform the user action.

For example, to get the project to which the IClass object belong, we could do the following:

``` csharp
ITreeNavigator nav = CurrentNode;
nav.MoveToParent (typeof(Project));
Project p = (Project) nav.DataItem;
```

although this particular example can be simplified using the GetParentDataItem() method:

``` csharp
Project p = CurrentNode.GetParentDataItem (typeof(Project), false);
```

This call will return the closest Project data object in the path to the root node. The second parameter is to specify that the current node should not be included in the search.

ITreeNavigator has many other methods that can be used to navigate the tree: MoveNext, MoveToChild, MoveToRoot, and so on. It also offers properties such as Selected, Expanded, NodeName and of course DataItem, which returns the data object bound to the tree node.

#### Extending the context Menu

Once the new class node is showing up in the project pad, the next step is to create a context menu for the node. Just to show how it works, we'll add a "Properties" menu option which will show a message box with some information about the class.

The command can be implemented in the ClassCommandHandler class we defined above. We first need to create the enumeration value that identifies the command, and then we add a command handler for that command:

``` csharp
public enum SampleCommands {
      ShowProperties
}

class ClassCommandHandler: NodeCommandHandler
{
    [CommandHandler (SampleCommands.ShowProperties)]
    protected void OnShowProperties ()
    {
        IClass cls = (IClass) CurrentNode.DataItem;

        Project p = (Project) CurrentNode.GetParentDataItem (typeof(Project), false);
        ProjectFile file = (ProjectFile) CurrentNode.GetParentDataItem (typeof(ProjectFile), false);

        StringBuilder sb = new StringBuilder ();
        sb.AppendFormat ("Class: {0}\n", cls.Name);
        sb.AppendFormat ("Project: {0}\n", p.Name);
        sb.AppendFormat ("File: {0}\n", file.Name);
        sb.AppendFormat ("Methods:\n", file.Name);

        foreach (IMethod met in cls.Methods)
            sb.AppendFormat (" - {0}\n", met.Name);

        MessageService.ShowMessage (sb.ToString ());
    }

    public override void ActivateItem ()
    {
        IClass cls = (IClass) CurrentNode.DataItem;
        if (cls.Region.FileName != null) {
            Runtime.FileService.OpenFile (cls.Region.FileName);
        }
    }
}
```

Once we have the command implemented, we need to show it in the context menu. There are two ways of doing it: by extending the existing project pad context menu, or by creating a brand new context menu.

The first and easiest option is to extend the existing context menu definition of the project pad. All we have to do is to add a new extension:

``` xml
<AddIn name = "SampleProjectPadExtension" ... >
    (...)
    <Extension path = "/MonoDevelop/Ide/ContextMenu/ProjectPad">
        <Condition id="ItemType" value="MonoDevelop.Projects.IClass">
            <CommandItem id = "Sample.SampleCommands.ShowProperties"/>
        </Condition>
    </Extension>
    (...)
</AddIn>
```

The **Condition** element is required here to ensure that the new option is only shown for objects that implement the IClass interface (the value of the condition has to be the full name of the type).

The second option is to define a new menu. If we are implementing a new node type using TypeNodeBuilder, we can specify the menu's addin extension path for this type of node by overriding the **ContextMenuAddinPath** property. Just to show how it works, we'll add a "Properties" menu option which will show a message box with some information about the class:

``` csharp
class ClassBuilder: TypeNodeBuilder
{
    (...)

    public override string ContextMenuAddinPath {
        get { return "/SampleProjectPadExtension/ProjectPad/ContextMenu"; }
    }
}
```

In the addin xml file we define the new menu. In this case it will have a single option:

``` xml
<AddIn name = "SampleProjectPadExtension" ... >
    (...)
    <Extension path = "/MonoDevelop/Ide/Commands">
        <Command id = "Sample.SampleCommands.ShowProperties"
                  _label = "Properties" />
    </Extension>

    <!-- Declares an extension point for the new menu -->
    <ExtensionPoint path = "/SampleProjectPadExtension/ProjectPad/ContextMenu" name = "Context menu for the sample extension">
	<ExtensionNodeSet id="MonoDevelop.Components.Commands.ItemSet"/>
    </ExtensionPoint>

    <!-- Declares the menu items -->
    <Extension path = "/SampleProjectPadExtension/ProjectPad/ContextMenu">
        <CommandItem id = "Sample.SampleCommands.ShowProperties"/>
    </Extension>
    (...)
</AddIn>
```

#### Drag & Drop

Drag & drop can be supported by overriding some methods defined by NodeCommandHandler: CanDragNode, CanDropNode and OnNodeDrop.

### Registering the new node builders

The final step is to tell MD to include the our new node builders to the project pad. We also need to register the new ShowFileClasses option, so it is included in the contextual menu. The addin XML file would look like this:

``` xml
<AddIn name = "SampleProjectPadExtension" ... >
    <Extension path = "/MonoDevelop/Ide/Pads/ProjectPad">
        <PadOption id = "ShowFileClasses" _label = "Show classes inside files" defaultValue = "False" />
        <NodeBuilder id = "FileClassExtension" class = "Sample.FileClassExtension"/>
        <NodeBuilder id = "ClassBuilder" class = "Sample.ClassBuilder"/>
    </Extension>
</AddIn>
```

The complete xml file can be found in **sampleprojectpadextension.xml**.

### Sample code

This is the source code of the sample:

-   **classbuilder.cs**
-   **classcommandhandler.cs**
-   **fileclassextension.cs**
-   **sampleprojectpadextension.xml**

A tarball with the complete sample can be downloaded from [here](http://primates.ximian.com/~lluis/samples/SampleProjectPadExtension.tar.gz "http://primates.ximian.com/~lluis/samples/SampleProjectPadExtension.tar.gz"). If you want to compile it, beware that you'll need to add a new reference to your local MonoDevelop.Base.dll assembly to the project.

Once compiled, just put the dll and the xml file into the AddIns folder, and restart MonoDevelop.

Have fun!
