# How To: Use reclient locally

## Overview

Reclient is a distributed compiler service for open-source projects such as Electron. Using it should result in
significantly faster build times.

Reclient documentation for Electron can be found [here](https://github.com/electron/electron/blob/main/docs/development/reclient.md).

## Setup environment

## Getting and running reclient
reclient can be enabled by running the following in the project directory.
```
# in src/
$ ./scripts/checkout_reclient_helper.py --replace
```
This will create a "rbe-credential-helper" directory next to "src".

Login to reclient. Authentication token will expire in a couple of months, then you'll have to do it again.
```
$ `rbe-credential-helper login` to get an authorization URL.  Copy the authorization URL to a browser and log in with your "@microsoft.com" account.
```

## Building Electron
Follow [instructions](../build.md) for building Electron. While generating build files use additional `--reclient` flag.

```
# Generate build files.
# in src/
$ ./microsoft/scripts/gn_gen.py out/Testing --testing --reclient [--for vscode]
```

While running the build, use `autoninja` and specify the number of cores to be used with `-j` argument.
```
# Run the build.
# in src/
$ autoninja -C out/Testing -j 200 electron
```
Do not set the value higher than 200.
