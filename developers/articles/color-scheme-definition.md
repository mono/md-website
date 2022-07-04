---
title: Color Scheme Definition
redirect_from:
  - /Developers/Articles/Color_Sheme_Definition/
  - /developers/articles/color-sheme-definition/
---

Color scheme files define colors which are used inside the text editor and syntax mode definitions. Every color used by the editor is defined inside a scheme.

In recent versions of MonoDevelop Color scheme files are defined in JSON with the following syntax:

``` json
{
    "name":"%NAME%",
    "version":"%VERSION%",
    "description":"%DESCRIPTION%",
    "originator":"%ORIGINATOR%",
    "colors":[
        {"name": "%NAME - example: Background(Read Only)%", "color":"#RRGGBB", "secondcolor":"#RRGGBB", "bordercolor":"#RRGGBB"},
    ],
    "text":[
        {"name": "%NAME - example: Plain Text%", "fore":"#RRGGBB", "back":"#RRGGBB", "weight":"%WEIGHT - example: Bold%", "style":"%STYLE - example: Italic%"},
    ]
}
```

More information about valid names and values can be gained from exported color scheme definitions. To do this, open up MonoDevelop, go to Edit / Preferences / Text Editor / Syntax Highlighting, select a Color scheme, and click Export.
MonoDevelop is also able to import Visual Studio Color Schemes. This can be done in Edit / Preferences / Text Editor / Syntax Highlighting with the Add button, where you can browse to the previously downloaded Color scheme file and import it to MonoDevelop.

In older versions Color scheme files are defined in xml with following syntax:

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
