## Overview

We use Electron scripts to apply patches to Chromium and other repositories.
Patches for different repositories have to be placed in different folders
because those Electron scripts expect them to be organized like that.
We additionally split patches into several groups to make build customization
more flexible. So the final folder structure looks like this:

```
patches/
  group_one/
    config.json
    project_one/
      .patches
      change_one.patch
      change_two.patch
    project_two/
      .patches
      another_patch.patch
  group_two/
    config.json
    project_one/
      .patches
      yet_another_patch.patch
```

Please refer to [Electron's patch documentation](https://github.com/electron/electron/blob/main/docs/development/patches.md)
for information on the purpose and structure of these files.

Use `scripts/import_patches.py` and `scripts/export_patches.py` to bulk-import
and export our electron-build patches. These scripts are similar to upstream's
`apply_all_patches.py` and `export_all_patches.py` but have extra to handle
Chromium snapshots and know where our patchsets' `config.json` files are.
New patches should be added with `export_patch.py`, just as upstream does.

## Patches Groups

### `backports/`

Backports of security-related or other important fixes in Electron and/or Chromium.

### `customization/`

Contains patches that add Microsoft-internal features for various Microsoft products that require customization.

## Customization Patches

Those add Microsoft-specific features to Electron. Typically one patch adds one feature.
Despite the fact that different Microsoft products need different sets of features all patches are always applied,
and the list of enabled features is controlled by build flags.
This approach requires few things to keep in mind while writing patches:
- every change in a patch has to be guarded by a build flag
- when a build flag is disabled the original behaviour has to be preserved
- all build flags have to be disabled by default
