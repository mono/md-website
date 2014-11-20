---
title: Inotify Watches Limit
redirect_from:
  - /Inotify_Watches_Limit/
  - /Inotify_watches_limit/
---

When available, MonoDevelop uses Inotify to keep track of changes in files. In some systems, the maximum number of allowed watch handles may be too low, and may prevent MonoDevelop to work properly.

To avoid this situation, MonoDevelop will switch to managed file watching if the watches limit is lower than 9000. Managed file watching is less efficient than Inotify based file watching, so it is highly recommended to adjust the Inotify configuration and increase the watches limit. The default is 8192. 16384 is good, 32768 is probably more than enough.

To change the limit, run:

``` bash
# echo 16384 > /proc/sys/fs/inotify/max_user_watches
```

To make the change permanent, edit the file /etc/sysctl.conf and add this line to the end of the file:

``` ini
fs.inotify.max_user_watches=16384
```
