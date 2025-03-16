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

A new package can be generated using  
the "[electron-util-pack-windows-toolchain][]" pipeline. It will pack  
Visual Studio installed on the agent machine. Then the resulting archive can  
be uploaded to the "windows-toolchain" container by running  
the "[electron-upload-windows-toolchain][]" pipeline.

Once the new package is present in the storage,  
update `MICROSOFT_TOOLCHAIN_HASH` in "[scripts/lib/vs_toolchain.py][]".

[1]: https://chromium.googlesource.com/chromium/src/+/master/docs/windows_build_instructions.md
[electron-util-pack-windows-toolchain]: https://devdiv.visualstudio.com/DevDiv/_build?definitionId=19585
[electron-upload-windows-toolchain]: https://devdiv.visualstudio.com/DevDiv/_release?_a=releases&view=all&definitionId=3413
[scripts/lib/vs_toolchain.py]: https://devdiv.visualstudio.com/DevDiv/_git/electron-build?path=%2Fscripts%2Flib%2Fvs_toolchain.py
