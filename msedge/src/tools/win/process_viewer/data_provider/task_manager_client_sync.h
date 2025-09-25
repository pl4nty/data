// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_TASK_MANAGER_CLIENT_SYNC_H_
#define TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_TASK_MANAGER_CLIENT_SYNC_H_

#include <memory>

#include "base/functional/callback.h"
#include "base/synchronization/lock.h"
#include "base/synchronization/waitable_event.h"
#include "base/task/sequenced_task_runner.h"
#include "base/threading/thread.h"
#include "tools/win/process_viewer/data_provider/task_export.h"
#include "tools/win/process_viewer/data_provider/task_manager_client.h"

namespace base {
class Thread;
}  // namespace base

namespace process_viewer {

// This class wraps the async TaskManagerClient class and creates a TaskRunner
// for it, so that a consumer can use this class via sync method calls without
// any knowledge of a TaskRunner.
class TaskManagerClientSync : public TaskManagerClient::Observer {
 public:
  TaskManagerClientSync();
  ~TaskManagerClientSync() override;

  TaskManagerClientSync(const TaskManagerClientSync&) = delete;
  TaskManagerClientSync& operator=(const TaskManagerClientSync&) = delete;

  // Initializes the TaskManagerClient.
  bool Initialize();

  // Establishes a connection to the specified Edge browser process.
  bool ConnectToServer(ULONG process_id, const base::TimeDelta& wait_delta);

  // Gets a snapshot of the current set of tasks known to the Edge browser's
  // task manager. Returns false if the browser doesn't reply within the allowed
  // time.
  bool UpdateSnapshot(const base::TimeDelta& wait_delta);

  // Gets the last snapshot as an EdgeTaskExportSnapshot. The caller is
  // responsible for deleting the returned object.
  EdgeTaskExportSnapshot* GetLastSnapshot();

  std::vector<external_task_manager::mojom::Task> GetLastTasks();

  // TaskManagerClient::Observer:
  void OnConnected(ULONG process_id) override;

  void OnConnectionClosed(ULONG process_id) override;

  void OnGotSnapshot(
      ULONG process_id,
      const std::vector<external_task_manager::mojom::Task>& tasks) override;

 private:
  void ConnectOnIpcThread(ULONG process_id);

  void RequestSnapshotOnIpcThread();

  bool IsConnected();

  // IPC thread to provide a TaskRunner without imposing any requirement on the
  // consumer of this class.
  std::unique_ptr<base::Thread> ipc_thread_;

  // All TaskManagerClient methods must be called on the IPC thread.
  std::unique_ptr<TaskManagerClient> task_manager_client_;

  base::Lock lock_;
  std::vector<external_task_manager::mojom::Task> last_snapshot_tasks_
      GUARDED_BY(lock_);

  base::WaitableEvent connect_complete_event_;
  base::WaitableEvent snapshot_complete_event_;
};

}  // namespace process_viewer

#endif  // TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_TASK_MANAGER_CLIENT_SYNC_H_
