### Creating a simple project template (in Visual Studio for Mac)

**A. Installing the AddinMaker extension**

Custom project templates in Visual Studio for Mac can be installed as IDE extensions, so in order to start you first have to have the AddinMaker extension installed first. By doing this a new category called "Ide extensions" will appear under the new project window (File => new solution)

In order to install the AddinMaker extension:
1. Open the extensions window from (Visual Studio Community menu => extensions)
2. Open the Gallery tab & search for the "AddinMaker" extension & install it

**B. Creating the project template solution**

To get started, you will need to create an ide extension project. You can make one by following the following steps:
1. Open the new solution window
2. Choose IDE extension & click next
3. Choose a project name (for this guide we use MyAwesomeTemplate, but you can replace that with any name)

**C. Adding a project template file**

Project file templates are made using the Project template option from the new file menu.
To get started create a Templates folder & add a new Project file template named "MyAwesomeTemplate" or any other name. 
You will find the project file template in the Add-in category of the new file window.
By default you will get something like this:

```
<?xml version="1.0"?>
<Template>
	<TemplateConfiguration>
		<_Name>MyAwesomeTemplate</_Name>
	</TemplateConfiguration>
	<Actions>
	</Actions>
	<Combine name="MyProjectTemplateTutorial" directory=".">
		<Options>
			<StartupProject>MyProjectTemplateTutorial</StartupProject>
		</Options>
		<Project name="MyProjectTemplateTutorial" directory=".">
			<References>
			</References>
			<Packages>
			</Packages>
			<Files>
			</Files>
		</Project>
	</Combine>
</Template>
```

**D. Configuring the project template & the Manifest file**

Before running this project, you first have to add a reference to this template in the Manifest.addin.xml. Open up your Manifest.addin.xml & replace the contents with the following code:

```
<?xml version="1.0" encoding="UTF-8"?>
<ExtensionModel>
	<Extension path="/MonoDevelop/Ide/ProjectTemplates">
        <ProjectTemplate id="MyAwesomeTemplate" file="Templates/MyAwesomeTemplate.xpt.xml" />
    </Extension>
</ExtensionModel>
```

Next, add a category as well as a language in the TemplateConfiguration section of your project template file:
```
<?xml version="1.0"?>
<Template>
	<TemplateConfiguration>
		<_Name>MyAwesomeTemplate</_Name>
		<Category>other/net/general</Category>
		<LanguageName>C#</LanguageName>
	</TemplateConfiguration>
	...
</Template>
```
In this example we assume that the template should appear under the other/net/general category.
For detailed info about project template setup, you can refer to the [project templates](project-templates.md) article.

Lastly you have to make sure the project template is copied into the output directory using the copy to output directory property of that file. Otherwise the project template won't appear in the new solution window.

If you now run the project you will see your template name appear appear under other => .NET => General.

**E. Adding references, packages, directories & files**

Until now the project template was empty. In order to create a complete project template however, we need to be able to add refrences, packages etc.
The following example shows how this can be done:

```
<?xml version="1.0" encoding="UTF-8"?>
<Template>
    ...

    <Combine name="${ProjectName}" directory=".">
        <Project name="${ProjectName}" directory=".">
            <References>
                <Reference type="Package" refto="System" LocalCopy="false" SpecificVersion="true" />
            </References>
            <Packages>
                <package id="Microsoft.EntityFrameworkCore" />
            </Packages>
            <Files>
                <Directory name="Controllers">
                    <!-- using .txt to avoid visual studio errors when using special template annotations -->
                    <File name="HomeController.cs" src="HomeController.cs.txt" SuppressAutoOpen="true" />
                </Directory>
            </Files>
        </Project>
    </Combine>
</Template>
```

In order for this example to work, you also need to create the actual HomeController.cs.txt. For this demo you can use the followning code (Templates/HomeController.cs.txt):

```
using System;

namespace ${RootNamespace}
{
    public static class HomeController
    {
        public static String Index()
        {
            return "Hello World!";
        }
    }
}
```

Again you also need to make sure that the file is copied to the output directory. Otherwise you will get an error telling that the file can't be written.
