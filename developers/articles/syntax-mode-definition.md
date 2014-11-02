---
title: Syntax Mode Definition
redirect_from:
  - /Developers/Articles/Syntax_Mode_Definition/
  - /Developers/Articles/Refactoring/Syntax_Mode_Definition/
---

Syntax Mode Definition
----------------------

The syntax modes in MonoDevelop are defined using XML. These XMLs can be extended by:

-   Adding the xml file to the Mono.TextEditor assembly as resource
-   Letting an addin (for example language binding) add the xml file/resource via the addin tree (/MonoDevelop/SourceEditor2/SyntaxModes)
-   Put the xml file into the `~/.config/MonoDevelop/syntaxmodes` directory, and MonoDevelop will load it automatically (`C:\Users\$USER\AppData\Roaming\MonoDevelop\syntaxmodes` on Windows Vista, and `C:\Documents and Settings\Users\$USER\Application Data\MonoDevelop\syntaxmodes` on Windows XP). This is where files that you add via the GUI in the preferences dialog are copied.

### Adding syntax mode via the addin tree

There are two options how a syntax mode xml can be provided:

-   Per file name. Give the path relative to the addin dll

`<Templates file="RELATIVE_PATH_OF_THE_XML"/>`

-   As resource embedded in the addin dll

`<Templates resource="NAME_OF_THE_RESOURCE"/>`

The syntax mode extension path is "/MonoDevelop/SourceEditor2/SyntaxModes".

I would recommend giving us the syntax mode. I'll put it into the texteditor dll and then monodevelop has more languages it supports.

Syntax Mode Xml
---------------

Each syntax mode xml needs to contain one SyntaxMode tag. All other nodes are placed into this tag. The <span style="font-size: large;">`SyntaxMode`</span> tag defines a name for the mode (e.g. the language it highlights in human readable form) and the mime type the syntax mode applies to:

``` xml
<SyntaxMode name = "C#" mimeTypes="text/x-csharp">

</SyntaxMode>
```

Note: It can be specified more than one mime type, seperated by ';'.

### Mime Types

It may be that you have to add the mime type, because it is unknown. MonoDevelop has an own mime type definition method using the addin tree. How the mime type system works should be part of a seperate article. However to make it short here an example of the il mime type definiton:

``` xml
<Extension path = "/MonoDevelop/Core/MimeTypes">
  <MimeType id="text/x-ilasm" _description="il files" isText="true">
    <File pattern="*.il" />
  </MimeType>
</Extension>
```

When adding own mime types just add your type to this addin file (or to your addin):

`monodevelop/main/src/core/MonoDevelop.Core.Gui/MonoDevelop.Core.Gui.addin.xml`

### The EolSpan Tag

