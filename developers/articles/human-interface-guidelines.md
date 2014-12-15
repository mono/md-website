---
title: Human Interface Guidelines
redirect_from:
  - /Developers/Articles/Human_Interface_Guidelines/
  - /Human_Interface_Guidelines/
---

Since MonoDevelop is a GNOME application it has to follow the [GNOME Human Interface Guidelines](http://developer.gnome.org/projects/gup/hig/2.0). This document is a summary of the most important rules, with some MonoDevelop specific changes.

### Window Layout

Basic rules:

-   Leave a 12-pixel border between the edge of the window and the nearest controls.
-   Leave a 6-pixel horizontal gap between a control and its label.
-   Always align labels to the left.
-   In dialogs, set the Has Separator property to true, unless the main widget of the dialog is a Notebook, a TreeView or any other widget with a frame.

Here are some simple steps to configure the spacing in a dialog:

-   Set the dialog Border Width to 6
-   Select the dialog's main VBox. Set Border Width to 0 and the Spacing to 6
-   Select the dialog's action area (the HButtonBox). Set Border Width to 6 and the Spacing to 6.
-   Select the container you placed inside the main area of the dialog. Set Border Width to 6.

### Capitalization

There are two styles of capitalization: **Sentence capitalization** (capitalize the first letter of the first word) and **Header capitalization** (Capitalize all words in the element, excluding articles, conjunctions and prepositions).

See the table [Capitalization Style Guidelines for User Interface Elements](http://developer.gnome.org/projects/gup/hig/2.0/design-text-labels.html#layout-capitalization) to know which style has to be used for each element type.

### Default Activation Buttons in Dialogs

In general, pressing Enter on a dialog should be the same as clicking on the OK button. To implement this behavior you can do the following:

-   Select the OK button in the designer. Set the HasDefault property to True.
-   Select every Entry widget of the dialog and set the ActivatesDefault property to True.
