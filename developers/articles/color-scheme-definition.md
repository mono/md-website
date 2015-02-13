---
title: Color Scheme Definition
redirect_from:
  - /Developers/Articles/Color_Sheme_Definition/
---

Color scheme files define colors which are used inside the text editor and syntax mode definitions. Every color used by the editor is defined inside a sheme.

Scheme files are defined in xml with following syntax:

``` xml
<EditorStyle name="[NAME]" _description="[DESCRIPTION]">
    <Color name="[COLOR]" value="#RRGGBB"/>
    ...
    <Style name="[STYLE]" color="[COLOR]"/>
    ...
</EditorStyle>
```

First a custom palette can be defined (but it's not required since the color attributes of the styles can use a color value directly). Color values have the form \#RRGGBB or \#AARRGGBB. Beside that html palette colors ("red", "green", "blue", ...) is supported as well.

Style tags can either be nested (then the name of the nested style is PARENT.CHILD) or be just a 'list'. Example - these definitions are the same: 

``` xml
<Style name="string" color="red"/>
<Style name="string.single" color="red"/>
<Style name="string.double" color="red"/>
<Style name="string.other" color="red"/>
```

And:

``` xml
<Style name="string" color="red">
    <Style name="single" color="red"/>
    <Style name="double" color="red"/>
    <Style name="other" color="red"/>
</Style>
```

The syntax highlighting engine takes the parent color, if a child color is requested that isn't available. Therefore you could just do this:

``` xml
<Style name="string" color="red">
```

This is exactly the same as the definitions above.

For a recent list of all color names refer the OblivionStyle.xml from the Mono.TextEditor project.
