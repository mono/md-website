---
title: Refactoring
redirect_from:
  - /Documentation/Refactoring/
---

***Refactoring*** is the process of changing a software system in a way that won't alter the external behavior of the code but wil improve its structure. It can be applied to all possible programming languages.

The best example of what refactoring is will be the name refactoring tool.This tool is bound to the F2 key. If you press F2 in a parameter or local variable and edit the local variable, all the references in your method are updated according the moment. If you rename a class, MonoDevelop will also change the name of the constructor.

![refactoring2.png](http://img816.imageshack.us/img816/2808/refactoring2.png)

## Resolving Namespace

Another Refactoring tool is the Resloving Namespace.When applied to a class name, this tool will look for a namespace that declares the class, and will insert the required 'using' declaration at top of the file. If there are several namespaces defining the same class, all available options will be shown, so the user can chose.

![252-NamespaceResolver.png](/images/252-NamespaceResolver.png)

## The 'Show Code Generation Window' tool (Alt + Insert by default)

This refactoring tool allows quick generation of snippets of code, based on the current context. Here are some examples:

-   Generate a constructor, initializing a set of selected fields.
-   Generate properties for a set of fields.
-   Override base class members.
-   Implement ToString().
-   Implement equality methods.
-   Introduce a parameter null check in a method.

![250-XmlDocumentationCompletion.png](/images/250-XmlDocumentationCompletion.png)

## Declare Local

This function can really speed up the software development. First type the initializer for your local variable. See this example with `GetName()`:

![222-ss-declarelocal1.png](/images/222-ss-declarelocal1.png)

Now select "Declare Local" from the context menu or hit Control+^ (default key) which gives you a correct local variable declaration and selects the name for you:

![223-ss-declarelocal2.png](/images/223-ss-declarelocal2.png)

## Create Method

It creates a method definition out of a method call. First write down your method call:

![220-ss-createMethod1.png](/images/220-ss-createMethod1.png)

Opening the context menu and selecting "Create method" gives you:

![221-ss-createMethod2.png](/images/221-ss-createMethod2.png)

## Extract Method

This refactoring tool could be found in the context menu when selecting a part of the text. It generates a method out of a block of code and automatically adds the required parameters, based on the variables being used in the block of code.

## Create Class

Create class (or struct) is almost the same as CreateMethod. Just do a "new" operation and let MonoDevelop create the type (in a new file) for you.

## Introduce Constant

It is the fastest way to define a constant out of a magic number (or string).

Example:

![228-ss-introduceconstant1.png](/images/228-ss-introduceconstant1.png)

In this method a constant is used.  This constant should be given a better name. Select the constant, open the context menu and hit "Introduce Constant". A dialog appears where you could name the new constant. After you have named it the source should look like:

![/images/229-ss-introduceconstant2.png](/images/229-ss-introduceconstant2.png)

You can edit the refactoring key bindings from the option menu of MonoDevelop Preferences menu menu:

![tutorial222.png](http://img254.imageshack.us/img254/7505/tutorial222.png)

There are many other Refactoring tools and of course there is a way to write your own Refactorings but for more information check this article:

[https://www.monodevelop.com/developers/articles/refactoring/](/developers/articles/refactoring/)
