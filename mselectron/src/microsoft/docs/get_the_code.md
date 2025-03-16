## Overview

We use [gclient][] to manage dependencies.

Structure of a build directory:
```
/
  .gclient
  src/
    base/
    electron/
    <...>
    microsoft/  # this repo
      patches/
      src/
        electron/
          lib/
          shell/
        gpu/
        <...>
      <...>
```

## Setup environment

See [Electron build prerequisites][] to setup your environment.

## Disable autocrlf

On Windows, make sure git **autocrlf** option is disabled. If it stays enabled and you try to 
generate a patch file, you'll get a patch that completely rewrites the whole file.
```
$ git config --global core.autocrlf false
```

## Get sources

Create an empty directory for the project.
Make sure that its full path doesn't contain spaces.
```
$ mkdir electron_build  # The exact name is up to you.
```

Get sources of this repo. The exact path to clone it must be `src/microsoft` inside your build directory.
```
$ cd electron_build
$ git clone https://devdiv.visualstudio.com/DevDiv/_git/electron-build src/microsoft
```

## Get depot_tools, add it to the PATH

Clone the repo, and add a path to it to the start of the PATH.

```
$ ./src/microsoft/scripts/get_depot_tools.py [output_dir]
# `output_dir` is an optional path where to download depot tools.
# Defaults to "depot_tools" directory in the current directory.
```

## Pull dependencies

Configure gclient and pull all dependencies.
Run the following scripts in your build directory, e.g. the `electron_build` we created on the Step 1.

First, create a config for gclient:
```
$ ./src/microsoft/scripts/gclient_config.py
# Run the script with `--help` to get a list of all possible arguments.
```

Then on Mac and Windows simply run
```
$ ./src/microsoft/scripts/gclient_sync.py
```

On Linux (Ubuntu)
```
$ ./src/microsoft/scripts/gclient_sync.py --no-hooks
$ ./src/microsoft/scripts/install_linux_dependencies.py
$ ./src/microsoft/scripts/gclient.py runhooks
```

Building on other Linux distributions has not been tested.

## Updating dependencies

### gclient config
`gclient config` has to be rerun in the following cases
- the `gclient_config.py` file is changed. It contains defaults for a `gclient config` call

### gclient sync
`gclient sync` has to be rerun if
- the `gclient_sync.py` file is changed. It contains defaults for a `gclient sync` call
- a `.gclient` file is changed by a `gclient config` call or manually
- the `DEPS` file in the root of this repository is changed
- a patch in the `patches/` folder is added, changed, or removed

## Build

Once everything is set up you're ready to [build Electron](build.md)!

[Electron build prerequisites]: https://electronjs.org/docs/development/build-instructions-gn#platform-prerequisites
[gclient]: https://www.chromium.org/developers/how-tos/depottools
