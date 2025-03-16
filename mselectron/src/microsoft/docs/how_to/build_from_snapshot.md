# How To: Build Electron from snapshot

The following instructions assume that the archive is already unpacked
and the current directory is the archive root with the following contents.

```
.gclient
.gclient_entries
depot_tools
src
```

Make sure that absolute path of the root directory of the unpacked archive doesn't have spaces.

## Set up build environment

Follow instructions in the "System requirements" section in a doc for your system
- Linux: /src/docs/linux_build_instructions.md
- Mac: /src/docs/mac_build_instructions.md
- Windows: /src/docs/windows_build_instructions.md

## Amend PATH

Add the `depot_tools` directory to the PATH environment variable as the last entry.

## Generate build files

```
cd src
python script/microsoft/gn_gen.py out/release --release
```

## Run a build

```
$ ninja -C out/release electron
```

The build results will be available in the `src/out/release/` directory.

## Optionally rename the resulting binary

Follow the [Electron instructions][] to rename the resulting binary.

[Electron instructions]: https://electronjs.org/docs/tutorial/application-distribution#rebranding-with-downloaded-binaries
