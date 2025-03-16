# How To: Cross-compile for Windows

See [Chromium docs][] for the motivation and the general guidance.

## Microsoft-internal

1.  A Windows toolchain package can be created using  
the [electron_util_pack_windows_toolchain][] pipeline. Results may differ  
for different branches, so make sure to run it from your branch.

1.  You can set `target_os` in your ".gclient" config using  
the "gclient_config.py" script. Check the script's help to find out how.

1.  Set `DEPOT_TOOLS_WIN_TOOLCHAIN=1` envrironment variable before running  
gclient. We set it to `0` by default to avoid using the Chromium toolchain.

1.  There's no need to set `GYP_MSVS_HASH_?=?` variable manually,  
it is already set in our gclient wrapper script.  
If there are errors related to it maybe it needs to be updated there.

[Chromium docs]: https://chromium.googlesource.com/chromium/src.git/+/HEAD/docs/win_cross.md
[electron_util_pack_windows_toolchain]: https://devdiv.visualstudio.com/DevDiv/_build?definitionId=19585
