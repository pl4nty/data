// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_EDGE_WATCHER_CLIENT_H_
#define TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_EDGE_WATCHER_CLIENT_H_

#include "base/threading/thread.h"
#include "mojo/public/cpp/bindings/associated_receiver.h"
#include "mojo/public/cpp/bindings/remote.h"
#include "mojo/public/cpp/system/isolated_connection.h"
#include "tools/win/process_viewer/common/edge_watcher.mojom.h"
#include "tools/win/process_viewer/data_provider/task_manager_client.h"

namespace process_viewer {

// This class acts as the client side of an isolated Mojo connection, and will
// be notified by the server of all shared memory regions containing the tasks
// from Edge browser processes.
class EdgeWatcherClient : public mojom::EdgeWatcherClient {
 public:
  EdgeWatcherClient();
  ~EdgeWatcherClient() override;
  EdgeWatcherClient(const EdgeWatcherClient&) = delete;
  EdgeWatcherClient& operator=(const EdgeWatcherClient&) = delete;

  // Initializes the EdgeWatcherClient. Must be called before any other methods.
  bool Initialize();

  // Connects to the EdgeWatcher server.
  bool ConnectToServer();

  // Gets the list of tasks from shared memory.
  bool GetMonitoredTasks(base::ProcessId browser_process_id,
                         std::vector<Task>* tasks);

  // mojom::EdgeWatcherClient:
  void OnSharedMemoryRegionChanged(base::ProcessId browser_process_id,
                                   uint32_t shared_mem_handle,
                                   uint64_t shared_mem_size,
                                   uint64_t guid_high,
                                   uint64_t guid_low) override;

 private:
  void ConnectOnIpcThread();

  void DisconnectOnIpcThread();

  bool IsConnected();

  struct ReadOnlySharedMemory {
    base::ReadOnlySharedMemoryRegion region;
    base::ReadOnlySharedMemoryMapping mapping;
  };

  // IPC thread to provide a TaskRunner without imposing any requirement on the
  // consumer of this class.
  std::unique_ptr<base::Thread> ipc_thread_;

  // All Mojo objects must only be accessed on the IPC thread.
  std::unique_ptr<mojo::IsolatedConnection> mojo_connection_;
  mojo::Remote<mojom::EdgeWatcher> edge_watcher_;
  mojo::AssociatedReceiver<mojom::EdgeWatcherClient> receiver_;

  base::Lock lock_;
  bool is_connected_ = false;
  std::map<base::ProcessId, std::unique_ptr<ReadOnlySharedMemory>>
      shared_memory_;
};

}  // namespace process_viewer

#endif  // TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_EDGE_WATCHER_CLIENT_H_
