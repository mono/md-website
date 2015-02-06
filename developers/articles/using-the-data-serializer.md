---
title: Using The Data Serializer
redirect_from:
  - /Developers/Articles/Using_The_Data_Serializer/
---

MonoDevelop provides a general purpose data serializer which can be used by add-ins to serialize data to files. This serializer is used by the project service to read and write projects and solutions, but it can be used to store all kinds of information. This API is available in the ***MonoDevelop.Core.Serialization*** namespace. The serializer is implemented in the **DataSerializer** class.

DataSerializer is similar to the core XML serializer, in which the process of serialization can be controlled by applying some attributes to fields and properties. The main difference is that the data serializer does not directly generate XML, but data nodes. A **DataNode** can be either a **DataValue** (a key/value pair) or a **DataItem** (a collection of DataNode).

The DataNode/DataValue/DataItem model is more or less equivalent to the XmlNode/XmlAttribute/XmlElement model. It is possible to directly serialize data into XML, using the **XmlDataSerializer** class. This class serializes an object into XML by converting DataNode objects to XmlNode objects. So DataItems will be serialized as XmlElements and DataValue objects as XmlAttribute. The **XmlConfigurationWriter** and **XmlConfigurationReader** classes allow more fine grained serialization options.

Designing Serializable Types
----------------------------

The ***MonoDevelop.Core.Serialization*** namespace defines several attributes which can be used to control the way data is serialized.

### Making a Class Serializable

There is no special attribute to be applied to a class to make it serializable. The only requirement for a class to be serializable is to have a default constructor (which can be private).

The **DataItemAttribute** attribute can be used to set the name of the type in the serialized data model. By default it's the name of the class. This attribute is optional. Here is an example of how this attribute can be used:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><strong>Class</strong></td>
<td align="left"><strong>Serialized Data</strong></td>
</tr>
<tr class="even">
<td align="left"><pre class="csharp" name="code"><code>[DataItem (&quot;DataTest&quot;)]
public class SerializationTest
{
    ...
}</code></pre></td>
<td align="left"><pre class="xml" name="code"><code>&lt;DataTest&gt;
   ...
&lt;/DataTest&gt;</code></pre></td>
</tr>
</tbody>
</table>

### Fields and Properties

An important difference between DataSerializer and other serializers is that **fields and properties are *not* serialized by default**. For a field or property to be serialized, the **ItemPropertyAttribute** attribute has to be explicitly applied to it.

The serializer generates a DataNode for each serializable member. This DataNode will be a **DataValue** if the member has a primitive value, or a **DataItem** if the member is a class (members of the class will be serialized as children of that DataItem).

**ItemPropertyAttribute** has several properties (all of them optional) that can be set to change the default serialization behavior:

-   *Name*: Name of the property in the serialized model. It's the member name by default. You can specify a nested element name. For example, the name "Data/Name" will create the property as a child of the Data element, and it will be named "Name".
-   *DefaultValue*: Default value of the member. A property won't be serialized if the assigned value is the default value.
-   *ReadOnly*: true if the member will be read but never written.
-   *WriteOnly*: true if the member will be written but never read.
-   *Scope*: When added to a collection or array member, it specifies the nesting level to which the ItemPropertyAttribute applies. This is explained in more detail below.
-   *ValueType*: Specifies the type to use for serialization, if the one declared in the member is too generic.