The `EolSpan` tag is a short form of the [Span](#the-span-tag) tag. The difference is that it has only a begin string and it ends at end of line. The tag content is the begin string. All attributes that are valid for the [Span](#the-span-tag) tag can be applied to `EolSpan` tags too.

Example for C# line comments:

``` xml
<EolSpan color = "comment.line" rule="Comment" tagColor="comment.tag.line">//</EolSpan>
```

The eol span looks in a source file like this:
![ss-eolSpan.png](/images/267-ss-eolSpan.png)

### The Keywords Tag

The `Keywords` tag specifies a list of keywords to be highlighted. The `Keywords` tag has following attributes:

|---------------|--------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Attribute** | **Required** | **Description**                                                                                                                                      |
| color         | yes          | The color of the keywords.                                                                                                                           |
| ignorecase    | no           | If true, the case of the keywords is ignored. If the tag is not specified the ignorecase from the rules in which the keywords are defined are taken. |

The Keywords are defined by `Word` tags that are childs of the `Keywords` tag.

Example from VB.NET syntax mode:

``` xml
<Keywords color = "keyword.selection">
    <Word>If</Word>
    <Word>Then</Word>
    <Word>Else</Word>
    <Word>ElseIf</Word>
    <Word>EndIf</Word>
    <Word>Select</Word>
    <Word>Case</Word>
</Keywords>
```

#### Delimiters

If inside key words are some non letter/digit chars used it may be required to specify special delimiters for that syntax mode. Delimiters are the chars between the keywords. The standard delimiters are: `&()\<\>{}[]~!%^\*-+=|\\\\\#/:;\\"' ,\\t.?`. Each rule can specify different delimiters. Delimiters are specified using the `Delimiters` tag and a string.

For example:

``` xml
<Delimiters>&amp;&lt;&gt;~!@%^*()-+=|\#/{}[]:;"' ,    ?</Delimiters>
```

#### Colors

At the point of writing following colors can be used for the keywords. Note that due to the MonoDevelop styles it is currently not possible to define own colors (But you can request some). The syntax mode definitions should make rich use of these color definitions. It's up to the syntax styles if the highlighted source looks more colorful or not.

General text colors:

-   text
-   text.punctuation
-   text.link
-   text.preprocessor
-   text.preprocessor.keyword
-   text.markup
-   text.markup.tag

Colors used by comments:

-   comment
-   comment.line
-   comment.block
-   comment.doc
-   comment.tag
-   comment.tag.line
-   comment.tag.block
-   comment.tag.doc
-   comment.keyword
-   comment.keyword.todo

Colors for strings:

-   string
-   string.single
-   string.double
-   string.other

Colors for constants:

-   constant
-   constant.digit
-   constant.language
-   constant.language.void

Colors for keywords:

-   keyword
-   keyword.access
-   keyword.operator
-   keyword.operator.declaration
-   keyword.selection
-   keyword.iteration
-   keyword.jump
-   keyword.context
-   keyword.exceptions
-   keyword.modifier
-   keyword.type
-   keyword.namespace
-   keyword.property
-   keyword.declaration
-   keyword.parameter
-   keyword.misc

### The Match Tag

A match is simply a regular expression that is colorized. An example for this are numbers. The match content is the regular expression to match and the match has only one attribute: color (See the [Keywords](#the-keywords-tag) section for a list of colors).

Note that you'll find 'CSharpNumber' as content of the Match tags. This is a hard coded regular expression for C# numbers. Its faster than using the regex engine of C#. Unfortunately the regex engine only works on strings and not on custom character sequences. Therefore the perfomance penalaty of regexes can be too high in some cases.

### The Property Tag

A property is a key/value pair. The `Property` tag inside a syntax mode specifies language specific properties that are used by some of MonoDevelop's commands. They don't directly influence the syntax highlighting.

At the point of writing following properties can be defined:

|-------------------|---------------------------------------------------------------------|
| **Property**      | **Description**                                                     |
| LineComment       | The tag that starts a single line (comment to end of line) comment. |
| BlockCommentStart | The tag that starts a block comment.                                |
| BlockCommentEnd   | The tag that ends a block comment.                                  |
| StringQuote       | The quotation mark                                                  |

Note that a property is always a list. Multiple line comments can be defined by specifying morge than one LineComment property.

In C# syntax a property in the MonoDevelop syntax mode is: KeyValuePair\<string, List\<string\>\>

Example properties from the C# backend binding:

``` xml
<Property name="LineComment">//</Property>
<Property name="BlockCommentStart">/*</Property>
<Property name="BlockCommentEnd">*/</Property>
<Property name="StringQuote">"</Property>
<Property name="StringQuote">'</Property>
```

### The Rule Tag

The `Rule` tag needs to be placed inside the [SyntaxMode](#syntax-mode-xml) tag. Each `Rule` tag defines an own set of delimiters, keywords, spans and matches that can be used for highlighting specific parts of the buffer. The different rules that ar being used to highlight different parts of the buffer are defined using the `Span` tag.

A `Rule` tag has following attributes:

|------------|--------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Name**   | **Required** | **Description**                                                                                                                                                                                                                                                                  |
| name       | yes          |  The name to identify this rule                                                                                                                                                                                                                                                  |
| color      | no           |  The default color of this rule, if it is not specified default color will be 'text'                                                                                                                                                                                             |
| ignorecase | no           | If true, the case of the keywords specified in this rule are ignored. If the tag is not specified the ignorecase from the syntax mode in which the rule is defined will be taken. Note that <span style="font-size: large;">`Keywords`</span> tags may be override this setting. |

Example rule from C# mode:

``` xml
<Rule name = "Comment">
    <Keywords color="comment.keyword.todo" ignorecase="True">
        <Word>TODO</Word>
        <Word>FIXME</Word>
        <Word>HACK</Word>
        <Word>UNDONE</Word>
    </Keywords>
</Rule>
```

These rule is applied to comments. In the editor it looks like:

![ss-rulesInAction.png](/images/268-ss-rulesInAction.png)

### The Span Tag

A span is a part of the buffer that is highlighted differently using a begin and an end string. The begin and end strings ar specfied as childs of the `Span` tag.

A `Span` tag can have following attributes:

|-----------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Name**  | **Required** | **Description**                                                                                                                                         |
| rule      | no           | The rule that is valid inside the span. If no rule is specified the current rule is taken. If no keywords should be highlighted point to an empty rule. |
| color     | no           | The default color of the span content ('text' is default color).                                                                                        |
| tagcolor  | no           | The color of the begin and end string (default is the span color).                                                                                      |
| escape    | no           | A string that is taken as escape inside the span. This escape string may contain the end string. For example \\" is the escape string for C# strings.  |
| stopateol | no           | If true an end of line stops the span, otherwise it will be a multiple line span. The default is 'false'.                                               |

Note that the order in which the spans are defined is important. When there is a span that starts with a prefix of an other span's begin string it needs to be specified before the other span. Otherwise the other span would always be taken.

 Example for C# block comments:

``` xml
<Span color = "comment.block" rule="Comment" tagColor="comment.tag.block">
   <Begin>/*</Begin>
   <End>*/</End>
</Span>
```

The comment block span in the editor is like:
![ss-blockSpan.png](/images/266-ss-blockSpan.png)

#### Begin and End tags

The Begin and End tags can specify a 'flag' attribute that can give a bit more information about where the tags are valid.

-   startsLine: If true, the tag must be at column 1
-   firstNonWs: If true only whitespaces in the line where the tag are allowed before the tag.
