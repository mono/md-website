---
title: What's new in MonoDevelop 2.8
redirect_from:
  - /Download/What's_new_in_MonoDevelop_2.8/
---

Project Management
------------------

#### MSBuild support

The MSBuild project files written by MonoDevelop are more compatible wth Visual Studio. MonoDevelop now support **custom frameworks** and **framework profiles**.

#### New Edit References dialog

![AddReference.png](/images/313-AddReference.png)

The Edit References dialog has been redesigned and it is now easier and faster to select the references to be added to a project. It has a new "All" tab which lists all available references (of all kinds: packages, projects and files) and supports filtering using a word matching algorithm (the same used for the find type/file commands).

On Windows, assemblies in assembly folders are now shown in the references list correctly.

![DocumentOutline.png](/images/314-DocumentOutline.png)

#### Improved Class and Document Outline pads

Classes and members in the Document Outline view can now be sorted and grouped.

![HighlitingEditor.png](/images/315-HighlitingEditor.png)

Source Editing
--------------

There is a new editor for defining **syntax highlighting color schemes**. There is also a new default syntax highlighting color scheme.

Mac Development
---------------

<span class="Apple-style-span" style="color: rgb(78, 109, 159); font-size: 19px; ">MonoTouch Projects</span>

**<span>NOTE: When MonoTouch projects are opened in MonoDevelop 2.8, you will be required to choose to migrate them to a new format before they can be opened. This will mean that they cannot be opened in older versions of MonoDevelop. This is required because of changes in the project format for the new Application Settings editor, and because Interface Builder files edited with Xcode 4 can cause data loss when used with older versions of MonoDevelop.</span>**

#### Xcode 4 Support

![xcode-support.jpg](/images/319-xcode-support.jpg)MonoTouch and MonoMac projects now support using Xcode 4 to edit Interface Builder files.

MonoDevelop generates a temporary Xcode project containing stub Objective-C classes for the C# classes that are registered with Objective-C, defined in the MonoDevelop project, which allows these classes to be accessed from Interface Builder in Xcode. Outlets and actions created in these stub classes using Interface Builder are synchronized back to MonoDevelop.

The Xcode project also contains all of the bundle resources from the MonoDevelop project, allowing them to be accessed from Interface Builder.

There are no longer codebehind files for xib files, instead there are designer files for Objective-C registered classes. These store the outlets that have been created in Xcode.

#### XCode 4 Samples

We have updated MonoTouch's samples to take advantage of XCode 4 and added many new samples.   You can [browse our samples on github](https://github.com/xamarin/monotouch-samples).

#### Storyboard Support

![xcode\_storyboard.jpg](/images/320-xcode_storyboard.jpg)

With the new version of MonoDevelop, you can now create applications that use [iOS 5 Storyboards](http://developer.apple.com/technologies/ios5/).   This is part of our XCode 4 integration.   Merely double-click on a storyboard to launch XCode 4.2, design your UI, name your custom classes, switch back to MonoDevelop, and consume all of the new classes that were created.

Storyboards require that your application target iOS5 and newer.

#### Application Settings

MonoTouch application settings are now stored in the Info.plist application manifest, instead of the project file. There is a new user-friendly editor for the Info.plist, which can be accessed in the *Project Options* dialog or by directly opening the Info.plist file from the *Solution Pad.*

#### ![MonoTouchProjectOptions.png](/images/316-MonoTouchProjectOptions.png)

#### InterfaceDefinition Files

MonoDevelop now uses the InterfaceDefinition build action for xib files instead of Page. Existing files will have their build action migrated automatically.

#### ![NewProjectTemplates.png](/images/317-NewProjectTemplates.png)Project Templates

There are many more MonoTouch project templates, all with iPhone, iPad and Universal variants. These all use the new Xcode 4 codebehind layout.

#### Native References

References to static native libraries can now be added to MonoTouch projects. MonoDevelop will automatically generate the correct GCC linker flags to pass to mtouch.

Note that if native references are C++ libraries, they must be marked as such using the property grid.

#### SDK Locations

The location of the MonoTouch and iOS SDKs is now configurable.

#### TestFlight integration

![testflight.jpg](/images/321-testflight.jpg)

iOS developers will enjoy the [TestFlight integration](http://docs.xamarin.com/ios/tutorials/TestFlight_Support) in MonoDevelop.  You can now publish your projects directly from MonoDevelop to TestFlight to allow your users and beta testers to take out your application for a spin, without having to deal with any of the complexities of managing certificates or provisioning profiles.   Merely select "Publish to TestFlight" from the Project menu, and watch as your application is compiled, packaged and uploaded to TestFlight for distribution

### MonoMac Projects

MonoMac projects now support using Xcode 4 to edit Interface Builder files, similarly to MonoTouch projects.

Other
-----

-   Interface builder xib files can be opened in the XML editor using the *Open With...* command.
-   There is an editor for property list (plist) files.
-   New Branding engine, which allows distributors to customize several aspects of the MonoDevelop user interface, such as the welcome page or about box.
-   The Gettext add-in is now supported on Windows
