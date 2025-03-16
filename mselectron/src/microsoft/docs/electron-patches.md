# Patches in Electron

Electron is built on two major upstream projects: Chromium and Node.js.
Each of these projects has several of their own dependencies, too.
We try our best to use these dependencies exactly as they are but
sometimes we can't achieve our goals without patching those upstream
dependencies to fit our use cases.

## Patch justification

Every patch in Electron is a maintenance burden. When upstream code
changes, patches can break—sometimes without even a patch conflict or a
compilation error. It's an ongoing effort to keep our patch set
up-to-date and effective. So we strive to keep our patch count at a
minimum. To that end, every patch must describe its reason for existence
in its commit message. That reason must be one of the following:

 1. The patch is temporary, and is intended to be (or has been)
    committed upstream or otherwise eventually removed. Include a link
    to an upstream PR or code review if available, or a procedure for
    verifying whether the patch is still needed at a later date.

 1. The patch allows the code to compile in the Electron environment,
    but cannot be upstreamed because it's Electron-specific
    (e.g. patching out references to Chrome's `Profile`). Include
    reasoning about why the change cannot be implemented without a patch
    (e.g. by subclassing or copying the code).

 1. The patch makes Electron-specific changes in functionality which are
    fundamentally incompatible with upstream.

In general, all the upstream projects we work with are friendly folks
and are often happy to accept refactorings that allow the code in
question to be compatible with both Electron and the upstream project.
(See e.g. [this](https://chromium-review.googlesource.com/c/chromium/src/+/1637040)
change in Chromium, which allowed us to remove a patch that did the same
thing, or [this](https://github.com/nodejs/node/pull/22110) change in
Node, which was a no-op for Node but fixed a bug in Electron.)
**We should aim to upstream changes whenever we can, avoiding indefinite-lifetime patches**.

## Patch system

If you find yourself in the unfortunate position of having to make a
change which can only be made through patching an upstream project,
you'll need to know how to manage patches in Electron.

All of Electron's patches to upstream projects are contained in the
`patches/` directory. Each subdirectory of `patches/` contains a set of
patch files, along with a `.patches` file which lists the order in which
they should be applied. Think of these files as making up a series of
git commits that are applied on top of the upstream project after we
check it out.

```text
patches
├── config.json   <-- this describes which patchset directory is applied to what project
├── chromium
│   ├── .patches
│   ├── accelerator.patch
│   ├── add_contentgpuclient_precreatemessageloop_callback.patch
│   ⋮
├── node
│   ├── .patches
│   ├── add_openssl_is_boringssl_guard_to_oaep_hash_check.patch
│   ├── build_add_gn_build_files.patch
│   ⋮
⋮
```

We provide tools to manage these patch sets: `git-import-patches`, `git-export-patches`, and `git-export-patch`.

  - `git-import-patches` imports a set of patches into a git repository,
    applying each patch in the correct order specified in `.patches`,
    and creating a commit for each one. The commit messages for these
    patches include a small amount of metainfo, such as the original
    patch file's filename, to make re-exporting possible.

  - `git-export-patches` does the reverse of `git-import-patches`:
    it takes a series of patch commits from a repository and saves it
    back as a set of patch files, along with a `.patches` file which
    lists the order of the commits. The directory and name of each patch
    file is taken from the metainfo added by `git-import-patches`.

  - `git-export-patch` is for updating or creating a new .patch file
    from a commit. Since a commit added by hand doesn't have the
    metainfo added by `git-import-patches`, this tool lets you specify
    the patch's destination on the command line.

> Side note: the reason we use a `.patches` file to maintain the order of
> applied patches, rather than prepending a number like `001-` to each file,
> is because it reduces conflicts related to patch ordering. It prevents the
> situation where two PRs both add a patch at the end of the series with the
> same numbering and end up both getting merged resulting in a duplicate
> identifier, and it also reduces churn when a patch is added or deleted in
> the middle of the series.

### Usage

#### Adding a new patch

```bash
cd src/third_party/electron_node
vim some/code/file.cc
git commit
../../electron/script/git-export-patch --patch-dir ../../electron/patches/node `git rev-parse --verify HEAD`
```

> **NOTE**: `git-export-patch` exports a specific commit, so you must
> commit your changes if you want them to be exported. The subject line
> of the commit message will be used to derive the patch file name, and
> the body of the commit message should include the reason for the
> patch's existence.

Re-exporting patches will sometimes cause shasums in unrelated patches
to change. This is generally harmless and can be ignored (but go ahead
and add those changes to your PR, it'll stop them from showing up for
other people).

#### Editing an existing patch

```bash
$ cd src/v8
$ vim some/code/file.cc
$ git log
# Find the commit sha of the patch you want to edit.
$ git commit --fixup [COMMIT_SHA]
$ git rebase --autosquash -i [COMMIT_SHA]^
$ ../electron/script/git-export-patches -o ../electron/patches/v8
```

#### Removing a patch

```bash
$ vim src/electron/patches/node/.patches
# Delete the line with the name of the patch you want to remove
$ cd src/third_party/electron_node
$ git reset --hard refs/patches/upstream-head
$ ../../electron/script/git-import-patches ../../electron/patches/node
$ ../../electron/script/git-export-patches -o ../../electron/patches/node
```

> Side note: When `git-import-patches` is run, it will mark the commit
> that was `HEAD` as `refs/patches/upstream-head`. This mark lets
> `git-export-patches` know what commit to begin at when
> re-exporting patches.

#### Resolving conflicts

When updating an upstream dependency, patches may fail to apply cleanly.
Often, the conflict can be resolved automatically by git with a 3-way merge.
You can instruct `git-import-patches` to use the 3-way merge algorithm by
passing the `-3` argument:

```bash
$ cd src/third_party/electron_node
# If the patch application failed midway through, you can reset it with:
$ git am --abort
# And then retry with 3-way merge:
$ ../../electron/script/git-import-patches -3 ../../electron/patches/node
```

If `git-import-patches -3` encounters a merge conflict that it can't resolve
automatically, it will pause and allow you to resolve the conflict manually.
Once you have resolved the conflict, `git add` the resolved files and
continue to apply the rest of the patches by running `git am --continue`.

###  Advanced Use Cases: Multiple Patch Sets for One Repository

Sometimes a single repository needs to be patched from multiple patch
sets. For example, imagine a downstream fork of Electron that wants to
shrink its build size by not building FFmpeg codecs that it doesn't need.
This fork would use two FFmpeg patch sets: the one in `electron/electron`'s
repository and the one in the downstream fork's:

```text
├── electron
│   ├── patches
│       ├── ffmpeg
│           ├── link_with_loader_path.patch
│           ⋮
│       ⋮
│   ⋮
├── downstream-electron-fork
│   ├── patches
│       ├── ffmpeg
│           ├── set_codec_flavours.patch
│           ⋮
│       ⋮
│   ⋮
⋮
```

The `apply_all_patches.py` and `export_all_patches.py` scripts take multiple
`config.json` files as arguments on the command line. They default to the
single `electron/patches.config.json` file since that is what Electron
maintainers will usually need; but if you need to apply multiple patch sets,
you can pass in  multiple `config.json` files:

```sh
# this applies only Electron's patches
$ electron/script/apply_all_patches.py

# this applies both Electron's patches and the downstream patches
$ electron/script/apply_all_patches.py electron/patches/config.json downstream-electron-fork/patches/config.json
```
