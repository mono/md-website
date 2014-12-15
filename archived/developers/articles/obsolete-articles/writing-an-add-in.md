---
title: Writing an Add-In
redirect_from:
  - /Developers/Articles/Obsolete_Articles/Writing_an_Add-In/
  - /Writing_an_Add-In/
  - /Developers/Obsolete_Articles/Writing_an_Add-In/
---

**Note: This page is out of date and the instructions do not work with any recent version of MonoDevelop.**

**For an up to date guide, see [Creating a Simple Add-In](/developers/articles/creating-a-simple-add-in/)**

Introduction
------------

MonoDevelop has a powerful extension system which can be used by developers to integrate additional functionality to the IDE (or more generally speaking, to the MonoDevelop platform).

MonoDevelop's extension system is based on a **tree of extension points**. An extension point is just a placeholder where add-ins can add new items which provide extra functionality. Extension points are identified with a path, which specifies its location in the tree. For example, the path: '/MonoDevelop/Ide/MainMenu' identifies the extension point which can be used by add-ins to add items to the main menu.<span id="1237507978616S" style="display: none;"> </span>

Add-ins add new elements to extension points, and frequently these elements are references to classes or interfaces implemented in the add-in. For example, an add-in which adds new menu items to the main menu may need to implement classes for handling those new commands.

The [Extension Tree Reference](/developers/articles/extension-tree-reference/) has a complete description of the extension tree and the requirements of each extension point.

Add-ins can also add new extension points to the extension tree. For example, the SourceEditor add-in (the add-in which implements the main MonoDevelop source code editor) adds a new extension point to the tree: '/MonoDevelop/SourceEditor2/EditActions'. Other add-ins can then extend the editor by implementing and registering custom edit actions.

MonoDevelop can be seen as a hierarchy of add-ins. Each add-in can add new items to extension points, and can add new extension points for other add-ins to extend.