For example:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><strong>Class</strong></td>
<td align="left"><strong>Serialized Data</strong></td>
</tr>
<tr class="even">
<td align="left"><pre class="c#" name="code"><code>public class SerializationTest
{
    // This field won&#39;t be serialized
    int someInt;

    // This field will be serialized
    [ItemProperty]
    string someString = &quot;Hi&quot;;

    // This field will be serialized with a custom name
    [ItemProperty (&quot;CustomName&quot;)]
    int value = 44;

    // This field will be serialized, but only if its value
    // is not &quot;Bye&quot; (so it won&#39;t be serialized in this example)
    [ItemProperty (DefaultValue = &quot;Bye&quot;)]
    string someDefaultString = &quot;Bye&quot;;

    // This field will be serialized as a child element of &quot;Data&quot;
    [ItemProperty (&quot;Data/Info&quot;)]
    string someInfo = &quot;some info&quot;;
}</code></pre></td>
<td align="left"><pre class="xml" name="code"><code>&lt;SerializationTest
      someString = &quot;Hi&quot;
      CustomName = &quot;44&quot;&gt;
    &lt;Data Info = &quot;some info&quot; /&gt;
&lt;/SerializationTest&gt;</code></pre></td>
</tr>
</tbody>
</table>

### Serializing Lists

The DataSerializer will serialize an object as a collection of items if:

-   the object is an array
-   the type of the object implements IList, with a public Add method.

Lists are serialized as a **DataItem** which has a DataNode for each element of the list. The root DataItem can be customized using the **ItemPropertyAttribute** just like any other member of a type.

For example:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><strong>Class</strong></td>
<td align="left"><strong>Serialized Data</strong></td>
</tr>
<tr class="even">
<td align="left"><pre class="c#" name="code"><code>public class SerializationTest
{
    // A simple collection of strings
    [ItemProperty (&quot;Names&quot;)]
    List&lt;string&gt; names = new List&lt;string&gt; ();

    public SerializationTest ()
    {
        names.Add (&quot;Jordi&quot;);
        names.Add (&quot;Maria&quot;);
    }
}</code></pre></td>
<td align="left"><pre class="xml" name="code"><code>&lt;SerializationTest&gt;
    &lt;Names&gt;
        &lt;String&gt;Jordi&lt;/String&gt;
        &lt;String&gt;Maria&lt;/String&gt;
    &lt;/Names&gt;
&lt;/SerializationTest&gt;</code></pre></td>
</tr>
</tbody>
</table>

#### Customizing the Serialization of Collection Elements

By default, elements of the list are serialized using the type name of the element type as the name for the DataNode. It is also possible to customize the serialization of the list elements by using the **ItemPropertyAttribute**. In this case, the **Scope** attribute has to be used to specify that the attribute applies to the elements of the list, not to the list as a whole.

To specify that an **ItemPropertyAttribute** applies to the elements of a list, the Scope must be set to **"\*"**. Here are some examples:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><strong>Class</strong></td>
<td align="left"><strong>Serialized Data</strong></td>
</tr>
<tr class="even">
<td align="left"><pre class="c#" name="code"><code>public class SerializationTest
{
    // A collection of strings with a custom name for the elements
    [ItemProperty (&quot;ExtraNames&quot;)]
    [ItemProperty (&quot;Name&quot;, Scope=&quot;*&quot;)]
    List&lt;string&gt; extraNames = new List&lt;string&gt; ();

    // This property will be serialized as a collection of strings.
    // The element name will be &quot;Objects&quot; (instead of &quot;array&quot;),
    // and there will be an &quot;Id&quot; element for each item of the list.
    // Also, the ValueType property is set to tell the serializer
    // that the elements of the collection are strings.
    [ItemProperty (&quot;Objects&quot;)]
    [ItemProperty (&quot;Id&quot;, Scope=&quot;*&quot;, ValueType=typeof(string))]
    ArrayList array = new ArrayList ();

    public SerializationTest ()
    {
        extraNames.Add (&quot;Jordi&quot;);
        extraNames.Add (&quot;Maria&quot;);
        array.Add (&quot;Jordi3&quot;);
        array.Add (&quot;Maria3&quot;);
    }
}</code></pre></td>
<td align="left"><pre class="xml" name="code"><code>&lt;SerializationTest&gt;
    &lt;ExtraNames&gt;
        &lt;Name&gt;Jordi&lt;/Name&gt;
        &lt;Name&gt;Maria&lt;/Name&gt;
    &lt;/ExtraNames&gt;
    &lt;Objects&gt;
        &lt;Id&gt;Jordi3&lt;/Id&gt;
        &lt;Id&gt;Maria3&lt;/Id&gt;
    &lt;/Objects&gt;
