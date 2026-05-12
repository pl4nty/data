// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/edge_data_provider/ipc_thread.h"

#include "base/message_loop/message_pump_type.h"

namespace process_viewer {

IpcThread::~IpcThread() = default;

IpcThread::IpcThread() : thread_("ipc!") {
  thread_.StartWithOptions(base::Thread::Options(base::MessagePumpType::IO, 0));
  // As long as this object is alive, all Mojo API surface relevant to IPC
  // connections is usable, and message pipes which span a process boundary
  // will continue to function.
  ipc_support_.emplace(thread_.task_runner(),
                       mojo::core::ScopedIPCSupport::ShutdownPolicy::CLEAN);
}

}  // namespace process_viewer
