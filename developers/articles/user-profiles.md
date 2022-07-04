---
title: User Profiles
redirect_from:
  - /Developers/Articles/User_Profiles/
  - /developers/articles/user_profiles/
---

User-specific data should be stored in the locations indicated by the properties of the `UserLocations` class on the static property `MonoDevelop.Core.PropertyService.Locations`. This set of locations is called a profile.

The following locations are defined. Use the locations that are appropriate for the data that is stored, and split it between multiple locations if appropriate. Do not assume that the directories exist before trying to write files.

File and directory names in the root of these locations should have an invariant name, such as "ToolboxIndex.xml" or "CodeSnippets". Files in subdirectories may have names that are derived solely from the file data, such as the name of a template or keybinding scheme.

If you are storing an unbounded number of files such as user-defined templates or cached completion data, you must create a subdirectory.

The version number in the profile directory name will depend what version are using. Typically it increases only with major versions, e.g. 4.0, 5.0. If unsure, check the Logs directory, opened from the *Help -\> Open Log Directory* menu.

**NOTE: For Visual Studio for Mac, replace `MonoDevelop` with `VisualStudio` in these paths.**

#### Config

Configuration files that may be migrated between machines safely.

The location is dependent on operating system and environment, but normally will have the following values:

|-----------------|------------------------------------------------|
| Mac             | ~/Library/Preferences/MonoDevelop/{version}/   |
| Windows 7/8/10  | ~/AppData/Roaming/MonoDevelop/{version}/Config |
| Linux           | ~/.config/MonoDevelop/{version}/               |

#### LocalConfig

Configuration files that are specific to the local machine.

The location is dependent on operating system and environment, but normally will have the following values:

|-----------------|----------------------------------------------|
| Mac             | ~/Library/Preferences/MonoDevelop/{version}/ |
| Windows 7/8/10  | ~/AppData/Local/MonoDevelop/{version}/Config |
| Linux           | ~/.config/MonoDevelop/{version}/             |

#### Logs

Log files that may be needed for bug reporting.

The location is dependent on operating system and environment, but normally will have the following values:

|-----------------|---------------------------------------------|
| Mac             | ~/Library/Logs/MonoDevelop/{version}/       |
| Windows 7/8/10  | ~/AppData/Local/MonoDevelop/{version}/Logs/ |
| Linux           | ~/.cache/MonoDevelop/{version}/Logs         |

#### Cache

Cache files that may be deleted without loss of information.

The location is dependent on operating system and environment, but normally will have the following values:

|-----------------|----------------------------------------------|
| Mac             | ~/Library/Caches/MonoDevelop/{version}/      |
| Windows 7/8/10  | ~/AppData/Local/MonoDevelop/{version}/Cache  |
| Linux           | ~/.cache/MonoDevelop/{version}/              |

#### Temp

Temporary files that may be deleted while MonoDevelop is not running, without loss of information.

The location is dependent on operating system and environment, but normally will have the following values:

|-----------------|---------------------------------------------|
| Mac             | ~/Library/Caches/MonoDevelop/{version}/Temp |
| Windows 7/8/10  | ~/AppData/Local/MonoDevelop/{version}/Temp  |
| Linux           | ~/.cache/MonoDevelop/{version}/Temp         |

#### Data

Data files created by the user, such as user-defined templates, formatting profiles, and keybinding schemes. These files should be sharable with other users by simply copying the file. File and folder naming should make it reasonably obvious to the user what the files in this folder are.

The location is dependent on operating system and environment, but normally will have the following values:

|-----------------|------------------------------------------|
| Mac             | ~/Library/MonoDevelop/{version}/         |
| Windows 7/8/10  | ~/AppData/Roaming/MonoDevelop/{version}/ |
| Linux           | ~/.local/share/MonoDevelop/{version}/    |

#### LocalInstall

This location is for files installed into MonoDevelop. For example, downloaded addins are installed into the *Addins* subdirectory. Another example of a valid use would be templates downloaded from an online gallery.

The location is dependent on operating system and environment, but normally will have the following values:

|-----------------|------------------------------------------------------------------|
| Mac             | ~/Library/Application Support/MonoDevelop/{version}/LocalInstall |
| Windows 7/8/10  | ~/AppData/Local/MonoDevelop/{version}/LocalInstall               |
| Linux           | ~/.local/share/MonoDevelop/{version}/LocalInstall                |

### Profile Migration

MonoDevelop profiles are specific to a major MonoDevelop release. A major release is a release that breaks API, so for example 2.4 and 2.6 are both major releases, but 2.4.1 is not.

This enables data files to also break backwards compatibility without headaches ensuring backwards compatibility for all data format and configuration schema changes; we only need to worry about forward migrations. Different major releases or stable and beta releases can therefore be run side-by side without risking data corruption.

When a particular major version of MonoDevelop is run for the first time, it will look for older profiles, from the previous version to the oldest known version. The first profile it finds will be migrated into the profile for the new version. This is a one-time operation, and further changes will not be migrated.

Addins can include data items in the migration using the `/MonoDevelop/Core/UserDataMigration` extension point:

``` xml
<Extension path = "/MonoDevelop/Core/UserDataMigration">
    <Migration sourceVersion="2.4" kind="Config" sourcePath="mono-runtimes.xml" />
</Extension>
```

The `Migration` node has the following attributes:

**sourceVersion**: The profile version for which this migration is valid *(required)*.

**kind**: The name of the profile location *(required)*.

**sourcePath**: the relative path of the file or directory within the source location *(required)*.

**targetPath**: the relative path of the file or directory within the target location. If omitted, the sourcePath will be used *(optional)*.

**handler**: a type that implements the `MonoDevelop.Core.IUserDataMigrationHandler` interface. It will be used to do the migration instead of a simple copy *(optional)*.

### Testing Profiles

When testing MonoDevelop, it can be useful to have a test profile instead of altering the real profile. This can be done using the `MONODEVELOP_TEST_PROFILE` environment variable.

The profile locations for the test profile are

`$MONODEVELOP_TEST_PROFILE/MonoDevelop/{version}/{LocationName}`

and the test profile location will be searched for older profiles for migrations.
