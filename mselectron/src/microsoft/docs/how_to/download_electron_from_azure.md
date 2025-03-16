# How To: Download Electron from Azure

## Use `@electron/get` in JavaScript or TypeScript code

Check the [@electron/get#readme][] for basic usage examples.

```ts
import { downloadArtifact } from '@electron/get';

const version = '...';  // Electron version, e.g. '17.0.0'.
const flavour = '...';  // Microsoft Electron flavour, e.g. 'vscode'.
const buildNumber = '...';  // Microsoft Electron build number, e.g. '11828083'.

// Make the tool to use the internal Azure storage.
const mirrorOptions = {
  customDir: `${version}/${flavour}/${buildNumber}`,
  mirror: 'https://msftelectronbuilds.z5.web.core.windows.net/builds/',
};

const electronZipPath = await downloadArtifact({
  artifactName: 'electron',  // For the main binary.
  mirrorOptions,
  version,
});

// Then unzip and move the archive contents anywhere you want.
```

## Use `electron-download` in a command line

*The package is obsolete and has been replaced by the aforementioned `@electron/get`
but the latter doesn't have a CLI.* 

Get the package from npm and install it globally:

```bash
$ npm install -g electron-download
```

Below is an example of how to use environment variables  
to download Electron from the internal Azure-backed storage:

```bash
$ export ELECTRON_MIRROR='https://msftelectronbuilds.z5.web.core.windows.net/builds/'
$ export ELECTRON_CUSTOM_DIR='27.1.3/vscode/8841836'
$ electron-download --version 27.1.3

# On a Mac it will download an Electron archive from the following URL:
# https://msftelectronbuilds.z5.web.core.windows.net/builds/27.1.3/vscode/8841836/electron-v27.1.3-darwin-x64.zip
```

`ELECTRON_CUSTOM_DIR` serves as a unique release identifier.  
It consists of three parts: an Electron version, a Microsoft build flavour, and a build number.

There's a minor inconvenience of having to specify an Electron version twice.  
Sorry for that.

[@electron/get#readme]: https://github.com/electron/get#readme
