// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_EDGE_WATCHER_CLIENT_H_
#define TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_EDGE_WATCHER_CLIENT_H_

#include "base/synchronization/lock.h"
#include "base/threading/thread.h"
#include "chrome/common/edge_external_task_manager/external_task_manager.mojom.h"
#include "mojo/public/cpp/bindings/associated_receiver.h"
#include "mojo/public/cpp/bindings/remote.h"
#include "mojo/public/cpp/system/isolated_connection.h"
#include "tools/win/process_viewer/common/edge_watcher.mojom.h"
#include "tools/win/process_viewer/data_provider/task_export.h"
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

  // Gets the list of tasks from latest update
  EdgeTaskExportSnapshot* GetLastSnapshot(base::ProcessId browser_process_id);

  // mojom::EdgeWatcherClient:
  void OnTasksUpdated(
      base::ProcessId browser_process_id,
      std::vector<external_task_manager::mojom::TaskPtr> tasks) override;

 private:
  void ConnectOnIpcThread();

  void DisconnectOnIpcThread();

  bool IsConnected();

  // IPC thread to provide a TaskRunner without imposing any requirement on the
  // consumer of this class.
  std::unique_ptr<base::Thread> ipc_thread_;

  // All Mojo objects must only be accessed on the IPC thread.
  std::unique_ptr<mojo::IsolatedConnection> mojo_connection_;
  mojo::Remote<mojom::EdgeWatcher> edge_watcher_;
  mojo::AssociatedReceiver<mojom::EdgeWatcherClient> receiver_;

  base::Lock lock_;
  std::map<base::ProcessId, std::vector<external_task_manager::mojom::Task>>
      tasks_ GUARDED_BY(lock_);
  bool is_connected_ = false;
};
}  // namespace process_viewer

#endif  // TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_EDGE_WATCHER_CLIENT_H_
