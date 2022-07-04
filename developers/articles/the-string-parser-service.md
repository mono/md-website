---
title: The String Parser Service
redirect_from:
  - /Developers/Articles/The_String_Parser_Service/
---

The String Parser Service is implemented in the `MonoDevelop.Core.StringParserService` class and can be used to parse strings which contain tags and replace them with actual values. For example:

``` csharp
var values = new Dictionary<string,object> ();
values ["name"] = "Novell Inc";
values ["year"] = 2010;
string result = StringParserService.Parse ("Copyright (c) ${year} ${name)", values);
// The result will be: "Copyright (c) 2010 Novell Inc"
```

This kind of tagged strings are used in several places in MonoDevelop, such as in file templates, external tools and custom commands.

The StringParserService class has several overloads of the **Parse** method which provide different ways of specifying tag/value pairs. **Tags are case insensitive.**

Global tags
-----------

There are a set of global tags which are defined by the IDE and which are always processed, no matter which tag model is being used:

- `Date`        : Current date (short format)
- `Time`        : Current time (short format)
- `Year`        : Current year
- `Month`       : Current month
- `Day`         : Current day
- `Hour`        : Current hour
- `Minute`      : Current minute
- `Second`      : Current second
- `User`        : User login name
- `FilePath`    : Full path of the active document
- `FileDir`     : Directory of the active document
- `FileName`    : Name of the active document
- `FileExt`     : Extension of the active document
- `CurLine`     : Cursor line in the active document
- `CurColumn`   : Cursor column in the active document
- `CurOffset`   : Cursor offset in the active document
- `CurText`     : Selected text in the active document
- `EditorText`  : All text in the active document
- `StartupPath` : MonoDevelop startup directory

Tag value formatting
--------------------

It is possible to specify a formatting string for numeric and DateTime values. The format string can be specified after the tag name, using a colon as separator. For example:

``` csharp
string result = StringParserService.Parse ("Created on ${date:D)");
// 'D' is  the format string for the long date pattern.
// The result will be something like: "Created on Monday, June 15, 2009"
```

It is possible to use any format string supported by the ToString() method of each type.

String Tag Models
-----------------

One of the StringParserService.Parse method overloads takes an **IStringTagModel** object as parameter. This interface has a single **GetValue (string)** method which can be implemented by a class to provide values for arbitrary strings.

Some classes of the MonoDevelop project model have methods for getting string tag models, which provide tags for common object properties. For example:

``` csharp
Solution s = ... // Get the solution from somewhere
IStringTagModel model = s.GetStringTagModel ();
string result = StringParserService.Parse ("The name of the solution is ${SolutionName}", model);
// The result would be something like "The name of the solution is SomeSolution"
```

The Solution class and all the other classes providing a GetStringTagModel() method also provide a **GetStringTagModelDescription()** method which can be used to get a list of all tags supported by the object. This list can be used to populate for example an editing menu.

The `MonoDevelop.Ide.Gui.Components.StringTagSelectorButton` widget is a drop down button which shows a list of tags.

Extensible String Tag Models
----------------------------

The `MonoDevelop.Core.StringParsing.StringTagModel` class is an implementation of the IStringTagModel interface which can be extended by add-ins. This class can be used like in the following example:

``` csharp
SomeObject ob = new SomeObject ();
StringTagModel tagModel = new StringTagModel ();
tagModel.Add (ob);
string result = StringParserService.Parse ("Some tag value ${SomeValue}", tagModel);
```

What's special about the StringTagModel class is that it doesn't have a method for adding key/value pairs, but instead it has a method for adding full objects. Key/value pairs will be extracted from those objects. This extraction of key/value pairs is done through a set of IStringTagProvider objects, which are registered in an extension point. This interface is defined like this:

``` csharp
public interface IStringTagProvider
{
    IEnumerable<StringTagDescription> GetTags (Type type);
    object GetTagValue (object instance, string tag);
}
```

When GetValue() is called on the StringTagModel object, it will iterate through all providers and call **GetTagValue()** for each object registered in the model until it gets a value.

Notice that **both type and instace parameters can be null**, meaning that StringTagModel is trying to get global tag values. IStringTagProvider implementations must always check for null arguments and return global tag values if they want to provide them.

Add-ins can implement IStringTagProvider classes to generate key/value pairs for some specific types of objects. Here is an example of an IStringTagProvider implementation:

``` csharp
[Mono.Addins.Extension]
class SomeTagProvider: StringTagProvider<SomeObject>
{
    public override IEnumerable<StringTagDescription> GetTags ()
    {
        yield return new StringTagDescription ("SomeValue", "Some special value");
    }

    public override object GetTagValue (SomeObject ob, string tag)
    {
        if (tag == "SOMEVALUE")
            return ob.SomeProperty;
        else
            throw new NotSupportedException;
    }
}
```

Some comments:

- The **[Extension]** attribute must be applied to specify that this class extends and extension point
- The base class **StringTagProvider\<T\>** is a convenient implementation of IStringTagProvider which checks the type of the provided instance and does the required type cast to call the specialized methods.
- The **GetTags()** method must return a list of tags supported by this provider. The StringTagDescription takes the tag name and description as arguments.
- The **GetTagValue()** method must be able to return values for each of the tags returned by GetTags().
- The **tag name** in GetTagValue is always provided in upper case, no matter how it was specified in the parsed string.

The **WorkspaceItem** and **SolutionItem** classes (and all subclasses such as Solution and Project) have a GetStringTagModel() method which returns a StringTagModel for the instance. Add-ins can use IStringTagProvider implementations to provide custom tag values for those objects.
