---
title: Refactoring preview
redirect_from:
  - /Developers/Tasks/Source_Editing/Refactoring_preview/
  - /Proposal%3A_Refactoring_preview/
  - /Proposals/Proposal%3A_Refactoring_preview/
  - /Developers/TODO/Proposals/Proposal%3A_Refactoring_preview/
  - /Developers/Proposals/Proposal%3A_Refactoring_preview/
  - /Developers/Proposals/Refactoring_preview/
---

### Description

Refactoring means changing the code without breaking it. But that doesn't mean that the IDE should automatically change all code without letting the user know how the new code looks like.

### How it should work

Each refactoring dialog should have a â€œpreviewâ€? button. And then a preview of the refactoring should be showed where the user can select â€œcommitâ€? or â€œcancelâ€?. This gives more control over the refactoring. And it helps to make refactoring bugs more obvious.

As well it doesn't make things more complicated for the user because he can choose not to view the preview.

### Implementation

The current refactoring infrastructure needs to be changed. The commands should not longer make the actual changes. Instead they need to give back a list of replace operations.

Should not take longer than 2-3 days to implement.

Side effects: All parts that use the refactoring commands need to be changed. This will affect for example the implement & override members dialog.

 [Proposals](http://www.monodevelop.com/Proposals)


