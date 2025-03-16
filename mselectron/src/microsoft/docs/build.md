## How to build Electron

Make sure you have a [local checkout](get_the_code.md) already set up.

### First build
```
$ cd src

# Generate build files.
$ ./microsoft/scripts/gn_gen.py out/testing --testing [--for vscode]

# And run the build.
$ ninja -C out/testing electron
```

### Rebuilds

#### gn gen
The `gn_gen.py` script has to be rerun if
- its previous run has been interrupted and now the whole build dir seems to be broken
- there is a "Can't load input file" error when you run `ninja`

It is safe to rerun `gn_gen.py` any time, it's fast and doesn't break anything.

#### ninja
It is safe to rerun `ninja` any time you want, it's smart enough to rebuild only things that have to be rebuilt.
