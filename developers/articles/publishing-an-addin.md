---
title: Publishing an Addin
redirect_from:
  - /Developers/Articles/Publishing_an_Addin/
---

Once you have implemented an add-in, it's time to publish it online to make it available to all MonoDevelop users. There are two ways of doing it: publishing it in the official MonoDevelop add-in repository or using a custom (maybe private) add-in repository.

Add-in Properties
-----------------

There are some add-in properties which can be set to control how add-ins are presented to the user in MonoDevelop. Here is a simple example of properties specified in an add-in:

``` xml
<Addin id="MonoDevelop.SomeAddin>
    <Header>
        <Name>Git support</Name>
        <Name locale="ca-ES">Support per a Git</Name>
        <Description>Provides support for the Git version control system</Description>
        <Author>Lluis Sanchez</Author>
        <Url>http://monodevelop.com/Git</Url>
        <Icon32>git.png</Icon32>
    </Header>
    ...
</Addin>
```

Here is a description of all properties that can be set:

### Name

Display name of the add-in. This property is localizable. For example:

``` xml
<Addin id="MonoDevelop.SomeAddin>
    <Header>
        <Name>Git support</Name>
        <Name locale="ca-ES">Support per a Git</Name>
        ...
    </Header>
    ...
</Addin>
```

### Description

Long description of the add-in. It can have several lines. The description is localizable (see the example for the Name property).

### Author

Name of the author or authors of the add-in. Displayed in the add-in details in the add-in manager.

### Copyright

Copyright of the add-in.

### Category

Category of the add-in. It should be one of the following:

-   Debugging
-   Web Development
-   Project Import and Export
-   Language bindings
-   Version Control
-   Database
-   Testing

### Url

Url of a web page with more information about the add-in. When this property is present, a "More Information" button is shown in the add-in details, which opens the web page when clicked.

### Icon32

Icon of the add-in. The value of the property must be a file path relative to the location of the add-in file. The file must be an image with a size of 32x32 pixels.

This icon is shown in the add-in manager.

### PreviewImage

Preview images of the add-in. It is possible to specify several preview images using the properties PreviewImage, PreviewImage2, PreviewImage3, etc. Each property value must be a file path relative to the location of the add-in file. There are no limitations in the size of the image.

Preview images are shown in the in add-in details view of the add-in manager.

### UpdateRank

Determines how this add-in update is notified to the user. It can be one of the following:

-   Important: an update notification is shown in a dialog. This is the most intrusive notification.
-   Normal: the update is notified with a flashing icon in the status bar.
-   Minor: the update is not actively notified to the user, but it will be shown in the add-in manager.

The update rank can be conditioned to the presence of a specific update tag in MonoDevelop. For example:

``` xml
<Addin id="MonoDevelop.GitAddin">
    <Header>
        <UpdateRank>MySpecialTag:Important Minor</UpdateRank>
        ...
    </Header>
    ...
</Addin>
```

In this example, the update rank of the add-in will be Important if the tag 'MySpecialTag' is defined, and Minor otherwise.

There are two ways of difining update tags:

-   Using the method: MonoDevelop.Ide.Updater.UpdateService.AddUpdateTag(tag)
-   Defining an extension of the "/MonoDevelop/Ide/UpdateTags" extension point. Notice that this extension must be defined for an add-in that is already installed. For example:

``` xml
<Addin>
    ...
    <Extension path="/MonoDevelop/Ide/UpdateTags">
          <Tag id="MySpecialTag" />
    </Extension>
    ...
</Addin>
```

### ReleaseNotes

This property should have the release notes for this release and for all the previous releases that it supersedes. The format is the following.

{% raw %}
{{version2,date2}} release note text
{{version1,date1}} release note text ...
...
{% endraw %}

For example:

{% raw %}
{{2.0, 2011-11-22}}
Release notes for 2.0
It can have multiple lines

{{1.2, 2011-09-02}}
Release notes for 1.2

{{1.1, 2011-01-10}}
Release notes for 1.1
{% endraw %}

Notices that **newer releases must come first in the text**.

When showing an add-in update, monoDevelop will only show the release notes for the versions higher than the one installed. So in the above example, if 1.1 is already installed, only release notes for 1.2 and 2.0 will be shown.

Currently, the release notes are only shown in the update notification dialog, for add-ins with UpdateRank=Important.

### ReleaseNotesFile

Same as the **ReleaseNotes** property, but the content is provided in a file instead of verbatim in the property. The value of the property must be path to a text file, relative to the location of the add-in file. The format of the content is the same as ReleaseNotes.

Publishing in the official MonoDevelop repository
-------------------------------------------------

The official MonoDevelop add-in repository is available at [addins.monodevelop.com](http://addins.monodevelop.com/ "http://addins.monodevelop.com/"). Add-ins published in this repository are available to all MonoDevelop users, since it is registered by default in MonoDevelop.

In order to publish your add-in in the official repository, you have to do the following:

-   Create a file named **addin-project.xml** with the content specified [here](http://addins.monodevelop.com/Source/AddinProjectHelp?projectId=1 "http://addins.monodevelop.com/Source/AddinProjectHelp?projectId=1").
-   Upload the source code of your add-in to a public git, subversion or bazaar repository
-   Login to [addins.monodevelop.com](http://addins.monodevelop.com/ "http://addins.monodevelop.com/")
-   Create a new project, and in the source settings, specify the location of your source code
-   Wait for the project to build (it may take a while)
-   When the project is built, a new entry will be shown in the Source section of the project page.
-   Select the Development Status of the project. It can be Stable, Beta, Alpha or Test.
-   Click the Publish button.

The repository has several channels. You can select in which channel an add-in has to be published using the Dev Status option:

-   **Stable**: select this option for stable releases of add-ins. This channel is always active in all MonoDevelop installations.
-   **Beta**: for beta releases of add-ins. This channel is always active in all MonoDevelop installations, unless the user disabled it.
-   **Alpha**: for alpha releases of add-ins. This channel is registered by default in MonoDevelop but it is not enabled by default. So the repository is shown in the repositories list, but the user has to explicitly enable it install add-ins from it.
-   **Test**: for testing only. The test channel is not registered by default in MonoDevelop, it has to be manually added. Add-ins in this channel are not shown in the recent releases list in addins.monodevelop.com.

Publishing in a custom repository
---------------------------------

You can publish your add-in in your own on-line add-in repository. To do so, you have to package your add-in, create an add-in repository and publish it.

### Packaging an add-in

To package an add-in, run the following command:

``` bash
mdtool setup pack someAddin.dll
```

If the add-in doesn't have an assembly, use the .addin file instead of the assembly file.

This command generates a file with the extension **.mpack**. This is the file that the users will download and install.

### Creating an add-in repository

An add-in repository is a collection of .mpack files together with some index files, which can be generated using a command line tool. To create a repository:

-   Copy all .mpack files you want to publish to a directory
-   Run the following command for generating the index files (where /the/directory is the directory that contains the add-in packages):

``` bash
mdtool setup rep-build /the/directory
```

-   Publish all resulting files in an http server
-   Ask the users to register the url of the directory in the add-in manager (this can be done in the Gallery section, using the Manage Repositories option in the repositories list).
