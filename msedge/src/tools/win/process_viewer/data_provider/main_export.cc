// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <windows.h>

#include "base/at_exit.h"
#include "base/threading/thread.h"
#include "mojo/core/embedder/embedder.h"
#include "mojo/core/embedder/scoped_ipc_support.h"
#include "mojo/public/c/system/core.h"

namespace {
std::unique_ptr<base::Thread> ipc_thread;
std::unique_ptr<mojo::core::ScopedIPCSupport> ipc_support;
base::AtExitManager* exit_manager = nullptr;

extern "C" {

__declspec(dllexport) bool InitializeEdgeDataProvider() {
  exit_manager = new base::AtExitManager;

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

  return true;
}

__declspec(dllexport) void UninitializeEdgeDataProvider() {
  ipc_thread->Stop();
  ipc_support.reset();
  delete exit_manager;
}

}  // extern "C"

}  // namespace

BOOL WINAPI DllMain(HINSTANCE module, DWORD reason, LPVOID reserved) {
  switch (reason) {
    case DLL_PROCESS_ATTACH:
      // Disable DLL_THREAD_(DE|AT)TACH notifications, reduces working set
      DisableThreadLibraryCalls(reinterpret_cast<HMODULE>(module));
      break;
  }
  return TRUE;
}
