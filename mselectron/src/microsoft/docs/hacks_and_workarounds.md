# Hacks and Workarounds

*The ugly stuff, yeah.*

## msdia*.dll

### Context

To generate breakpad symbols on Windows a `dump_syms.exe` binary is used.  
The binary requires a `msdia*.dll` library to be available in the system.  
Google ships that library with its Visual Studio toolchain distribution,  
for non-Googlers the library is expected to be present inside an installed Visual Studio.

There's a `gclient` hook that runs the `src/tools/clang/scripts/update.py` script  
which copies an `amd64` version of the library  
to the `src/third_party/llvm-build/Release+Asserts/bin/` directory.

An Electron's script that is used to generate breakpad symbols  
(`src/electron/script/dump-symbols.py`) adds the aforementioned `.../llvm-build/...` path  
to the `PATH` before running the `dump_syms.exe`.

### The problem

Everything works fine for the upstream Electron and, obviously, for Chromium.  
But for some reason (TM) in the internal builds symbols would be generated fine  
for the `x64` configuration only, but not for the `x86` one, see issue [#481485][].

A `dump_syms.exe` execution would fail with an error
```
CoCreateInstance CLSID_DiaSource {E6756135-1E65-4D17-8576-610761398C3C} failed (msdia*.dll unregistered?)
Open failed
```

The same thing happens if the upstream Electron is built on Windows build agents we use.  
So it looks like an environment configuration issue.

### Current solution

The problem goes away if we use the `ia32` version of the library instead.  
So before running the `dump_syms.exe` we manually copy that library version  
to the same location replacing the `amd64` version.

### Proper solution

Since it looks like a build agent configuration issue (see above)  
we should update the way the Windows build agents are set up.

## Bypass the CredScan hook for "electron/node"

### Context

The [Electron's Node.js fork][] repo is regularly mirrored to the internal [electron-node][] repo.

Every repo in the "domoreexp" has a git pre-receive hook installed
to scan the changes pushed for credentials, e.g. passwords or certificates.  
If anything is found the push is rejected with an error:

```
! [remote rejected]       upstream/electron-node-v12.x -> electron-node-v12.x (VS403654: The push was rejected because it might contain credentials or other secrets.

/test/fixtures/test_unknown_privkey.pem(1,1-27) : error : CSCAN0060 : hash K4LFfz40Tf2WjHYSwHcxzmrGBXdPbp+75ngl6MIfimE=

If these are valid credentials, even for non-production resources, you must remove them from Git’s branch history by resetting your branch or squashing all commits.
See https://aka.ms/1escredscan for instructions. Please report any false positives to 1ESSecTools@microsoft.com.

NOTE: It is not enough to remove the secrets and push another change. You must reset your branch according to the instructions.

If this is a false positive, you can bypass credential scanning (for this push alone) by running these commands, assuming that you have no staged changes:

    git commit -m "**DISABLE_SECRET_SCANNING**" --allow-empty
    git push

Alternatively, see https://aka.ms/1escredscan for instructions on how to use the hash values emitted above in a suppressions file to suppress false positives.)
error: failed to push some refs to 'https://devdiv.visualstudio.com/DevDiv/_git/electron-node'
```

### The problem

Node.js 12.x.y contains some certificate in its test assets.  
So when this version is about to be pushed to the internal repo,
the push always gets rejected by the pre-receive hook.

### Current solution

During mirroring of the `electron/node` repo an empty commit is added for all branches before pushing.  
That commit has a magic commit message that disabled the pre-receive hook. See details in the error message above.

### Proper solution

That pre-receive hook has to be disabled for the [electron-node][] repo. And for all other internal mirrors we use.  
Issue [#526012][] has been created with a request to do it for us.

## git.bat

### Context

In some cases gclient on Windows calls git commands assuming there's "git.bat" somewhere in the PATH. It does this
because depot_tools create a "git.bat" file inside itself during a bootstrap on Windows.

### The problem

Internal build explicitly disable depot_tools bootstrap on Windows because we don't have access to the Google-internal
storage. Also Git installation on Windows doesn't contains any "git.bat" files. So no "git.bat" can be found in the PATH
and all calls of "git.bat" fail with an error:

```
'git.bat' is not recognized as an internal or external command, operable program or batch file.
```

### Current solution

Create a "git.bat" file in the depot_tools directory, which simply calls "git.exe" with the same arguments.

### Proper solution

gclient should check if "git.bat" can be found in the PATH first and, if not, call "git.exe".

[#481485]: https://domoreexp.visualstudio.com/MSTeams/_workitems/edit/481485
[Electron's Node.js fork]: https://github.com/electron/node
[electron-node]: https://devdiv.visualstudio.com/DevDiv/_git/electron-node
[#526012]: https://domoreexp.visualstudio.com/MSTeams/_workitems/edit/526012
