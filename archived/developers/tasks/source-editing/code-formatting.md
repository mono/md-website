---
title: Code Formatting
redirect_from:
  - /Developers/Tasks/Source_Editing/Code_Formatting/
  - /Proposal%3A_Code_Formatting/
  - /Proposals/Proposal%3A_Code_Formatting/
  - /Developers/TODO/Proposals/Proposal%3A_Code_Formatting/
  - /Developers/Proposals/Proposal%3A_Code_Formatting/
  - /Developers/Proposals/Code_Formatting/
---

Code formatting should be done on all newly created files and on user request with a "Format" command in the edit menu.

The format styles should be set in the policy dialog. Code formatting should be a policy because different projects may follow different code style rules.

### Configuration Dialog

The configuration dialog should look like:

![Image:StyleSettings.jpg](/images/404.png)

In the option categories panel should be a tree with all categorized available options.

For example:

-   Braces
    -   Delcarations
        -   Class
        -   Method
        -   ...

<!-- -->

-   Spaces
    -   Before Parentheses
        -   Method declaration
        -   Method call
        -   if statement
        -   ...

<!-- -->

-   Indentation
    -   Class Members
    -   Blocks
    -   ...

In the option panel the user should be able to set the options he chooses. In the code preview panel a source code preview should be shown to demonstrate what the option does.

### Style Definition

For each language a xml file should describe:

-   Which option categories are available
-   Which options are available for each category item
-   The code preview for each option category

The style definition should be connected to a mime type and a code formatter and the code formatter should be able to take a property object that contains all the options with the user defined values to format a text file.

### Implementation

An intelligent code formatter needs to be build with a library like nrefactory to generate a DOM out of a document and this DOM needs to be printed out with a output formatter that takes the style definition.

The hard part is that it shouldn't destroy any code and that it needs to be able to handle syntax errors. The simple solution for syntax errors would be that the formatting just stops at the first syntax error and the code after the error remains unchanged.

The documentation must be left intact. This can be done with synchronizing the outputted code with the original one at lexer level.

### Side effects

None that I'm aware of.

### Future

It would be nice if the style settings are applied to source code on the fly while typing.

[Proposals](http://www.monodevelop.com/Proposals)