MonoDevelop uses the [Mono.Addins](http://www.mono-project.com/Mono.Addins) framework, and its [introduction](http://www.mono-project.com/Introduction_to_Mono.Addins)and [reference manual ](http://www.mono-project.com/Mono.Addins_Reference_Manual)may be useful to developers writing addins that are more advanced than what is described in this document.

Contents of an add-in
---------------------

A MonoDevelop add-in contains, at minimum, an **add-in manifest**, which describes the addin and its dependencies, and declares the extensions implemented by the addin and the extension points it offers.

It also may contain one or more **assemblies**, which implement the extensions, and any other support **files** needed by the add-in (such as bitmaps, html files or whatever is needed at run-time). The manifest may be embedded within the main assembly as an embedded resource.

Most of add-ins will only have the add-in description file and one assembly implementing the extensions. Some add-ins will need additional assemblies. For example, the Stetic add-in contains a copy of the Stetic libraries.

Some add-ins will need support files. For example, the html page and css styles file used by the Welcome Page add-in are defined in the add-in as support files.

Many extension points that require files allow the files to be embedded within the main add-in assembly as embedded resources. When the manifest is embedded too, this means that the entire addin can be compiled into a single assembly.

All files of an add-in can be packaged together in an .mpack file, which is just a zip file containing all files. These mpack files can easily be distributed via addin respositories. There is a chapter in this article which explains how to generate mpack files.

The add-in description file
---------------------------

This file describes the content of an add-in. It is an XML file with four sections:

-   The header: provides basic information such as the id, name, author and description.
-   Runtime element: Specifies assemblies and files to be loaded at run-time.
-   Dependencies element: Specifies other add-ins and assemblies required to run the add-in.
-   Extensions: A list of all extensions implemented in the add-in.

Here is a more detailed description of each section:

### Header

The header is the AddIn root element of the xml file. The most important attributes are the following:

-   **id**: An identifier for the add-in.
-   **namespace:** A namespace for the identifier. The combined "namespace.id" identifier must be unique between all add-ins.
-   **name**: The display name of the add-in.
-   **version**: The version number of the add-in.

The **id**, **namespace**, and **version** are mandatory for add-ins that declare extension points, but seeting them is good practice for all add-ins.

Other useful attributes are:

-   **compatVersion**: oldest compatible version of the add-in (where compatible means that it doesn't break the ABI). This attribute only makes sense for add-ins that can be extended, so others add-ins can depend on it. For example, an add-in with version 1.6 and compatVersion 1.2 can be used to satisfy dependencies on 1.2 or upper versions.
-   **author**: name of the author.
-   **copyright**: copyright and license of the add-in.
-   **url**: url with more information about the add-in.
-   **description**: long description of the add-in.
-   **category**: category under which to show the add-in in the add-in repository.

### The Runtime element

The **Runtime** element specifies the files required to run the add-in. Each file is specified in an **Import** element. Two kind of files can be imported: assemblies and support files. To **import an assembly**, just specify the relative path to the assembly in an *assembly* attribute. To **import a support file**, use the *file* attribute.

Here is an example of an add-in importing an assembly and some support files:

``` eval
<Runtime>
    <Import assembly="WelcomePage.dll"/>
    <Import file="WelcomePage.css"/>
    <Import file="WelcomePage.xsl"/>
    <Import file="mono-bg.png"/>
    <Import file="mono-logo.png"/>
</Runtime>
```

An add-in can import more than one assembly. Assemblies will be loaded in the order they are declared in the Runtime element, so if one add-in depends on another one, make sure the dependent is declared the latest.

It is important to include all files that the addin requires, so that mpack packaging and installation can work correctly.

### Dependencies

If an add-in extends or makes use of classes implemented in another add-in, it must declare this dependency in the **Dependencies** element.

For example:

``` eval
<Dependencies>
    <AddIn id="MonoDevelop.Core" version="2.0"/>
    <AddIn id="MonoDevelop.Core.Gui" version="2.0"/>
    <AddIn id="MonoDevelop.Projects" version="2.0"/>
    <AddIn id="MonoDevelop.Projects.Gui" version="2.0"/>
    <AddIn id="MonoDevelop.Ide" version="2.0"/>
</Dependencies>
```

This example add-in specifies that it depends on several MonoDevelop.\* add-ins.

### Extensions

Add-ins can use the **Extension** element to specify new elements to be added to the extension tree. The tree location where to add the elements is specified in the *path* attribute. For example:

``` eval
<Extension path = "/MonoDevelop/Ide/Commands">
    <Command id = "MonoDevelop.WelcomePage.WelcomePageCommands.ShowWelcomePage"
             defaultHandler = "MonoDevelop.WelcomePage.ShowWelcomePageHandler"
             _label = "Welcome Page"
             icon = "gtk-home"/>
</Extension>
```

The format of the tree path is like the format for paths in a Unix directory tree. Inside the Extension element there are the new elements to be added. These elements are referred to as *extension nodes*.

Extension nodes have attributes which specify the behaviour or state of some element of the program. Every node can have an ID which identifies it in the tree; the extension is then inserted into the tree beneath the extension path + '/' + id. The id attribute is not mandatory, but only extensions with an ID will be able to be referenced or extended by other extensions.

An add-in will usually add elements to several extension points of the extension tree. See the [Extension Tree Reference](/developers/articles/extension-tree-reference/) for a complete description of all available extensions.

#### Arranging extensions

One requirement for menu items is that they need to be in some sort of order. When defining a menu, we expect the options to be shown in the order they are defined.

When there is only a single xml file defining the menu this is not a problem. Problems arise when the definitions are scattered across more than one XML file.

All codons have two common attributes which can be used to specify the placement in the tree: *insertafter* and *insertbefore*.

The *insertafter* attribute can be applied to an extension node to specify the ID of the extension node after which the it has to be inserted. For example:

``` eval
<ItemSet id="MyMenu" insertafter="File" _label="My menu">
```

The *insertafter* attribute here ensures that the 'MyMenu' menu is inserted after the 'File' menu. Notice that the extension node will be inserted just after the referenced node, unless there is another add-in which defines a extension node with the same *insertafter* reference. In this case, the extension node from one add-in will be inserted after the extension node of the other add-in (the order depends on which add-in was loaded first).

If you want to insert several extension node after one existing extension node, the *insertafter* attribute only needs to be applied to the first one in the list. Once the insertion point is specified for one extension node, all extension node following that one will be inserted after it. For example:

``` eval
<Extension path = "/MonoDevelop/Ide/MainMenu">
  <ItemSet id="MyMenu1" _label="My menu 1" insertafter="File"> ... </ItemSet>
  <ItemSet id="MyMenu2" _label="My menu 2"> ... </ItemSet>
  <ItemSet id="MyMenu3" _label="My menu 3"> ... </ItemSet>
</Extension>
```

The *insertbefore* attribute works like the *insertafter* attribute, but it forces the extension node where it is specified to be inserted before the referenced extension node.

### Example XML

Here is a complete example of an add-in description file, *WelcomePage.addin.xml*:

``` eval
<Addin id          = "WelcomePage"
       namespace   = "MonoDevelop"
       name        = "Welcome Page"
       author      = "Scott Ellington"
       copyright   = "MIT X11"
       url         = "http://salmonsalvo.net/"
       description = "Welcome Page for MonoDevelop"
       category    = "MonoDevelop Core"
       version     = "2.0">

    <Runtime>
        <Import assembly="WelcomePage.dll"/>
        <Import file="WelcomePage.css"/>
        <Import file="mono-bg.png"/>
        <Import file="mono-logo.png"/>
    </Runtime>

    <Dependencies>
        <Addin id="Core" version="2.0"/>
        <Addin id="Core.Gui" version="2.0"/>
        <Addin id="Projects" version="2.0"/>
        <Addin id="Ide" version="2.0"/>
    </Dependencies>

    <Extension path = "/MonoDevelop/Ide/Commands">
        <Command id = "MonoDevelop.WelcomePage.WelcomePageCommands.ShowWelcomePage"
                 defaultHandler = "MonoDevelop.WelcomePage.ShowWelcomePageHandler"
                 _label = "Welcome Page"
                 icon = "gtk-home"/>
    </Extension>

    <Extension path="/MonoDevelop/Ide/MainMenu/View">
        <CommandItem id="MonoDevelop.WelcomePage.WelcomePageCommands.ShowWelcomePage"
            insertafter="ViewItemsSeparator2"
            insertbefore="MonoDevelop.Ide.Commands.ViewCommands.FullScreen" />
    </Extension>

    <Extension path = "/MonoDevelop/Ide/StartupHandlers">
        <Class class="MonoDevelop.WelcomePage.ShowWelcomePageOnStartUpHandler" />
    </Extension>

    <Extension path = "/MonoDevelop/Ide/GlobalOptionsDialog/Preferences/Style">
        <Panel _label = "Welcome Page" class = "MonoDevelop.WelcomePage.WelcomePageOptionPanel" />
    </Extension>
</Addin>
```

Creating extensible add-ins
---------------------------

MonoDevelop add-ins can declare new extension points in the extension tree, to be extended by other add-ins. This section explain how to do it.

### Declare new extension points

New extension points are declared in the add-in description file using the same syntax used to extend existing extension points, with some additions. For example:

``` eval
<Extension path = "/MyAddIn/ContextMenu" extension-nodes="CommandItem, SeparatorItem" description="Context menu for MyAddIn.">
    <CommandItem id="MonoDevelop.Ide.Commands.EditCommands.Copy"/>
    <CommandItem id="MonoDevelop.Ide.Commands.EditCommands.Cut"/>
    <CommandItem id="MonoDevelop.Ide.Commands.EditCommands.Paste"/>
</Extension>
```

In this case, this new extension point contains some elements defined in the owner add-in. In other cases this won't be needed and the extension point can be left empty.

The **description** attribute is an explanation of what is this extension point for.

The **extension-nodes** attribute specifies which elements are allowed in this extension point. MonoDevelop defines several element types or *codons*. A complete list can be found [here](/developers/articles/extension-tree-reference/). However, you can create your own codon types.

### Creating new codons

To create a new codon you need to create a class which implements ICodon (from MonoDevelop.Core.AddIns namespace). The easiest way of doing it is by subclassing the class AbstractCodon. Then, you'll need to do the following:

-   Apply the **CodonNameAttribute** attribute to the class, and specify the name of the codon (to be used in xml files).
-   Add one field for each attribute you want to support. Such fields should be marked with the *XmlMemberAttribute* attribute. You can specify the name of the attribute (if it's different from the name of the field), or set whether the attribute is required or not (using the *IsRequired* property).
-   Implement the **BuildItem** method. This method is called after loading the codon and should be used for initializing internal data structures if needed. This method must return an object to be inserted in the tree in place of the codon. In most of cases returning *this* should be enough.

Here is a simple example of codon:

``` eval
[Description ("A file template.")]
[CodonNameAttribute("FileTemplate")]
internal class FileTemplateCodon : AbstractCodon
{
    [Description ("Resource name where the template is stored.")]
    [XmlMemberAttribute("resource", IsRequired = true)]
    string resource;

    public string Resource {
        get { return resource; }
        set { resource = value; }
    }

    public override object BuildItem (object owner, ArrayList subItems, ConditionCollection conditions)
    {
        return this;
    }
}
```

### Getting elements declared in an extension point

To get all elements added to an extension point you can use the *GetTreeItems()* method from the add-in service. for example:

``` eval
object[] items = Runtime.AddInService.GetTreeItems ("/MyAddIn/ContextMenu");
```

Notice that the returned array will contain one object per codon found. This object will be the object returned by the BuildItem method of each codon. If you want to get the codons, and not the created items, you can use *GetTreeCodons()* instead.

Packaging and publishing add-ins
--------------------------------

MonoDevelop provides tools for packaging and publishing add-ins. This is what you have to do:

-   Make sure that the \<Runtime\> section of your add-in description file contains references to all files used by the add-in. Don't forget support files needed at run-time.
-   Create a local directory, for example: myaddins
-   Execute "mdtool setup pack path/to/addin.xml -d:myaddins". This will create a .mpack file in myaddins, which is just a zip with all files.
-   Do the above for all your add-ins.
-   Execute "mdtool setup rep-build myaddins". This will create a couple of .mrep files, which are just an index of the add-ins in the repository.
-   Upload all .mpack and .mrep files to a web server

The URL of the main.mref file is the URL of the add-in repository you just created.

The document '[The SharpDevelop add-in tree architecture](http://www.icsharpcode.net/TechNotes/ProgramArchitecture.pdf)' by Mike Krueger and Bernd Spudia has some information about the SharpDevelop add-in architecure, from which MonoDevelop was derived and further developed. This article originally included several paragraphs directly taken from that document.
