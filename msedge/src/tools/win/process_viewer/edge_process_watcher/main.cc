// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <windows.h>

#include "base/at_exit.h"
#include "base/command_line.h"
#include "base/files/file_path.h"
#include "base/path_service.h"
#include "base/process/launch.h"
#include "base/process/process_info.h"
#include "base/run_loop.h"
#include "base/task/single_thread_task_executor.h"
#include "base/threading/platform_thread.h"
#include "base/threading/thread.h"
#include "base/win/scoped_com_initializer.h"
#include "mojo/core/embedder/embedder.h"
#include "mojo/core/embedder/scoped_ipc_support.h"
#include "mojo/public/c/system/core.h"
#include "tools/win/process_viewer/edge_process_watcher/edge_watcher.h"
#include "tools/win/process_viewer/edge_process_watcher/edge_watcher_server.h"

namespace {
constexpr char kFirstRunSwitch[] = "firstrun";
}

const bool use_ipcz = true;

int WINAPI wWinMain(HINSTANCE, HINSTANCE, wchar_t*, int) {
  base::win::ScopedCOMInitializer com_initializer;
  if (!com_initializer.Succeeded()) {
    return 1;
  }

  // The installer may launch us elevated, which will prevent communication with
  // the non-elevated client process. In that case, relaunch as non-elevated.
  // But don't relaunch in other cases, as we may be running elevated because
  // the user explicitly chose to do so, or because UAC is turned off.
  base::CommandLine::Init(0, nullptr);
  if (base::CommandLine::ForCurrentProcess()->HasSwitch(kFirstRunSwitch) &&
      base::IsCurrentProcessElevated()) {
    base::FilePath current_exe;
    if (base::PathService::Get(base::FILE_EXE, &current_exe)) {
      base::LaunchNonElevatedProcess(base::CommandLine(current_exe), {});
    }
    return 0;
  }

  base::AtExitManager exit_manager;
  std::unique_ptr<base::Thread> ipc_thread;
  std::unique_ptr<mojo::core::ScopedIPCSupport> ipc_support;

  if (use_ipcz) {
    mojo::core::EnableMojoIpcz();
    mojo::core::Init({.is_broker_process = true});

    ipc_thread = std::make_unique<base::Thread>("ipc!");
    ipc_thread->StartWithOptions(
        base::Thread::Options(base::MessagePumpType::IO, 0));

    // As long as this object is alive, all Mojo API surface relevant to IPC
    // connections is usable, and message pipes which span a process boundary
    // will continue to function.
    ipc_support = std::make_unique<mojo::core::ScopedIPCSupport>(
        ipc_thread->task_runner(),
        mojo::core::ScopedIPCSupport::ShutdownPolicy::CLEAN);
  } else {
    MojoResult result = MojoInitialize(nullptr);
    if (result != MOJO_RESULT_OK) {
      printf("Failed to initialize mojo.\n");
      return 1;
    }
  }

  // Run a message loop on the main thread.
  base::PlatformThread::SetName("EdgeWatcherThread");
  base::SingleThreadTaskExecutor taskExecutor(base::MessagePumpType::DEFAULT);
  base::RunLoop run_loop;

  process_viewer::EdgeWatcherServer edge_watcher_server;
  edge_watcher_server.StartServer();

  process_viewer::EdgeWatcher edge_watcher;
  edge_watcher.AddObserver(&edge_watcher_server);
  edge_watcher.StartWatching();

  run_loop.Run();

  if (!use_ipcz) {
    MojoShutdown(nullptr);
  }

  return 0;
}
