# Edge Process Viewer

## Overview

The Edge Process Viewer is a tool for debugging the process model in Edge based
applications. It consists of three main pieces:

1. External Task Manager Handler code in Browser Process
2. Edge Process Watcher
3. Edge Process Viewer

Typical use cases include monitoring tasks as they enter into their processes
or debugging a hanging process.

The communication is built off of Mojo IsolatedConnection and Mojo interfaces.

## External Task Manager Handler in the Browser Process
This is built into the browser process. The code is located at:
chrome/browser/edge_external_task_manager

This hooks into the Task Manager code built by Upstream Chromium. When the
Task Manager calls OnTasksRefreshed, the handler will send a message to every
connected ExternalTaskManagerClient.

## Edge Process Watcher
edge_process_watcher.exe is set to start at OS startup. Edge Process Watcher
has an ExternalTaskManagerClient instance per browser process. If Edge is hung
and unable to respond to Mojo communications, edge_process_watcher.exe will
have a snapshot of the last update before hanging.

## Edge Process Viewer
The UI is built in C#, which is compiled using Visual Studio. The
process_viewer_data.dll is what communicates directly with Edge Process Watcher
and the External Task Manager Handler and the C# code calls into the C++ code.

The Edge Process Viewer prioritizes the results from
edge_process_watcher.exe and if that does not have any results, will make it's
own ExternalTaskManagerClient to communicate with Edge.

### Postmortem debugger registration

Interactive debugging accepts the configured debugger and per-user debugger
discovery. Machine-wide postmortem registration requires a local `.exe` whose
resolved file and every parent directory are owned and protected by Windows or
the Administrators group. User-owned files, writable ancestors, unsupported ACLs,
and unresolved or remote targets fail with an error before registry access.
Use an administrator-installed debugger for postmortem debugging; UAC approval
does not authorize a user-writable installation. Registration quotes a resolved
volume-GUID path to avoid ambiguous executable parsing and per-user drive aliases.
Disabling does not require a debugger installation.

Run isolated native .NET Framework 4.8 regressions from PowerShell:

```powershell
& .\tools\win\process_viewer\EdgeProcessViewer\Tests\Run-Tests.ps1
```

The runner requires a .NET SDK and the .NET Framework 4.8 targeting pack. Its
positive control reads an existing protected executable with a space in its path
(`-ProtectedExecutable` overrides the default .NET host). The runner requires
explicit `Compile` items in the project and reports an error if none are found.
Tests compile all project C# sources, exercise the registration handlers and
task-copy ordered union, and use an in-memory registry. They never launch a
debugger, write HKLM, elevate, or install components.

## Command Line Version
A command line version of the tool is edge_process_list.exe which will list the
currently running Edge processes. This is built off of the internals of Edge
Process Viewer.
