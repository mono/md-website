---
title: MeeGo
redirect_from:
  - /Developers/Tasks/Project_Add-ins/MeeGo/
---

### Replace sharpssh

<span> </span>

<span id="_task_a_MeeGo.ReplaceSharpSsh"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-3d" style="font-size: x-small;">3d</span> | <span class="task-target" style="font-size: x-small;"></span> |

Instead of using sharpssh, use the command line ssh tool (plink on windows).

The major problem is that sharpssh lacks some features and will require export review. There are 3 places where we use this library:

1.  SshRemoteProcess -  an IProcessAsyncOperation for running a command over ssh.
2.  MeeGoUtility.Upload - an IAsyncOperation that uses sftp to copy a directory to a remote machine
3.  MeeGoExecutionHandler.GetGdmXAuth - could trivially be eliminated, by putting this functionality in the shell command that's used to launch the app.

Both SshRemoteProcess and MeeGoUtility.Upload are very generic and should probably be moved down into MD core at some point. Both SshRemoteProcess and MeeGoUtility.Upload could very easily be made to use ssh commandline utilities instead, except for the authentication problem.

Error recovery on authetication also has to be improved.

### Improve Provisioning / Authentication

<span> </span>

<span id="_task_a_MeeGo.ImproveProvisioning"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-1w" style="font-size: x-small;">1w</span> | <span class="task-target" style="font-size: x-small;"></span> |

Currently, we require several shell commands to be run on the target machine to enable it as a target. This isn't really a shippable user experience - we should have a package or a setup script or tool to do this.

Also, when running/debugging/uploading we require the user to enter the zeroconf/avahi name of the target, and a username/password which we then store in cleartext. Obviously it's bad to store passwords in cleartext, and also error-prone and awkward to enter these values manually. And we only ask once per session, so the user cannot target a different device without restarting MD.

The solution that I intended to implement for all these problems was the following:

1.  MD creates an ssh key for MeeGo debugging and stores it in ~/.config/MonoDevelop.
2.  MD creates a script "provision-meego-development-$DEVELMACHINE" that can be copied to the MeeGo device and run, where $DEVELMACHINE is some unique name identifying the MD host machine.
3.  The script enables avahi and ssh on a MeeGo device and  adds MD's SSH key to authorized\_keys.
4.  The script registers a "MonoDevelop Debug" service on Avahi, with extra info in the TXT record    ("$USER;$DEVELMACHINE1,$DEVELMACHINE2,...)
5.  MD uses Mono.ZeroConf to get the list of devices on the local network that advertise "MonoDevelop Debug" service and are provisioned for the current machine.
6.  There would be an Active Device menu beside Active Configuration/Runtime, allowing the user to pick between provisioned targets. MD can then use the target's mdns address and username to ssh.
7.  There would be a "provision target" command that shows a dialog explaining how to run the provisioning script, with a button to write the provisioning script to a removable drive.
8.  When debugging or running, MD would use the active target, or run the "provision target" command.

This completely removes the need for ssh passwords, manually entering usernames and addresses, and running multiple setup commands on the remote machine.

Other ideas:

-   Serve the provisioning script and instructions in a webpage on the local network using HttpListener
-   A "generic" provisioning script that uses a well-known hostname and a keypair that's bundled with MD. A machine provisioned with this script would be machine accessible to any MD instance, and would essentially be wide-open, but that shouldn't matter too much on the local subnet. It could even be included in an RPM.

### Use MeeGo theme in Stetic

<span> </span>

<span id="_task_a_MeeGo.SteticTheme"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------|------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                  | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Low" style="font-size: x-small;">Low</span> | <span class="task-complexity-1d" style="font-size: x-small;">1d</span> | <span class="task-target" style="font-size: x-small;"></span> |

Theme Stetic and its window decorations to match MeeGo

### Deploy/bundle command

<span> </span>

<span id="_task_a_MeeGo.DeployBundle"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-3d" style="font-size: x-small;">3d</span> | <span class="task-target" style="font-size: x-small;"></span> |

Implement some kind of deploy/bundle command.

### Improve execution on device

<span> </span>

<span id="_task_a_MeeGo.ExecutionImprovements"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                        | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Normal" style="font-size: x-small;">Normal</span> | <span class="task-complexity-2d" style="font-size: x-small;">2d</span> | <span class="task-target" style="font-size: x-small;"></span> |

Add some options:

-   Configurable upload directory on target machine
-   Configurable launch parameters
-   Upload a .desktop file and launch script to the target so the app can be run directly

### Integrate the MeeGo Simulator

<span> </span>

<span id="_task_a_MeeGo.Simulator"></span><span> </span>

|------------------------------------------------------------------------------|--------------------------------------------------------------|--------------------------------------------------------------------------|------------------------------------------------------------------------|---------------------------------------------------------------|
| **<span style="font-size: x-small;">Status</span>**                          | **<span style="font-size: x-small;">Owner</span>**           | **<span style="font-size: x-small;">Importance</span>**                  | **<span style="font-size: x-small;">Complexity</span>**                | **<span style="font-size: x-small;">MD Version</span>**       |
| <span class="task-status-Pending" style="font-size: x-small;">Pending</span> | <span class="task-owner" style="font-size: x-small;"></span> | <span class="task-importance-Low" style="font-size: x-small;">Low</span> | <span class="task-complexity-1w" style="font-size: x-small;">1w</span> | <span class="task-target" style="font-size: x-small;"></span> |

Add support for deploying and running an application in the MeeGo simulator. The problem however is that the simulator is not very useful since it has very strict hardware requirements (e.g. it only runs on intel processors and graphic cards).
