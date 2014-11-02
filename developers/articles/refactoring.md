---
title: Refactoring
redirect_from:
  - /Developers/Articles/Refactoring/
---

Refactoring is 'just' code reorganization. For these code reorganization tasks pattern were invented. These patterns can be automated and modern development environments do this to make the reoganization progress less painful for developers.

### Refactoring in MonoDevelop

MonoDevelop defines the refactoring system in the MonoDevelop.Refactoring addin.

A refactory in MonoDevelop inherits from the abstract Refactoring class. A refactoring basically does:

-   Plug into the IDE context menu. It knows when it is valid for a specific context & has a menu entry.
-   It has a 'run' command which shows the refactoring 'options' dialog.
-   It doesn't do all the changes instead it gives a list of Change objects that do the changes step by step. The changes are executed by the refactoring service.

See the rename refactoring:

![ss-Rename Class.png](/images/216-ss-Rename%20Class.png)

The rename refactoring is a good example of how refactoring dialogs should look like. They should have some options for the refactoring and they need to validate these options. (for the rename refactoring not any given method name is valid for example)

The refactorings should be able to commit the refactoring at once or show a preview dialog. The preview dialog can be shared accross all refactorings:

![ss-Refactoring Preview.png](/images/215-ss-Refactoring%20Preview.png)

The preview dialog lists all source code changes step by step in human readable form and a diff can be shown for each step, if it changes the source code. (a file rename/remove has no diff)

If a refactoring has no options then just the preview dialog should be showed to let the user know what will change in it's source.

### Writing own Refactorings

Writing own refactorings is pretty straightforward. Inherit from the Refactoring base class and put the refactoring into the addin-tree (see the rename refactoring as a starting point). If the refactoring is general the refactoring should be put into MonoDevelop.Refactoring. There is a infrastructure supporting NRefactory based refactorings. Language specific refactorings should be put into the language bindings itself.

#### Understanding refactorings

Refactorings should inherit from the `RefactoringOperation` base class.

``` csharp
public abstract class RefactoringOperation
{
    public string Name {
        get;
        set;
    }
    public virtual string GetMenuDescription (RefactoringOptions options);
    public virtual bool IsValid (RefactoringOptions options);
    public abstract List<Change> PerformChanges (RefactoringOptions options, object properties);

    public virtual void Run (RefactoringOptions options);
}
```

If `IsValid` is true a menu command is created (using `GetMenuDescription`) when the item is clicked the `Run` method is executed. The <`Run` method simply runs `PerformChanges` and executes them. If a dialog should be shown this method needs to be overwritten. What it's important is that the refactorings only require the `RefactoringOptions` class. This class contains:

-   The Dom
-   The current Document
-   The selected item OR resolve result

Currently RefactoryCommands creates two different menus one that contains refactoring operations that work on a part of text - like "extract method" and one that works on a specfic object like "rename". For the item specific menu the selected item property is set.

#### Adding new refactorings

Some simple steps:

-   Create a refactoring class that inherits from `RefactoringOperation`
-   Add your refactoring to the addin-tree in /MonoDevelop/Refactoring/Refactorings

Example:

``` xml
<Extension path = "/MonoDevelop/Refactoring/Refactorings">
    <Class id="Rename" class = "MonoDevelop.Refactoring.Rename.RenameRefactoring" />
</Extension>
```

-   Test your refactoring carefully that it doesn't break something

#### Cross Language Refactorings

MonoDevelop is a cross language development environment and refactorings need to support such environments. If a refactoring is implemented it needs to handle cross-language solutions. For the first approach it is enough to inform the user, if the refactoring can't be performed for all projects that may be affected.

Adding new languages to the refactoring system should be as easy as possible. It requires the implementation of the IRefactorer, INRefactoryASTProvider and IResolver interface. If these interfaces are not available the refactorings are not beeing executed.

Language specific refactorings are not required to use the common refactoring infrastructure - therefore they can implement their own infrastructure and don't need to depend on the current infrastructure.
