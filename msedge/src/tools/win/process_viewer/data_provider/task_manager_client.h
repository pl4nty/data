// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_TASK_MANAGER_CLIENT_H_
#define TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_TASK_MANAGER_CLIENT_H_

#include <memory>
#include <string>

#include "base/functional/callback.h"
#include "base/observer_list.h"
#include "base/task/sequenced_task_runner.h"
#include "chrome/common/edge_external_task_manager/external_task_manager.mojom.h"
#include "mojo/public/cpp/bindings/receiver.h"
#include "mojo/public/cpp/bindings/remote.h"
#include "mojo/public/cpp/system/isolated_connection.h"

namespace process_viewer {

// This class connects to an Edge browser process in order to obtain data about
// tasks from the browser's task manager.
class TaskManagerClient
    : public external_task_manager::mojom::ExternalTaskManagerClient {
 public:
  class Observer : public base::CheckedObserver {
   public:
    virtual void OnConnected(ULONG process_id) = 0;

    virtual void OnConnectionClosed(ULONG process_id) = 0;

    virtual void OnGotSnapshot(
        ULONG process_id,
        const std::vector<external_task_manager::mojom::Task>& tasks) = 0;
  };

  TaskManagerClient();
  explicit TaskManagerClient(
      scoped_refptr<base::SequencedTaskRunner> task_runner);
  ~TaskManagerClient() override;

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

  // Adds and removes observers.
  void AddObserver(Observer* observer);
  void RemoveObserver(const Observer* observer);

  // edge_external_task_manager::mojom::ExternalTaskManagerClient:
  void OnTasksUpdated(
      std::vector<external_task_manager::mojom::TaskPtr> tasks) override;

  bool IsConnected();

 private:
  void OnConnectionClosed();

  // Contact Observers
  void SendOnConnected(ULONG process_id);
  void SendOnConnectionClosed(ULONG process_id);
  void SendOnGotSnapshot(
      ULONG process_id,
      const std::vector<external_task_manager::mojom::Task>& tasks);

  scoped_refptr<base::SequencedTaskRunner> task_runner_;
  ULONG process_id_ = 0;

  std::unique_ptr<mojo::IsolatedConnection> mojo_connection_;
  mojo::Remote<external_task_manager::mojom::ExternalTaskManagerServer>
      server_remote_;
  mojo::Receiver<external_task_manager::mojom::ExternalTaskManagerClient>
      client_receiver_{this};

  base::ObserverList<Observer> observers_;
};

}  // namespace process_viewer

#endif  // TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_TASK_MANAGER_CLIENT_H_
