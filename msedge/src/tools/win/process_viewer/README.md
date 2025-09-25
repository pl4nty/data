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

## Command Line Version
A command line version of the tool is edge_process_list.exe which will list the
currently running Edge processes. This is built off of the internals of Edge
Process Viewer.
