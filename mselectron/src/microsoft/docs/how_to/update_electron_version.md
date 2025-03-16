# How To: Update Electron Version

## Pull Electron and its dependencies

For compliance reasons, Microsoft Electron builds that are shipped externally must be repeatable.  
All dependencies are copied to Microsoft controlled locations.  
During the build external dependencies are not downloaded from external locations as they may be transient.

### Depot Tools

Depot tools is a set of utilities used for working with Chromium development.  
The build uses various depot tools including `gclient` which manages project's dependencies.  
<https://chromium.googlesource.com/chromium/tools/depot_tools>

The internal mirror repo is:  
<https://devdiv.visualstudio.com/DevDiv/_git/electron-depot-tools>  
See [below](#mirror-repos) how to keep it up to date.

The depot tools revision we use is specified in the [get_depot_tools.py][] script.  

### Electron repo from GitHub

The main Electron repository with most of the sources.  
<https://github.com/electron/electron>

Internal mirror repo for Electron:  
<https://devdiv.visualstudio.com/DevDiv/_git/electron-electron>  
See [below](#mirror-repos) how to keep it up to date.

The exact Electron revision we use is specified in the [DEPS][] file.  

### Electron's fork of Node.js

Electron embeds a slightly modified version of [Node.js](https://github.com/nodejs/node).  
<https://github.com/electron/node>

Internal mirror repo for Node:  
<https://devdiv.visualstudio.com/DevDiv/_git/electron-node>  
See [below](#mirror-repos) how to keep it up to date.

The exact revision we use is specified in the [DEPS][] file.

### Mirror repos

This [CI build](https://devdiv.visualstudio.com/DevDiv/_build?definitionId=19542)
is run regularly to update/sync internal mirrors.  
Config files defining what is mirrored are stored in the [electron-build/configs/mirror_repos][].  

### Chromium

Electron is based on [Chromium][] and Chromium sources are pulled from Google repositories  
every time Electron is built on GitHub. Internally we need to capture this content.

The Chromium repo can't be mirrored because the project consists of about a hundred various projects.  
Instead an internal "snapshot" of the Chromium tree for every platform is stored in an internal repository.  
The [electron-chromium][] repository has three independent trees, one for every platform we support.  

There's a [CI build](https://devdiv.visualstudio.com/DevDiv/_build?definitionId=19586)
that can produce a snapshot of the whole Chromium tree for every supported platform
and push a new version to the [electron-chromium][] repository.

### Linux Sysroots

Electron uses sysroots for Linux builds and downloads them before every build.  
Builds consume them from an internal storage.

There's a [CI build](https://devdiv.visualstudio.com/DevDiv/_build?definitionId=19645)
to pull the sysroots and put them in our Azure storage,  
and a Chromium patch to change a location from which the sysroots are downloaded.  

## Build Environments

Each major Electron version has different requirements for a build environment.  
On Windows they include, but are not limited to, Visual Studio version and Windows 10 or 11 SDK version.  
On MacOS it's Xcode and macOS SDK versions.

To be able to build a new major version of Electron internally all build environments  
have to be updated to match the ones the upstream Electron uses. 

## The Update Workflow

1. Use the latest depot tools revision.
1. Create Chromium snapshots for a Chromium version that the new Electron depends on.
1. Update revisions of Electron, Node.js, and Chromium snapshots.
1. Upload new versions of linux sysroots.
1. Prepare build environments for the new Electron.

[config file]: https://devdiv.visualstudio.com/DevDiv/_git/electron-build?path=%2Fconfigs%2Fchromium_snapshot.json
[Chromium]: https://chromium.googlesource.com/chromium/src.git
[DEPS]: https://devdiv.visualstudio.com/DevDiv/_git/electron-build?path=%2FDEPS
[electron-build/configs/mirror_repos]: https://devdiv.visualstudio.com/DevDiv/_git/electron-build?path=%2Fconfigs%2Fmirror_repos
[electron-chromium]: https://devdiv.visualstudio.com/DevDiv/_git/electron-chromium
[get_depot_tools.py]: https://devdiv.visualstudio.com/DevDiv/_git/electron-build?path=%2Fscripts%2Fget_depot_tools.py
