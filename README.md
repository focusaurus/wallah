# wallah: get what you need

wallah helps you install your project's prerequisites. It is designed to be added as a git submodule to a parent project. It provides several scripts that help bootstrap you project's prerequisites so getting a new developer up and running is mostly automated.

![Spice Wallah](wallah.jpg "wallah")

[Photo by Meena Kadri](http://www.flickr.com/photos/meanestindian/4127563975/). Copyright. Licensed [Create Commons Attribution-NonCommercial-NoDerivs 2.0 Generic](http://creativecommons.org/licenses/by-nc-nd/2.0/)

## Philosophy

Applications and projects in general tend to be tightly coupled to particular versions of their language and the modules and libraries they depend upon. Although it is very common practice to install a single language runtime (python, node, ruby, or similar) and use that to work on numerous independent projects, this creates dependency hell, unwanted side effects, breakages when upgrading, and version conflicts over time. Thus wallah believes each project should have it's own fully-isolated language runtime instance and within that just the dependencies for one particular project should be installed. This is in alignment with the concepts behind python virtualenv, rbenv, rvm, and npm (at least mostly).

wallah is strongly opposed to `npm -g`, `sudo pip install`, `sudo apt-get install nodejs`, `brew install python` and any similar command that shares runtimes or dependencies across applications/projects.

wallah uses simplistic checks to avoid re-installing things that are already present. It is optimized for the normal cases of new developer setup where things need to be installed from scratch as well as the case where things are already completely and correctly installed. Thus it simply checks for the existance of particular sentinel files, and if they are there it assumes that thing is installed completely and exits zero silently. Thus your wrapper scripts can call wallah scripts every time and once things are installed there will be near-zero cost to running them.

## Usage and documentation of each script

Docs are in the script files themselves. Read them.

## Adding wallah as a submodule to your project

* `cd project_root`
* `git submodule add https://github.com/focusaurus/wallah.git`

## Prerequisites

* OSX, Linux, or maybe other posix system
* bash
* tar
* grep
* tr
* curl
  * At some point we could probably use python standard libraries instead of both curl and tar, but for the time being it's more robust and straightforward to use external executables
* python
  * Yes, this is very meta, but we build project-specific virtualenvs by cloning an existing python, not by installing one from scratch. We do this because installing python from source is complicated and slow and has lots of prerequisites. It's generally OK because OSX and Linux always have a python available.

## Supported Languages

* node.js with npm
* io.js with npm
* python with pip

## Code Conventions

shell scripts in this project follow [Google's Shell Style Guide](http://google-styleguide.googlecode.com/svn/trunk/shell.xml)

## License

MIT
