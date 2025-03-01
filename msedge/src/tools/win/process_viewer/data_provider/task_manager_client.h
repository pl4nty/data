// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_TASK_MANAGER_CLIENT_H_
#define TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_TASK_MANAGER_CLIENT_H_

#include <memory>

#include "base/functional/callback.h"
#include "base/memory/read_only_shared_memory_region.h"
#include "base/observer_list.h"
#include "base/task/sequenced_task_runner.h"
#include "base/synchronization/lock.h"
#include "base/synchronization/waitable_event.h"
#include "base/task/sequenced_task_runner.h"

#include <string>

namespace base {
class PickleIterator;
}  // namespace base

namespace edge_external_task_manager {
enum class MessageIdFromClient;
}  // namespace edge_external_task_manager

namespace process_viewer {

class ServerConnection;

struct Task {
  int64_t task_id;
  ULONG process_id;
  std::wstring title;
};

// This class connects to an Edge browser process in order to obtain data about
// tasks from the browser's task manager.
class TaskManagerClient {
 public:
  class Observer : public base::CheckedObserver {
   public:
    virtual void OnConnected(ULONG process_id) = 0;

    virtual void OnConnectionClosed(ULONG process_id) = 0;

    virtual void OnGotSnapshot(ULONG process_id,
                               const std::vector<Task>& tasks) = 0;

    virtual void OnSharedMemoryRegionChanged(
        ULONG process_id,
        const base::ReadOnlySharedMemoryRegion& region) = 0;
  };

  TaskManagerClient();
  explicit TaskManagerClient(
      scoped_refptr<base::SequencedTaskRunner> task_runner);
  ~TaskManagerClient();

  TaskManagerClient(const TaskManagerClient&) = delete;
  TaskManagerClient& operator=(const TaskManagerClient&) = delete;
  // Initiates a connection to the specified Edge browser process. When the
  // connection is successfully established, OnConnected will be called for any
  // observers.
  bool ConnectToServer(ULONG process_id);

  // Closes the connection to the Edge browser process.
  void Disconnect();

  // Requests a snapshot of the current set of tasks known to the Edge browser's
  // task manager. When the browser replies, OnGotSnapshot will be called for
  // any observers.
  bool RequestSnapshot();

  // Starts monitoring the tasks known to the Edge browser's task manager,
  // updating periodically. The list of tasks will be stored in a shared memory
  // region. When the region is created or moved, OnSharedMemoryRegionChanged
  // will be called for any observers
  bool StartMonitoring();

  // Stops monitoring tasks.
  bool StopMonitoring();

  // Gets the list of tasks as of the last periodic update.
  bool GetMonitoredTasks(std::vector<Task>* tasks);

  // Adds and removes observers.
  void AddObserver(Observer* observer);
  void RemoveObserver(const Observer* observer);

  // Gets the list of tasks from the buffer of the shared memory region.
  static bool GetMonitoredDataFromBuffer(const void* buffer,
                                         size_t buffer_size,
                                         std::vector<Task>* tasks);

 private:
  void WriteMessage(edge_external_task_manager::MessageIdFromClient message_id);

  void OnMessageReceived(const void* payload, uint32_t payload_size);
  void OnConnectionClosed();

  void HandleVersionMessage(base::PickleIterator* iter);
  void HandleSnapshotMessage(base::PickleIterator* iter);
  void HandleUpdatedSharedMemoryLocationMessage(base::PickleIterator* iter);

  bool IsConnected();
  void SetServerProtocolVersion(int version);

  std::unique_ptr<ServerConnection> server_connection_;
  scoped_refptr<base::SequencedTaskRunner> task_runner_;

  ULONG process_id_ = 0;
  int server_protocol_version_ = 0;

  base::ObserverList<Observer> observers_;

  base::ReadOnlySharedMemoryRegion shared_memory_region_;
  base::ReadOnlySharedMemoryMapping shared_memory_mapping_;
};

}  // namespace process_viewer

#endif  // TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_TASK_MANAGER_CLIENT_H_
