---
title: Refactoring
redirect_from:
  - /Documentation/Feature_List/Refactoring/
---

MonoDevelop has support for some refactoring operations.

### Rename

The rename operation can be found in the context menu of the text editor when the item to rename is clicked or simply activated by the F2 (default settings) key.

![ss-Rename Class.png](/images/217-ss-Rename-Class.png)

In MonoDevelop when a refactoring changes more than just the current source file a preview dialog can be shown that contains all changes done by that refactoring:

![ss-Refactoring Preview.png](/images/218-ss-Refactoring-Preview.png)

The operations are shown as diffs (like in the version control dialog):

![ss-Refactoring Preview2.png](/images/219-ss-Refactoring-Preview2.png)

### Extract Method

Extract method can be found in the context menu when selecting a part of the text.

### Create Method

Create method creates a method definition out of a method call.

First write down your method call:

![ss-createMethod1.png](/images/220-ss-createMethod1.png)

Open the context menu and select "Create method" gives you:

![ss-createMethod2.png](/images/221-ss-createMethod2.png)

### Create Class

Create class (or struct) is almost the same as CreateMethod. Just do a "new" operation and let MonoDevelop create the type (in a new file) for you.

### Declare Local

Declare local declares a local variable out of an expression.

This function can really speed up development. First type the initializer for your local variable. See this example with "<span style="font-size: larger;">`GetName()`</span>":

![ss-declarelocal1.png](/images/222-ss-declarelocal1.png)

Now select "Declare Local" from the context menu or hit Control+^ (default key) which gives you a correct local variable declaration and selecting the name for you:

![ss-declarelocal2.png](/images/223-ss-declarelocal2.png)

### Introduce Constant

Introduce constant is a fast way to define a constant out of a magic number (or string).

See this example:

![ss-introduceconstant1.png](/images/228-ss-introduceconstant1.png)

In this method a constant is used. Now this constant should be given a better name. Select the constant, open the context menu and hit "Introduce Constant". A dialog appears where you could give the new constant a name. After you named the constant the source should look like:

![ss-introduceconstant2.png](/images/229-ss-introduceconstant2.png)

### Integrate Temporary Variable

[TODO]


