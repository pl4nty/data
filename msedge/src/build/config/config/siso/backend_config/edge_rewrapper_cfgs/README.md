# Edge rewrapper configurations

These checked-in templates provide the files expected by Chromium's Windows
and macOS Siso rule loaders. `configure_siso.py` installs the appropriate
configuration in `buildtools/reclient_cfgs` when the Edge REAPI instance is
selected. This remains independent of the backend filename so the latest
sealion configuration can build older Chromium revisions during bisects.

The Clang and CIPD versions are resolved from their definitions in the
Chromium checkout when the configuration is installed. Keep the remaining
platform properties synchronized with `edge.star`.
