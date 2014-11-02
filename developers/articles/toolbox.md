---
title: Toolbox
redirect_from:
  - /Developers/Articles/Toolbox/
  - /Toolbox/
---

The MonoDevelop toolbox provides a palette of items that the user can choose to insert into their current document. While originally intended for use in GUI designer, it can also be used for text snippets.

### Providers

There are three ways that components can be provided to the toolbox: loaders, providers, and dynamic providers.

#### Toolbox Loaders

The toolbox loader extension point can be used to register classes that can scan an assembly (or metadata file) for toolbox items. The user can select assemblies or metadata files to be scanned in the **component selector dialog**, when choosing which components are to be visible in the toolbox.

This is implemented by registering a class that implements *MonoDevelop.DesignerSupport.Toolbox.IToolboxLoader* to the */MonoDevelop/DesignerSupport/ToolboxLoaders* extension path. Since scanning assemblies is computationally expensive, MonoDevelop automatically maintains an index/cache of toolbox scan results.

This extension point should be used for providing global toolbox items that can be added to any applicable project. Adding one of these components to a project should automatically add any relevant assembly references needed.

#### Toolbox Providers

The Toolbox Providers extension point is used to provide items that are included in the toolbox by default. It can provide a set of toolbox nodes, or a list of assembly/metadata files to be scanned by the toolbox loaders.

This is implemented by registering a class that implements *MonoDevelop.DesignerSupport.Toolbox.IToolboxDefaultProvider* to the */MonoDevelop/DesignerSupport/ToolboxProviders* extension path.

#### Dynamic Toolbox Providers

The dynamic toolbox provider provides changeable toolbox items specific to the document. This may include things like clipboard snippets, or components defined in referenced projects. Since projects are changeable, so these may be updated on-the-fly via the parser service.

This is implemented by registering a class that implements *MonoDevelop.DesignerSupport.Toolbox.IToolboxDynamicProvider* to the */MonoDevelop/DesignerSupport/ToolboxProviders* extension path, or implemeting this interface on the ViewContent or a TextEditorExtension.

### Toolbox Nodes

Internally, the toolbox is a collection of objects that derive from*MonoDevelop.DesignerSupport.Toolbox* .ItemToolboxNode*. These subclasses must be registered with the MonoDevelop serialisation infrastructure.*

Nodes expose a description, category, name, and icon. Of particular interest are the members that can be overridden:

-   *IList\<ToolboxItemFilterAttributesItemFilters\>*: used to filter for which consumers the node should be shown.
-   *string ItemDomain*: a 'friendly name *for categorising the node in the component selection dialog.*
-   *bool Filter (string keyword)*: Used to match items when the user searches the toolbox.

There are several useful variants already implemented:

-   TextToolboxNode: Represents a snippet of text.
-   TypeToolboxNode: Represents a Mono/.NET type.
-   ToolboxItemToolboxNode: Wraps a Mono/.NET *System.Drawing.Design.ToolboxItem* or subclass.

The *ITextToolboxNode* interface can be implemented on any toolbox node to make it visible to the text editor. This allows creating, for example, designer toolbox items that can also emit text. It has the following members:

-   *string[] AllowedMimetypes*: Mimetypes for which the item should be shown.
-   *string[] AllowedExtensions*: File extensions for which the item should be shown.
-   *GetTextForFile (string filename, Project project)*: Used by the text editor to get a snippet of text. The snippet can be customised for the particular file, e.g. generating language-specific code.

### Consumers

A ViewContent or TextEditorExtension must implement *MonoDevelop.DesignerSupport.Toolbox.IToolboxConsumer* in order to be able to consume toolbox items. It has several members:

-   *void ConsumeItem (ItemToolboxNode)*: Called when a toolbox item is picke, i.e. the user double-clicks on it. The item should be inserted at the current (or default) cursor position in the document.
-   *TargetEntry[] DragTargets*: the drag types that the designer can handle.
-   *void DragItem (ItemToolboxNode, Widget, DragContext)*: called when the user has initiated a drag.
-   *bool CustomFilterSupports (ItemToolboxNode)*: Called when a ToolboxItemFilter mode requests custom filtering.
-   *ToolboxItemFilterAttribute[] ToolboxFilterAttributes*: attributes that are used to filter which toolbox items should be shown for this consumer.
-   *string DefaultItemDomain*: the 'friendly name' of the node category that should be selected by default in the toolbox's component selector dialog.

The interface *MonoDevelop.DesignerSupport.Toolbox.ICustomFilteringToolboxConsumer* may be implemented instead to fully override filtering of toolbox nodes; it adds one member:

-   *bool SupportsItem (ItemToolboxNode)*: whether the item should be shown for this consumer.

### Filtering

The toolbox contains a store of all loaded toolbox nodes, and when the active toolbox consumer changes, it uses filters to generate a set of nodes for that consumer.

Each toolbox node contains a collection of .NEt/Mono ToolboxFilter attributes. In the case of nodes that are generated from .NET/Mono types, these attributes are extracted from the type; they can be applied multiple times to the type. The filter contains a string and a ToolboxItemFilterType.{Require, Prevent, Allow, Custom} value. These filters are compared between the node and the consumer. The item will be shown if the following rules hold:

-   If one Requires a string, the other must either Require or Allow that string.
-   If one Prevents a string, the other must not Require or Allow the string
-   If one has the Custom value; the CustomFilterSupports method on the provider must return true for that node.

In addition, a toolbox consumer can use *ICustomFilteringToolboxConsumer* to override this filtering fully.

### Potential Improvements

#### Component Selector Dialog

-   Add an entry for filtering/searching items
-   Use tabs instead of combo dropdown?

#### Text editor integration

-   Provide parser/language information to the node when it's generating text
-   Add a provider that shows the MonoDevelop template snippets.

##### ToolboxItem Loader

A generic toolbox loader that scans .NET/Mono assemblies out-of-process for the System.ComponentModel.ToolboxItemAttribute. It should provide a further extension point that can be used to define how the attributes are treated when they are encountered. By unifying the ToolboxItemAttribute-based loaders, the scanning time for multiple loaders will be greatly reduced.
