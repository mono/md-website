---
title: Localizing Applications
redirect_from:
  - /Documentation/Localizing_Applications/
---

Localization is the process of translating an application's user interface to other natural languages, such as Spanish, Italian, and so on. This is important if your software is used in another country/region, so that users can understand the program.

MonoDevelop provides support for using the GNU Gettext library for localization. Although Gettext works on most operating systems, so applications that use it can work anywhere, the MonoDevelop tools for updating and editing translations are currently only supported on Linux. Mac and Windows support may be provided in the future.

This tutorial assumes that you are working with C# projects, but may easily be adapted to other code languages.

### Overview of Gettext

Gettext works by having a "catalog" of strings and their translations. From your code, you call Gettext with a string value, and it give you back the translation. In order to build or update the catalog, tools are used to scan your code and identify all these calls, and extract the strings and add them to the reference catalog.

Translators take the reference catalog and copy it to create a per-language catalog. Using a text editor or a specialized catalog editing program, they translate each string. These translated catalogs are then compiled into a binary form that Gettext can read efficiently.

When the reference is updated, it must be merged into the language catalogs, so that new strings are added to the language catalog, and old strings are removed. Yhe translators must then update the language catalogs.

### Initializing the Catalog

Gettext translates string values by looking them up in a catalog. In order to use Gettext, you must initialize it with the catalog name and location.

First add a reference to the **Mono.Posix** assembly, which implements the Mono Gettext support. To do this, right click the project's *References* in the **Solution Pad** and select *Edit References*. Select Mono.Posix and, click the Add button, then click Ok.

[![Reference.png](/images/297-Reference.png)](/images/297-Reference.png) 

To initialize the catalog, call

``` csharp
Mono.Unix.Catalog.Init ("appname", "locale");
```

where *appname* is the name of your application and *locale* is the directory where the catalogs are stored.

### Translating Strings

To translate an application, every user-visible string must be translated. Gettext makes this simple: anywhere that a user-visible string is needed, simply pass the string to the **Catalog.GetString** method. It will return the translated version of the string, or, if not translation is available, it will return the string that was passed to it.

For example, instead of 

``` csharp
Console.WriteLine ("Hello World!");
```

use

``` csharp
Console.WriteLine (Gettext.GetString ("Hello World!"));
```

The catalog can only translate literal strings, so not alter strings before passing them to the catalog. Also, it is important not to assume that other languages can be manipulated the same way as English. Do not translate partial strings, then join them together.

Instead, translate a format string, then format it.

For example, instead of 

``` csharp
string message = "The temperature is " + temperature + " degrees";
```

use

``` csharp
string message = string.Format (Gettext.GetString ("The temperature is {0} degrees"), temperature);
```

Gettext is also capable of localizing strings that contain plurals that depend on a numerical value, using Catalog.GetPluralString. This takes three arguments: the string that is used if the value is 1, the string that is used is the value is greater than 1, and the value. Other language may have more complex pluralization schemes, and the catalog can handle that.

For example:

``` csharp
string message = string.Format (
    Gettext.GetPluralString ("There is {0} mouse", "There are {0} mice", mouseCount),
    mouseCount);
```

XML files can also be localized. This is useful for things like UI definitions. The convention is to localize the values of elements and attributes that have names beginning with an underscore. The Gettext scanner will extract all these values when scanning XML files, so they will be in the catalog, but they must still be passed through Catalog.GetString manually.

### Localizing Gtk# Applications

MonoDevelop's Gtk# designer can automatically use Gettext in the code that it generates. This can be configured in Project Options.

### Translation Projects

MonoDevelop has a special project type that handles creating, updating and editing gettext catalogs. This is the **Translation Project**. When creating a new solution, you are offered the option of creating a translation project, but it is easy to add one to an existing solution using the *Add Project* command.

[![NewTranslationProject.png](/images/296-NewTranslationProject.png)](/images/296-NewTranslationProject.png) 

To update the catalog, right-click on the translation project and select *Update.* The translation project will scan all other projects in the solution looking for translatable strings. You can opt-out of this scan for individual files using the property pad.

To add translations, right-click on the translation project and select *Add Translation.* You can then select a language, and MonoDevelop will add a translation for that language.

[![NewLocalization.png](/images/294-NewLocalization.png)](/images/294-NewLocalization.png) 

To edit a translation, open the translation catalog by double-clicking on the language in the Solution Pad.

At the top of the translation catalog editor is a list of all the translatable strings. Each has an icon indicating whether it is translated, untranslated, or a fuzzy match. Select one, and more information will appear in the other boxes. The *Original(msgid)* value is the string found in the code. Below it is the *Translated(msgstr)* value, where the translator should set the translated version of the string. There is also an option to comment the translation or see from which line from the source code it originates. Don't forget to save the catalog after editing!

[![TranslationGUI.png](/images/298-TranslationGUI.png)](/images/298-TranslationGUI.png) 

The translation catalogs will be compiled when the translation project is built. The output directory for the compiled files can be configured in the *Project Options* of the translation project.

[![ProjectOptions.png](/images/299-ProjectOptions.png)](/images/299-ProjectOptions.png) 

Fuzzy strings are string which have been automatically matched during an update. They are likely incorrect but may be useful when updating the real translation.
