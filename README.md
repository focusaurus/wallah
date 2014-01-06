#wallah: Helps you install your project's prerequisites

This project is designed to be added as a git submodule to a parent project. It provides several scripts that help bootstrap you project's prerequisites so getting a new developer up and running is mostly automated.

#Philosophy

Applications and projects in general tend to be tightly coupled to particular versions of their language and the modules and libraries they depend upon. Although it is very common practice to install a single language runtime (python, node, ruby, or similar) and use that to work on numerous independent projects, this creates dependency hell, unwanted side effects, breakages when upgrading, and version conflicts over time. Thus wallah believes each project should have it's own fully-isolated language runtime instance and within that just the dependencies for one particular project should be installed. This is in alignment with the concepts behind python virtualenv, rbenv, rvm, and npm (at least mostly).

wallah is strongly opposed to `npm -g`, `sudo pip install`, `sudo apt-get install nodejs`, `brew install python` and any similar command that shares runtimes or dependencies across applications/projects.

#Filesystem Default Conventions

wallah will do the right thing automatically if your project follows certain conventions.

* `<project_root>/wallah` is a git submodule in your project
* note making `<project_root>/wallah` a symlink to somewhere else does NOT work. Don't do that.

##node.js
* node will be installed in `<project_root>/node`
* your npm config lives at `<project_root>/package.json`

#Prerequisites

* OSX, Linux, or maybe other posix system
* bash
* tar
* curl
  * At some point we could probably use python standard libraries instead of both curl and tar, but for the time being it's more robust and straightforward to use external executables
* python
  * Yes, this is very meta, but we build project-specific virtualenvs by cloning an existing python, not by installing one from scratch. We do this because installing python from source is complicated and slow and has lots of prerequisites. It's generally OK because OSX and Linux always have a python available.

#Supported Languages

* python with pip
* node.js with npm

#Code Conventions

shell scripts in this project follow [Google's Shell Style Guide](http://google-styleguide.googlecode.com/svn/trunk/shell.xml)

#License

MIT
