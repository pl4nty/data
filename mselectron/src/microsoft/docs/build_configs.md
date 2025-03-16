# Build Configs

Those are sets of build flags for various products Electron is built for.  
Typically the flags are only used to enable Microsoft-internal features,  
but also can change any Chromium or Electron defaults.

Values listed in the files are passed to a `gn gen` call as individual arguments  
so they can shadow already defined values in imported configs.  
Importing a config could result in conflicts which [is not allowed by GN][].

[is not allowed by GN]: https://gn.googlesource.com/gn/+/master/docs/reference.md#func_import
