---
title: Preprocessed Razor Templates
redirect_from:
  - /Documentation/Preprocessed_Razor_Templates/
---

Preprocessed Razor Templates use the [Razor templating language](http://weblogs.asp.net/scottgu/archive/2010/07/02/introducing-razor.aspx) to create C# template classes that can be embedded into any project type, and used to generate HTML without the dependency and overhead of the System.Web.Mvc app. This makes them suited for things like mobile apps that need to generate content for an embedded web view, or tools that generate HTML reports.

### Creating a Preprocessed Razor Template

Preprocessed Razor Template templates use the "Custom Tool" feature of MonoDevelop, which is modeled on similar functionality in Visual Studio. The file must be selected in the *Solution Pad*, then the *Property Pad* must be used to set the *Custom Tool* property to "RazorTemplatePreprocessor". After this property is set, whenever the *cshtml* file is saved, a *cs* file with the same name will be regenerated, containing the class generated from the Razor file. This will be compiled into the project, and the generated class will be accessible from code completion.

Fortunately there is a file template that performs this step automatically. Simply create a new file using the *Text Templating -\> Preprocessed Razor Template* template, and a cshtml file will be added with the Custom Tool property already set.

A [tutorial](https://mjhutchinson.com/journal/2012/12/08/razor_preprocessed_templates) is available.

### The Generated Class

The generated class is public partial, and its name is based on sanitizing the name of the cshtml file. Its namespace is based on the project's default namespace and the project's directory-to-namespace mapping policies. It has two methods that are intended to be used by consumers of the template:

``` csharp
public void Generate (TextWriter writer);
public string Generate ();
```

The first will execute the template and write its output to the provided TextWriter. The second is a convenience overload that executes the template, writes its output to a temporary StringWriter, and returns it as a string.

By default, the class inherits from a generated class that has the name except with "Base" appended. For example, the file Foo.cshtml would by default generate a file Foo.cs, containg the classes Foo and FooBase, with Foo inheriting from FooBase. The FooBase class is designed to be easy to extract into a separate file in order to share a common base class between several template, or customize its default generated members. All its members are commented explaining whether and why they are needed.

### Customizing the Generated Class

Since the generated class is a partial class, members can be added by adding other class parts with the same name to the project. The generated class can also be customized through the use of several Razor directives.

#### Using

The standard Razor `@using` directive can be used to import a namespace, i.e. add a using statement to the generated file. Any number of instnces of the directive may be used.

Example:

``` csharp
@using Foo
```

#### Inherits

The standard Razor `@inherits` directive can be used to override the base class of the generated class, and cause the default base class not to be generated. This can be used to reduce code duplicated by sharing a single copy of the base class between multiple templates, or can be used to customize the base class. Only one instance of this directive may be provided.

Example:

``` csharp
@inherits MyBaseClass<SomeModel>
```

#### Model

The Razor directive `@model` may be used to specify a type that will be used for a model property, which can be used to pass data in to the template. It will cause a simple pubic get/set property called Model to be added to the generated class.

Example:

``` csharp
@model SomeModelType
```

### Experimental Customizations

The following ways to customize the generated class are experimental, and not guaranteed to be available or behave the same in future versions of MonoDevelop. Use with caution.

#### Inherits Object

Using the inherits directive to specify the base class to be `object`, i.e.

``` csharp
@inherits object
```

will cause the members that would have been generated on the default generated base class to be placed drectly in the generated class.

#### Class

The `\_\_class` directive can be used to override the accessibility, name and namespace of the generated class. It may have one or two values. If there are two values, the first must specify the accessibility (`public` or `internal`), and the second must specify the name. The name may be fully qualified in order to override the namespace. If there is one value, it may be either the accessibility or the name. Only one instance of this directive may be provided. Some examples:

``` csharp
@__class SomeName
@__class internal SomeNamespace.SomeName
@__class internal
```

#### Property

The `@\_\_property` directive can be used to declare simple public get/set auto properties on the class, without having to use a partial class, a model class or a @functions block. The directive requires two values, the type and the name. Any number of instances of the directive may be used.

Example:

``` csharp
@__property SomeType SomePropertyName
```

### Differences from Razor in ASP.NET MVC Web Apps

Aside from the obvious difference in how the cshtml files are compiled into the project instead of being compiled by a web server, there are a few differences in the generated code.

#### Model Property

Since there is no default base class, the `@model` directive doesn't mimic the `System.Web.Mvc.WebViewPage\<TModel\>` mechanism of defining the model property on the base type and setting its type as a type parameter to the base class. Instead, the property is added directly on the generated class. To use a custom base class with a generic model property, simply omit the `@model` directive and instead specify the full closed name of the base class: `@inherits SomeClass\<SomeModel\>`.

#### Razor Helpers 

The Razor templates preprocessor performs a small transformation to eliminate the `System.Web.WebPages.HelperResult` dependency from Razor helpers. Instead of returning an isnatnce of this type, they directly return an `Action\<TextWriter\>`, which the main Razor class uses to write to its output.
