// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <windows.h>

#include <optional>

#include "base/at_exit.h"
#include "mojo/core/embedder/embedder.h"
#include "mojo/public/c/system/core.h"
#include "tools/win/process_viewer/edge_data_provider/ipc_thread.h"

namespace {

class DataProviderWrapper final {
 public:
  DataProviderWrapper();
  ~DataProviderWrapper() = default;

  DataProviderWrapper(const DataProviderWrapper&) = delete;
  DataProviderWrapper& operator=(const DataProviderWrapper&) = delete;

 private:
  base::AtExitManager at_exit_;
  std::optional<process_viewer::IpcThread> ipc_thread_;
};

DataProviderWrapper::DataProviderWrapper() {
  mojo::core::EnableMojoIpcz();
  mojo::core::Init({.is_broker_process = true});
  ipc_thread_.emplace();
}

DataProviderWrapper* data_provider_wrapper = nullptr;

extern "C" {

__declspec(dllexport) bool InitializeEdgeDataProvider() {
  data_provider_wrapper = new DataProviderWrapper;
  return true;
}

__declspec(dllexport) void UninitializeEdgeDataProvider() {
  delete data_provider_wrapper;
  data_provider_wrapper = nullptr;
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
