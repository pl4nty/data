// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_EDGE_DATA_PROVIDER_IPC_THREAD_H_
#define TOOLS_WIN_PROCESS_VIEWER_EDGE_DATA_PROVIDER_IPC_THREAD_H_

#include <optional>

#include "base/threading/thread.h"
#include "mojo/core/embedder/scoped_ipc_support.h"

namespace process_viewer {

// Manages an IO thread and Mojo IPC support lifetime. The thread is started
// and IPC support is established on construction. Members are declared so that
// reverse destruction order tears down IPC support (allowing CLEAN shutdown on
// the IO thread) before the thread is stopped.
class IpcThread {
 public:
  IpcThread();
  ~IpcThread();

  IpcThread(const IpcThread&) = delete;
  IpcThread& operator=(const IpcThread&) = delete;

 private:
  base::Thread thread_;
  std::optional<mojo::core::ScopedIPCSupport> ipc_support_;
};

}  // namespace process_viewer

#endif  // TOOLS_WIN_PROCESS_VIEWER_EDGE_DATA_PROVIDER_IPC_THREAD_H_
