---
title: Policy System
redirect_from:
  - /Developers/Articles/Policy_System/
  - /Developers/Articles/The_Policy_System/
---

Policies
--------

Policies are organisation-specific conventions that are applied to a solution. This makes it possible to ensure that all contributors are using the same style for their code, are following the commit policies, naming guidelines, and so forth.<br/>
Policies may be set in several places:

### The Default Policies dialog

This is used for editing the policies that are applied to new solutions, or solutions that do not have policies set. Each panel in this dialog corresponds to a policy. Each of these  panels has a combo box that the top that can be used to select a named policy.<br/>
If the current policy matches any of the built-in named policies, that policy's name will be displayed in the combo box.

In future it will be possible to use this dialog to save named sets of policies, so that users will be able to choose from their own named sets when creating a new solution, or apply these named sets to existing solutions.

### Solution Options

The policy panels that are in the *Default Policies* dialog are also included in the Options dialog for solutions, where they may be used to edit the policies used for that solution. These policies will be saved into the solution file, to ensure that all contributors are using the same set of policies.

### Project/Solution Folder Options

The policy panels are also included in the Options dialog for projects and solution folders. An additional "Parent" choice is available in the named policy combo, and means that the project or solution folder will use its parent solution or solution folder's value for this policy.<br/>
By default, all solution folder and project policies use the parent value. Taken together, these options allow overriding the solution policies for any project, but the default cascading of values from the parents make it easy to control the policies when this granularity is not needed.

Implementing policies
---------------------

### Policy objects

Each policy type is a CLR type. This type should be serializable using the MonoDevelop.Core.Serialization infrastructure. Note that all default values are ignored during serialization. The type should be sealed, should implement `IEquatable<T>`, and should also be immutable, to ensure consistency at runtime.

The policy type should be registered as an extension:

``` xml
<Extension path = "/MonoDevelop/ProjectModel/PolicyTypes" >
    <PolicyType id="PolicyId" class="TypeName" />
</Extension>
```

### Named Policies

Named policy sets are registered as extensions:

``` xml
<Extension path = "/MonoDevelop/ProjectModel/PolicySets" >
     <PolicySet id="policyid" _name="Policy Name">
        <Policies resource="policies.xml" />
     </PolicySet>
</Extension>
```

The policies xml file contains any number of policies, in their raw serialized XML form. Note that policies saved into projects and solutions are serialized as a diff relative to the closest named policy; such "diff policies" may not be used when registering policies<br/>
 for named sets.

Other addins can add policies to existing named policy sets:

``` xml
<Extension path = "/MonoDevelop/ProjectModel/PolicySets/policyid" >
    <Policies resource="policies.xml"/>
</Extension>
```

To ensure that users' policy settings are preserved, the policies registered to a given set **id** must never change, though they may be supplemented by additional values. It is acceptable to add a new policy set with the same **name**, but a different id, so changes to policy sets may be versioned in this way. In future it may be possible to have hidden sets, in order to hide deprecated policies while preserving the ability to deserialise users' policy settings correctly.

### Policy panels

Policy panels should subclass `MonoDevelop.Projects.Gui.`\<wbr/\>`Dialogs.PolicyOptionsPanel<T>`, where T is the type of the policy object they're intended to be used to edit. The following members should be overridden:

``` csharp
// create the GTK widget for the panel
Widget CreatePanelWidget ()
// the translated label for the named policy combo, with a '_' mnemonic
PolicyTitleWithMnemonic { get; }
// return a new policy object corresponding to the current values of the editing widgets
T GetPolicy ()
// set the editing widgets' values from a policy object
LoadFrom (T policy)
```

In addition, the following method should be called whenever the widgets' state changes:

``` csharp
void UpdateSelectedNamedPolicy ()
```

When all of these are implemented, all behaviours will work correctly: applying or cancelling changes, updating the named policies combo to match the current values, applying named policy selections to the widgets, etc. No interaction with the policy service or base panel methods is required.

The policy panel should be registered as an extension for the Default Policy dialog:

``` xml
<Extension path = "/MonoDevelop/ProjectModel/Gui/DefaultPolicyPanels">
    <Section id = "panelId" _label = "Panel Name" fill="true" class="PanelClassName" />
</Extension>
```

And as an extension for the Solution and SolutionItem (project, solution folder) options dialogs:

``` xml
<Extension path = "/MonoDevelop/ProjectModel/Gui/ItemOptionPanels">
    <ComplexCondition>
        <Or>
            <Condition id="ItemType" value="SolutionItem" />
            <Condition id="ItemType" value="Solution" />
        </Or>
        <Section id = "panelId" _label = "Panel Name" fill="true" class="PanelClassName" />
    </ComplexCondition>
</Extension>
```

### Using Policies

To get the policy for a project, use `project.Policies.Get<T> ()`, where `T` is the type of the policy. This will cascade the policy from the parent if necessary. To receive a notification when the policy changes, subscribe to the `project.Policies.PolicyChanged` event. This event will also be fired when cascaded policies change.
