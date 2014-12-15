---
title: Creating C and CPP Projects
redirect_from:
  - /Documentation/Creating_C_and_CPP_Projects/
  - /Creating_C_and_CPP_Projects/
  - /Creating_C//CPP_Projects/
  - /documentation/creating_c_and_cpp_projects/
---

### Introduction

The purpose of this tutorial is to outline the basic process for creating an C++ application with MonoDevelop, and also provide some tips for getting started. Our example for this tutorial will be a simple console application with two classes and some compile options.

### Creating the Solution

From the file menu, select "New Solution/Project" to open the "New Solution" window. Select "C"-\>"C++" from the language list and "Console Project" from the templates, then give your application a name.

[![SimpleCPPSolution\_NewProject.png](/images/354-SimpleCPPSolution_NewProject.png)](/images/354-SimpleCPPSolution_NewProject.png "SimpleCPPSolution_NewProject.png")

After clicking "Forward" you can enable some features like Packaging and Translations, though these can be added to the project at any time. When you are finished, click the "New" button. This creates a new directory for your solution in the Projects directory of your home directory. The "Console Project" template provides an already buildable application. You can test it by selecting "Run" from the "Run" menu or simply pressing F5. This will build the application, and provide the output in the "Application Output" pad.

### Using the Class Pad

MonoDevelop provides the Class Pad, which shows the hierarchy of classes and other symbols in the solution. The class pad is fully supported for C/C++ (via exuberant ctags), and can be used to browse the defined symbols and jump to their declaration with a simple double-click.

We add the following code to main.cpp:

``` c
class SimpleTextClass
{
    public:
        string text1;
        string text2()
        {
            return text1+"world!";
        }
};
class AdvancedTextClass : public SimpleTextClass
{
    public:
        AdvancedTextClass()
        {
            text3="";
        }
        AdvancedTextClass(string text)
        {
            text3=text;
        }
        string text3;
};
```

When the file is saved, the Class Pad shows the new symbols.

![SimpleCPPSolution\_ClassBrowser.png](/images/348-SimpleCPPSolution_ClassBrowser.png)

MonoDevelop also provides limited code completion in the text editor for C/C++ for the symbols in the Class Pad. It cannot yet resolve types of local variables, so does not work for class instance members using the '.' and '-\>' operators.

Let's try the parameter completion with our new function.

![SimpleCPPSolution\_HoverInfo.png](/images/353-SimpleCPPSolution_HoverInfo.png)

It also works with the '::' operator, providing completion for the referenced libraries as well as our code.

![SimpleCPPSolution\_Completion.png](/images/350-SimpleCPPSolution_Completion.png)

### Changing Compiler Options

In Project-\>Options-\>Configurations you can define different configurations, such as Debug or Release. For each of these, the compiler commands are fully configurable using the Code Generation tab. Here you can set the warning level, optimization level, targets, symbols and extra compiler and linker options.

[![SimpleCPPSolution\_CompilerOptions.png](/images/349-SimpleCPPSolution_CompilerOptions.png)](/images/349-SimpleCPPSolution_CompilerOptions.png "SimpleCPPSolution_CompilerOptions.png")

### Adding a Library

For our sample application, we do not want to include all of our functionality in the executable, so we want to create a library. To do this, right click on the Solution icon in the Solution Pad. Select "Add-\>Add New Project". From the "New Solution" window, select "C++" as the language and "Shared Library" as the template. Name it "TestC++Library" and click "New". This will create a new project within your solution.

Now your solution has a new library which initially does absolutely nothing. We'll add some simple functionality, but first rename main.cpp and main.h to library.cpp and library.h to avoid confusion.

Add the following line to library.h:

``` c
int test();
```

and add the following code to library.cpp:

``` c
int test()
{
    return 1337;
}
```

Your library is ready, and needs to be referenced from the application. Go to the Solution Pad, right-click on the application's Packages node, and select "Edit Packages". The "Edit Packages" dialog will be shown. Go to the "Project Packages" tab, and you will see a list of the library projects in your solution. Check the library's checkbox to add it as a reference.

[![SimpleCPPSolution\_ProjectPackages.png](/images/355-SimpleCPPSolution_ProjectPackages.png)](/images/355-SimpleCPPSolution_ProjectPackages.png "SimpleCPPSolution_ProjectPackages.png")

Now you can use the library in the application's main.cpp. Add an include

``` c
#include "library.h"
```

to the top of the file, and then you can use the test() function. Add the following line into the main() function:

``` c
  cout << test() << endl;
```

Press "F5", and "1337" should appear in the Application Output tab.

### Referencing Packages

From the file menu, select "New Solution/Project" to open the "New Solution" window. Select "C"-\>"C++" from the language list and "Console Project" from the templates. Give your application the name "SimpleC++GTKApp".

This new solution will be a simple GUI application. To do this, we'll need to use the GTK+ GUI library. Right-click on Packages in your Application in Solution tab and select "Edit Packages". On the "System Packages" tab you have a list of available libraries in your system provided by pkg-config, which is a system for registering and querying installed libraries. Check GTK+-2.0 and click "OK". Note: If you doesn't have gtk+-2.0 on your system, you'll need to install the gtk+2-devel package.

[![SimpleCPPSolution\_EditPackages.png](/images/351-SimpleCPPSolution_EditPackages.png)](/images/351-SimpleCPPSolution_EditPackages.png "SimpleCPPSolution_EditPackages.png")

Now copy and paste the following [GTK sample](http://www.gtk.org/tutorial/c39.html) to your main.cpp file

``` c
 #include <iostream>
 #include <gtk/gtk.h>

 static void destroy_window( GtkWidget *widget,
                      gpointer  pointer )
 {
     gtk_main_quit ();
 }

 int main(int argc, char *argv[])
 {
    GtkWidget *window;
    gtk_init (&argc, &argv);
    window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
    gtk_window_set_default_size (GTK_WINDOW (window), 200, 50);
    g_signal_connect (G_OBJECT (window), "destroy",G_CALLBACK (destroy_window), NULL);
    gtk_container_add (GTK_CONTAINER (window), gtk_label_new ("Hello, World"));
    gtk_widget_show_all (window);
    gtk_main ();
    return 0;
 }
```

Just click the Run button or press "F5". Here's a shot of the final product in action.

![SimpleCPPSolution\_HelloWorld.png](/images/352-SimpleCPPSolution_HelloWorld.png)

### Conclusions

This tutorial has helped you to make C++ projects in MonoDevelop and given some starting points on how to set up and begin developing your C++ applications.

### Other Tips

#### Including C++ Projects in Mono Solutionss

C/C++ projects can be included in Mono solutions. This is useful if you're developing with a mixture of managed and unmanaged code, either for performance or to access C/C++ libraries. You can write C libraries, then use them from your Mono code using P/Invoke.

#### Building from the Command Line

It is possible to build your solution from the command line. Using the above example, we could do:

``` bash
mdtool build --f --buildfile:Projects/ConsoleCPP/ConsoleCPP.mds
```

Which will produce:

``` bash
MonoDevelop Build Tool
Loading solution: Projects/ConsoleCPP/ConsoleCPP.mds
    Loading project:
    /home/users/entereczek/Projects/ConsoleCPP/ConsoleCPP/ConsoleCPP.mdp
Building Solution ConsoleCPP
```
