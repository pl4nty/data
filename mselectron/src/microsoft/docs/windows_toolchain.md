# Windows Toolchain

Electron/Chromium on Windows can be built using either a locally installed  
Visual Studio or a downloaded Visual Studio "package". The latter option  
is the default for Google-internal builds [[1][]]. Unfortunately,  
their Visual Studio "packages" are not available for non-Googlers. At Microsoft  
we use the same approach allowing builds with both locally installed VS  
and a downlodable VS package, available only internally.

*Currently there's no way to use a downloadable Visual Studio package  
for local builds. A secure self-service way to access a non-publicly  
accessible Azure Blob Storage has to be found first.*

## How to use a downloadable Visual Studio package

Set a few environment variables before running `gclient` hooks:

-   `DEPOT_TOOLS_WIN_TOOLCHAIN=1`: to indicate that the toolchain should be  
    downloaded.

-   `DEPOT_TOOLS_WIN_TOOLCHAIN_BASE_URL`: path to a folder where downloaded  
    toolchain archives will be stored.

## How to update a toolchain package

A new toolchain can be updated by running the "[electron-util-pack-windows-toolchain][]" 
pipeline. It will mirror the toolchain from electron's build tools, uploading it to 
the msftelectronbuild storage account for later use.

Sometimes the SHA needed by chromium gets mapped to a different SHA for 
the toolchain. When this happens the "[electron-util-pack-windows-toolchain][]" 
pipeline will fail with a message indicating that the specified Windows 
toolchain SHA maps to another value. The `MICROSOFT_TOOLCHAIN_HASH` in 
"[scripts/lib/vs_toolchain.py][]" should be updated with the mapped value; 
otherwise `MICROSOFT_TOOLCHAIN_HASH` should be set to the same value as `CHROMIUM_TOOLCHAIN_HASH`.

[1]: https://chromium.googlesource.com/chromium/src/+/master/docs/windows_build_instructions.md
[electron-util-pack-windows-toolchain]: https://devdiv.visualstudio.com/DevDiv/_build?definitionId=19585
[scripts/lib/vs_toolchain.py]: https://devdiv.visualstudio.com/DevDiv/_git/electron-build?path=%2Fscripts%2Flib%2Fvs_toolchain.py
