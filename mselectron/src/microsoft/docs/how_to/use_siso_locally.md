# How To: Use siso (RBE) locally

## Overview

RBE is a distributed compiler service for open-source projects such as Electron. Using it should result in
significantly faster build times.

## Building Electron
Follow [instructions](../build.md) for building Electron. While generating build files use additional `--siso` flag.

```
# Generate build files.
# in src/
$ ./microsoft/scripts/gn_gen.py out/Testing --testing --siso [--for vscode]
```

In order to access the Electron RBE cluster, use electron's [build tools](https://github.com/electron/build-tools.git).
To setup electron build tools for siso, you will need the following configs alongside the regular electron build tool
configs:
```
    ...
    "args": [
      ...
      "use_remoteexec=true",
      "use_reclient=false"      
    ],
    "remoteBuild": "siso"
    ...
```
 Once build tools is configured, use Electron build tools'  `e d` command with `autoninja`:  
```
# Run the build.
# in src/
$ e d autoninja -C out/Testing -remote_jobs 200 -reapi_instance "projects/electron-rbe/instances/default_instance" -load electron/build/siso/main.star electron
```
Do not set the value higher than 200 for `remote-jobs`.
