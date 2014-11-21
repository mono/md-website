---
title: Code Style Policies
redirect_from:
  - /Developers/Tasks/Source_Editing/Code_Style_Policies/
  - /Developers/Proposals/Code_Style_Policies/
---

<span> </span>

<span id="_task_a_SourceEditing.CodeStyle"></span><span> </span>

|----------------------------------------------------------------------------------|--------------------------------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                              | **<span style="font-size: x-small;">Owner</span>**                 | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                        | **<span style="font-size: x-small;">MD Version</span>**          |
| <span class="task-status-Completed" style="font-size: x-small;">Completed</span> | <span class="task-owner" style="font-size: x-small;">mhutch</span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-Medium" style="font-size: x-small;">Medium</span> | <span class="task-target" style="font-size: x-small;">2.2</span> |

API
---

Code styles will require adding support for per-mimetype policies to the policy service and policy bag.

The extension will have a mimetype:

``` xml
<Extension path = "/MonoDevelop/ProjectModel/<wbr/>PolicyTypes" >
      <PolicyType id="XmlStylePolicy" class="MonoDevelop.XmlEditor.<wbr/>XmlStylePolicy" mimetype="application/xml" />
</Extension>
```

It will also be necessary to be able to set up cacades of settings between mimetypes. However, the vast majority of cascades can be covered by an implicit cascade to text for all files editable by the text editor, and an implicit cascade to xml to all "+xml" mimetypes.

It should also be possible to define explicit cascades:

``` xml
<Extension path = "/MonoDevelop/ProjectModel/<wbr/>PolicyMimeTypeCascades" >
      <Cascade from="application/x-aspx" to="text/html" />
</Extension>
```

API additions such as the following would be necessary:

``` csharp
IMimeTypePolicy<T> : IEquatable<T>, class
{
      string MimeType { get; }
}

PolicySet.Get<T> (string mimetype) : IMimeTypePolicy
PolicyService.<wbr/>GetDefaultPolicy<T> (string mimetype) where T : IMimeTypePolicy<T>, new ()
PolicyBag.Remove<T> (string mimetype)
PolicyBag.Has<T> (string mimetype)
PolicyBag.Get<T> (string mimetype)
```

(and the same for all the equivalent non-generic methods, where they exist)

The get/set/has/remove methods would have to be aware of IMimeTypePolicy, and could no longer use a single type-keyed dictionary. Serialisation code would have to handle this too. It might be possible to add diff serialization support for diffs between mimetypes, but this isn't really necessary.

Cascades
--------

Text editor settings (tabs/spaces etc) should be able to be set for any mimetype. The existing TextStylePolicy must be attached to the text mimetype.

Consider a XAML file, which could have the cascade text-\>XML-\>XAML. The text editor requests a TextStylePolicy for XAML on a project. If the policy object is not set on the project, it cascades to the solution folder, solution etc. If the TextStylePolicy+XAML doesn't exist on the solution, the behaviour diverges from non-mimetype policies. Instead, the mimetype cascade comes into play, and it starts trying to resolve TextStylePolicy+XML from the project. If this cascade fails, it tries to resolve TextStylePolicy+text. If this cascade reaches the solution and no object is found, only then will it create a new default TextStylePolicy+text object on the solution.

Consider now an XmlStylePolicy. This would be a mimetype policy attached to the XML mimetype, so the setting would be available for all mimetypes with a cascade to XML.

GUI
---

This is a powerful and flexible system, which makes it difficult to expose as a GUI.

The plan was to have a single policy panel for the project/solution/default options dialogs, which would contain a "summary" of policies: a flat list of all mime types with policies, and combo cell editors for picking named policies. Mimetypes would be displayed with their "friendly" name (available from the platform service), not the literal mimetype string.  An "Advanced" or "Custom" button would open up the Advanced Code Style dialog.<br/>
 Note that all mimetypes with a "specific" policy type, e.g. XmlStylePolicy, would automatically be in this list, since at least one instance of any policy type that's used is saved on the solution.

The Code Style dialog would contain a treeview on the left, showing mimetypes hierarchically grouped using their cascades. There might also be a combo cell editor in this treeview for named policies. There would be a button for adding additional mimetypes.

Selecting an item in the treeview would cause a policy settings panel to show on the right, as with other options dialogs. This would have the combo box at the top that the other policy panels have (is this necessary if the treeview has a cell editor?), and all available policies for this mimetype would be shown as tabs of a notebook.

Possible Complications and Alternatives
---------------------------------------

Complications might be introduced by files that contain multiple "sub-mimetypes". E.g. aspx may contain C# (or VB), HTML, CSS, and JavaScript. We could handle this by having it cascade to all of these, but that would cause it to appear multiple times in the hierarchy. There may also be settings that are specific to aspx, such as formatting of directives. It seems likely that the only sane way to handle these pages is by having it cascade to a "primary" parent mimetype (e.g. HTML). The [ASP.NET](http://asp.net/ "http://asp.net/") editor would have to use the settings from the C# and JS mimetypes directly, except for the text settings.

Can this be handled with subclasses of TextStylePolicy? Are there ever likely to be parallel per-mimetype style policies? Baking the cascades into the class hierarchy would be quite neat, but would sort of conflict with "multi-mimetype" documents.