&lt;/SerializationTest&gt;</code></pre></td>
</tr>
</tbody>
</table>

#### Nested Scopes

When serializing nested collections, several **ItemPropertyAttribute** attributes can be applied using different scopes, one for each nesting level. The scope for the first level of nesting is "\*", the scope for the second level is "\*/\*", for the third "\*/\*/\*" and so on:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><strong>Class</strong></td>
<td align="left"><strong>Serialized Data</strong></td>
</tr>
<tr class="even">
<td align="left"><pre class="c#" name="code"><code>public class SerializationTest
{
    // When using nested collections, the scope can be aggregated
    [ItemProperty (&quot;User&quot;, Scope=&quot;*&quot;)]
    [ItemProperty (&quot;Name&quot;, Scope=&quot;*/*&quot;)]
    List&lt;List&lt;string&gt;&gt; nestedNames = new List&lt;List&lt;string&gt;&gt; ();

    public SerializationTest ()
    {
        List&lt;string&gt; nested1 = new List&lt;string&gt; ();
        nested1.Add (&quot;Jordi1&quot;);
        nested1.Add (&quot;Maria1&quot;);
        nestedNames.Add (nested1);
        List&lt;string&gt; nested2 = new List&lt;string&gt; ();
        nested2.Add (&quot;Jordi2&quot;);
        nested2.Add (&quot;Maria2&quot;);
        nestedNames.Add (nested2);
    }
}</code></pre></td>
<td align="left"><pre class="xml" name="code"><code>&lt;SerializationTest&gt;
    &lt;nestedNames&gt;
        &lt;User&gt;
            &lt;Name&gt;Jordi1&lt;/Name&gt;
            &lt;Name&gt;Maria1&lt;/Name&gt;
        &lt;/User&gt;
        &lt;User&gt;
            &lt;Name&gt;Jordi2&lt;/Name&gt;
            &lt;Name&gt;Maria2&lt;/Name&gt;
        &lt;/User&gt;
    &lt;/nestedNames&gt;
&lt;/SerializationTest&gt;</code></pre></td>
</tr>
</tbody>
</table>

#### Collections Without a Root Item

When the **ExpandedCollectionAttribute** attribute is applied to a collection, the root item of the collection will not be serialized. The elements of the collection will be serialized as direct children of the class item.

The **ItemPropertyAttribute** can be used to customize the serialization of the elements, although the use of the **Scope** property is not required here.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><strong>Class</strong></td>
<td align="left"><strong>Serialized Data</strong></td>
</tr>
<tr class="even">
<td align="left"><pre class="c#" name="code"><code>public class SerializationTest
{
    [ItemProperty]
    int SomeInteger = 32;

    // This property will be serialized as a set of Value elements
    // There won&#39;t be a &quot;values&quot; root element.
    [ItemProperty (&quot;Value&quot;)]
    [ExpandedCollection]
    string[] values;

    public SerializationTest ()
    {
        values = new string[] { &quot;One&quot;, &quot;Two&quot; };
    }
}</code></pre></td>
<td align="left"><pre class="xml" name="code"><code>&lt;SerializationTest SomeInteger=&quot;32&quot;&gt;
    &lt;Value&gt;One&lt;/Value&gt;
    &lt;Value&gt;Two&lt;/Value&gt;
&lt;/SerializationTest&gt;</code></pre></td>
</tr>
</tbody>
</table>

### Serializing Dictionaries

The serializer can serialize objects implementing the **IDicionary** interface. Dictionaries are serialized as a **DataItem** node which has a list of dictionary entries as children. Each dictionary entry is also a DataItem (named **Item** by default) which has two child items: the **Key** item, which holds the key of the entry, and the **Value** item, which holds the value of the entry.

The scopes 'item', 'key' and 'value' can be used to customize the serialization of the corresponding elements.

Some examples:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><strong>Class</strong></td>
<td align="left"><strong>Serialized Data</strong></td>
</tr>
<tr class="even">
<td align="left"><pre class="c#" name="code"><code>public class SerializationTest
{
    // A simple dictionary, with no customizations
    [ItemProperty]
    Dictionary&lt;string,int&gt; data = new Dictionary&lt;string,int&gt; ();
    // A dictionary containing objects, using custom names
    // for the items, keys and values
    [ItemProperty (&quot;Users&quot;)]
    [ItemProperty (&quot;User&quot;, Scope=&quot;item&quot;)]
    [ItemProperty (&quot;Id&quot;, Scope=&quot;key&quot;)]
    [ItemProperty (&quot;Data&quot;, Scope=&quot;value&quot;)]
    Dictionary&lt;string,User&gt; userData = new Dictionary&lt;string,User&gt; ();

    public SerializationTest ()
    {
        data [&quot;One&quot;] = 1;
        data [&quot;Two&quot;] = 2;
        userData [&quot;jd&quot;] = new User (&quot;Jordi&quot;, &quot;jordi@here.com&quot;);
        userData [&quot;ma&quot;] = new User (&quot;Maria&quot;, &quot;maria@here.com&quot;);
    }
}

public class User
{
    [ItemProperty (&quot;Name&quot;)]
    string name;
    [ItemProperty (&quot;EMail&quot;)]
    string email;

    public User (string name, string email) { ... }
}</code></pre></td>
<td align="left"><pre class="xml" name="code"><code>&lt;SerializationTest&gt;
    &lt;data&gt;
        &lt;Item Key=&quot;One&quot; value=&quot;1&quot; /&gt;
        &lt;Item Key=&quot;Two&quot; value=&quot;2&quot; /&gt;
    &lt;/data&gt;
    &lt;Users&gt;
        &lt;User Id=&quot;jd&quot;&gt;
            &lt;Data Name=&quot;Jordi&quot; EMail=&quot;jordi@here.com&quot; /&gt;
        &lt;/User&gt;
        &lt;User Id=&quot;maria&quot;&gt;
            &lt;Data Name=&quot;Maria&quot; EMail=&quot;maria@here.com&quot; /&gt;
        &lt;/User&gt;
    &lt;/data&gt;
&lt;/SerializationTest&gt;</code></pre></td>
</tr>
</tbody>
</table>

Custom serialization
--------------------

Types with complex serialization needs which can't be specified using attributes can implement **ICustomDataItem** to provide a custom serialization behavior. ICustomDataItem defines two methods:

-   Serialize: This method has to serialize the contents of the object into a DataCollection. It provides as input parameter an ITypeSerializer instance which you can use to run the default serializer.
-   Deserialize: It has to deserialize the provided DataCollection and fill the object with data. An ITypeSerializer is also provided.

Here is an example:

``` csharp
public class WindowData: ICustomDataItem
{
    [ItemProperty]
    string id;

    [ItemProperty]
    string title;

    int width;
    int height;

    DataCollection ICustomDataItem.Serialize (ITypeSerializer serializer)
    {
        // Use the provided serializer to run the default serialization.
        // This is optional, but it's useful if you just want to
        // tweak the default behavior, not completely reimplement it.
        DataCollection data = serializer.Serialize (this);

        // Now add some custom data
        data.Add (new DataValue ("size", width + " " + height));
        return data;
    }

    void ICustomDataItem.Deserialize (ITypeSerializer serializer, DataCollection data)
    {
        // Extract the custom value we added in the Serialize method
        DataValue size = data.Extract ("size") as DataValue;
        string[] sizes = size.Value.Split (' ');
        width = int.Parse (sizes[0]);
        height = int.Parse (sizes[1]);

        // Deserialize the other fields.
        serializer.Deserialize (this, data);
    }
}
```
