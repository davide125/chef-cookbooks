fb_etc_profiled Cookbook
====================
Provides an LWRP for managing shell extensions under `/etc/profile.d/` for Linux
and MacOS.

Requirements
------------
None

Platforms
---------
* MacOS, Linux

Attributes
----------
* node['fb_etc_profiled']['manage']
* node['fb_etc_profiled']['profile_script']

Usage
-----
The default recipe is included in `cpe_init` and will create the calling script
`/etc/profile` and plugin directory `/etc/profile.d` on MacOS only.  These
already exist on Linux and won't be touched by this resource.

New files can be added by creating a key underneath `node['fb_etc_profiled']`
with the value being the contents of the file.  This resource does not manage
the contents of the directory, so files must be removed manually if they are
removed from the resource.

Any files created with this resource will be executed when a new shell is
started.

Example creating a file called `test.sh` with content defined inline:

```
node.default['fb_etc_profiled']['manage'] = true
node.default['fb_etc_profiled']['profile_script']['test.sh'] = <<-EOF
#!/bin/bash

export GOMAXPROCS=4
EOF
```
