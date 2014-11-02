---
title: WebKit Port of AspNetEdit
redirect_from:
  - /Developers/Tasks/Web_Development/WebKit_Port_of_AspNetEdit/
  - /WebKit_Port_of_AspNetEdit/
  - /Proposal:_WebKit_Port_of_AspNetEdit/
  - /Proposals/Proposal:_WebKit_Port_of_AspNetEdit/
  - /Developers/TODO/Proposals/Proposal:_WebKit_Port_of_AspNetEdit/
  - /Developers/Proposals/Proposal:_WebKit_Port_of_AspNetEdit/
  - /Developers/Proposals/WebKit_Port_of_AspNetEdit/
---

<span id="_task_a_Web.Webkit"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|----------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                    | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-High" style="font-size: x-small;">High</span> | <span class="task-target" style="font-size: x-small;"></span> |

### Objectives

-   Make the ASP.NET designer stable and complete.
-   Improve reliability and ease-of-maintenance of the ASP.NET designer.
-   Evolve the ASP.NET designer into a powerful HTML editing solution that can supplement manual editing of any (templated) HTML page.
-   Implement a "split view" with live updating between the designer and the source.

### Reasons for the Redesign

#### Problems with the Existing Editor

-   The Mozilla Composer editor mangles HTML very badly (converts it into bad HTML4)
-   The editor is hard to install due to the poor Mozilla embedding APIs.
-   The HTML editing is a XUL/JS app, and the author/maintainer abandoned it before completing it.
-   Lack of Mozilla bindings led to creating a hacky "bridge", which makes it even harder to maintain and develop going forwards.
-   As of Firefox 3.6, Mozilla has completely broken the embedding mechanism needed by the designer's XUL/JS app.

#### Potential for Increased Userbase

-   There is no good web editor on Linux that can even remotely compete with DreamWeaver and Expression Web. We're in a prime position to take this space.
-   ASP.NET is one of our most compelling stories, and this will increase with MVC.
-   It will support the Moonlight development story.
-   This will attract developers to MonoDevelop, which will have a halo effect for Mono.

### Architectural Plans

#### WebKit's Advantages over Gecko

-   WebKit is much easier to embed than Gecko, and has better API stabilty commitments.
-   WebKit has **much** better Mono bindings.
-   WebKit's editing story is much stronger than Mozilla's (particularly Mozilla Composer, which has been unmaintained for many years).
-   WebKit-GTK developers care about embedders, and are Mono-friendly.

#### High-Level Design

In order to implement a designer/source split view, the HTML/ASP.NET editor needs to handle three editing modes simultaneously: the HTML editing surface, the text editor, and the control host (editable via the property grid). Each of these has some sort of internal representations of the document (a DOM), and it is not feasible for them all to operate on the same DOM.

The following architecture is proposed: [![700px](/images/404.png)](/images/404.png "File:Media_Gallery/HtmlEditorArchitecture.png")

Edits to the document will be encapsulated in Action objects, which will be sent to the Editing Manager. This is responsible for broadcasting the changes to the DOMs. The editing manager also tracks selection using the mechanism, and the application of styles to the selected elements.

The ASP.NET host runs in a separate AppDomain or process so that third-party controls can be unloaded. The overall design should not exclusively support ASP.NET; it should be flexible enough to allow other control hosts and templating systems. The WebKit editor will treat these as unmodifiable blobs of HTML.

#### Features Required in WebKit

-   Full DOM access from managed code
-   Intercept (and approve/deny) text editing events
-   Text selection change events
-   Selection of elements, with selection outline and resizing handles
    -   Overlay for uneditable elements that doesn't interfere with CSS
    -   Ability to have uneditable "compound elements" for templating
        -   Editable sub-regions in compound elements?
    -   Drag-n-drop
        -   With control over drop locations
-   Ability to disable user JavaScript
