---
title: Building a simple application using the Stetic GUI Designer
redirect_from:
  - /Documentation/Building_a_simple_application_using_the_Stetic_GUI_Designer/
---

Introduction
------------

This tutorial is meant as an introduction to GUI development with Stetic (MonoDevelop's integrated Gtk# visual designer). It will demonstrate how to create the layout of the GUI, how to add interactive elements to the layout and how to add functionality to the GUI.

We are going to create a simple text editor which will be able to transform text to Upper Case or Lower Case and then save it to a file.

Step 1: Creating a new Project
------------------------------

Open Monodevelop and then select **File -\> New Project** from the menu. It should open a window that looks something like this:

[![1](http://farm6.static.flickr.com/5050/5232072870_c37490530c.jpg)](http://www.flickr.com/photos/56664731@N07/5232072870/ "1 by toma.tabacu, on Flickr")

Select **C#** from the menu on the left and then click the icon labelled **Gtk# 2.0 Project**. Click **Forward** to proceed.

To open the Designer you must right-click **MainWindow** from the **Solution Pad** and select **Open**.

[![2](http://farm6.static.flickr.com/5090/5231481171_273f0ac055.jpg)](http://www.flickr.com/photos/56664731@N07/5231481171/ "2 by toma.tabacu, on Flickr")

Step 2: Creating the GUI
------------------------

The main philosophy of Gtk# is that every Widget (Buttons, Toolbars etc.) must be placed into a Container (HBox, Vbox, Table etc.). This tutorial is meant as a quick Introduction so if you want to read more about Gtk# [please do so](https://www.mono-project.com/GtkSharp).

To get started, switch to the Designer by pressing the "Designer" button located at the bottom:

[![SourceCodeDesigner](http://farm6.static.flickr.com/5164/5231481777_202da87b75.jpg)](http://www.flickr.com/photos/56664731@N07/5231481777/ "SourceCodeDesigner by toma.tabacu, on Flickr")

### 2.1 Adding Containers 

The MainWindow is empty right now:

[![3](http://farm6.static.flickr.com/5286/5231481209_3f4bdfd0ec.jpg)](http://www.flickr.com/photos/56664731@N07/5231481209/ "3 by toma.tabacu, on Flickr")

All the default Containers and Widgets you need are in the **Toolbox Pad** on the right side of the screen:

[![Containers](http://farm6.static.flickr.com/5244/5231481261_ffaef8635c.jpg)](http://www.flickr.com/photos/56664731@N07/5231481261/ "Containers by toma.tabacu, on Flickr")

[![Widgets1](http://farm6.static.flickr.com/5284/5232073350_0a2d75cc9a.jpg)](http://www.flickr.com/photos/56664731@N07/5232073350/ "Widgets1 by toma.tabacu, on Flickr")

First of all, we are going to add a **VBox** to separate the Buttons from the TextView. Go to **Toolbox -\> Containers** and drag the **VBox** container to the **MainWindow**. The result looks like this:

[![4](http://farm6.static.flickr.com/5210/5232073084_541f090c28.jpg)](http://www.flickr.com/photos/56664731@N07/5232073084/ "4 by toma.tabacu, on Flickr")

Now we need to make a container for each of the Buttons. Add a **HBox** (drag & drop) to the first box of the **VBox**. The window will look like this:

[![5](http://farm6.static.flickr.com/5165/5231481403_2fdfdb3d24.jpg)](http://www.flickr.com/photos/56664731@N07/5231481403/ "5 by toma.tabacu, on Flickr")

If we're going to have 4 buttons we need to add another box to the **HBox**. Right-click the **HBox** and select **hbox1 -\> Insert After**. The window should look like this:

[![6](http://farm6.static.flickr.com/5042/5232073038_2064183def.jpg)](http://www.flickr.com/photos/56664731@N07/5232073038/ "6 by toma.tabacu, on Flickr")

### 2.2 Adding Widgets

Add a **Button** to each of the first row boxes and a **TextView** to the second row, like this: 

[![7](http://farm6.static.flickr.com/5090/5232073172_8080b106d7.jpg)](http://www.flickr.com/photos/56664731@N07/5232073172/ "7 by toma.tabacu, on Flickr")

Every **Widget** and **Container** has properties that define their appearance and behaviour.

You can modify these properties from the **Properties Pad** (below the Toolbox Pad).

For example, select the **TextView** that was just added and change its **Show Scrollbars** property by unchecking the checkbox:

[![TextViewProperties](http://farm6.static.flickr.com/5001/5231481553_913f9969d4.jpg)](http://www.flickr.com/photos/56664731@N07/5231481553/ "TextViewProperties by toma.tabacu, on Flickr")

Now select the first **Button** and change its **Name** to "buttonClear". The Name property is used by the application to refer to this instance of the **Gtk.Button** class. To change the text on the button you must modify the **Label** property which can be found in the **Button Properties** submenu. Change it to "Clear" as shown in the image below:

[![ButtonProperties](http://farm6.static.flickr.com/5045/5231481649_ed1a5c99ac.jpg)](http://www.flickr.com/photos/56664731@N07/5231481649/ "ButtonProperties by toma.tabacu, on Flickr")

Make modifications to the other **Buttons** until your **MainWindow** looks like this:

[![8](http://farm6.static.flickr.com/5281/5232073204_373f1fb028.jpg)](http://www.flickr.com/photos/56664731@N07/5232073204/ "8 by toma.tabacu, on Flickr")

Step 3: Adding Functionality
----------------------------

Select the "Clear" Button and open the **Signals** tab in the **Properties Pad**:

[![ButtonSignals](http://farm6.static.flickr.com/5088/5232073278_c1aa37e639.jpg)](http://www.flickr.com/photos/56664731@N07/5232073278/ "ButtonSignals by toma.tabacu, on Flickr")

Double-click on the **Clicked** Signal to automatically add a **Signal Handler**. A Signal Handler is a function that is called when a Signal is triggered.

Now add the following **Signal Handlers** (with the above mentioned method) and some C# code:

``` csharp
using System;
using Gtk;
using System.IO;

public partial class MainWindow : Gtk.Window
{
    public MainWindow() : base(Gtk.WindowType.Toplevel)
    {
        Build();
    }

    protected void OnDeleteEvent(object sender, DeleteEventArgs a)
    {
        Application.Quit();
        a.RetVal = true;
    }

    protected virtual void OnButtonClearClicked(object sender, System.EventArgs e)
    {
        //code executed when the Clear button is clicked
        textview1.Buffer.Text = ""; //clears the buffer displayed by the TextView
    }

    protected virtual void OnButtonUppCaseClicked(object sender, System.EventArgs e)
    {
        //code executed when the Upper Case button is clicked
        textview1.Buffer.Text = textview1.Buffer.Text.ToUpper();
    }

    protected virtual void OnButtonLowerCaseClicked(object sender, System.EventArgs e)
    {
        //code executed when the Lower Case button is clicked
        textview1.Buffer.Text = textview1.Buffer.Text.ToLower();
    }

    protected virtual void OnButtonSaveClicked(object sender, System.EventArgs e)
    {
        //code executed when the Copy button is clicked
        StreamWriter sw = new StreamWriter("Test.txt");
        sw.Write(textview1.Buffer.Text); //Write textview1 text to file
        textview1.Buffer.Text = "Saved to file !"; //Notify user
        sw.Close();
    }
}
```

The application should be ready to go. Select Build -\> Build All from the menu and then Run -\> Debug and test it. The text file is created by the StreamWriter object in SolutionFolder/bin/Debug .

Step 4: Experimenting
---------------------

Congratulations! You have officially programmed a Gtk# application. From here on I recommend trying out other Containers and Widgets and make some more complex applications (multiple windows, custom widgets) and maybe start a project of your own.
