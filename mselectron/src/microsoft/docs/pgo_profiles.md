# PGO profiles

For all flavours except electron, the `pgo_data_path` gn arg defaults
to a path in the "electron-build" repo. The path is `src/microsoft/build/pgo_profiles/*flavour*-*target*.profdata`
where *flavour* is the flavour name and *target* is `_pgo_target` in `src/build/config/compiler/pgo/BUILD.gn`.
