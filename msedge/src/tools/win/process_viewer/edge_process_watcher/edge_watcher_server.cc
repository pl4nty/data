// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/edge_process_watcher/edge_watcher_server.h"

#include <windows.h>

#include "mojo/public/cpp/platform/named_platform_channel.h"
#include "tools/win/process_viewer/common/edge_watcher_common.h"

namespace process_viewer {

EdgeWatcherServer::EdgeWatcherServer() : receiver_(this), weak_factory_(this) {}

EdgeWatcherServer::~EdgeWatcherServer() = default;

void EdgeWatcherServer::StartServer() {
  mojo::NamedPlatformChannel::Options options;
  options.server_name =
      mojo::NamedPlatformChannel::ServerNameFromUTF8(kEdgeWatcherChannelName);
  mojo::NamedPlatformChannel named_channel(options);

  mojo::PlatformChannelServerEndpoint server_endpoint(
      named_channel.TakeServerEndpoint());

  mojo_connection_ = std::make_unique<mojo::IsolatedConnection>();
  auto message_pipe = mojo_connection_->Connect(std::move(server_endpoint));

  receiver_.Bind(
    mojo::PendingReceiver<mojom::EdgeWatcher>(std::move(message_pipe)));
  receiver_.set_disconnect_handler(base::BindOnce(
      &EdgeWatcherServer::OnConnectionError, base::Unretained(this)));
}

void EdgeWatcherServer::SetClient(
    base::ProcessId client_process_id,
    mojo::PendingAssociatedRemote<mojom::EdgeWatcherClient> client) {
  client_process_handle_.Set(
      OpenProcess(PROCESS_DUP_HANDLE, FALSE, client_process_id));
  client_.Bind(std::move(client));

  // When the client first connects, send details of all current regions.
  for (const auto& element : tasks_) {
    NotifyTasksUpdated(element.first);
  }
}

std::vector<external_task_manager::mojom::TaskPtr>
EdgeWatcherServer::GetCopyOfTasks(ULONG process_id) {
  std::vector<external_task_manager::mojom::TaskPtr> tasks;
  const auto it = tasks_.find(process_id);
  if (it != tasks_.end()) {
    for (const auto& task : it->second) {
      tasks.push_back(external_task_manager::mojom::Task::New(task));
    }
  }
  return tasks;
}

void EdgeWatcherServer::OnGotSnapshot(
    ULONG browser_process_id,
    const std::vector<external_task_manager::mojom::Task>& tasks) {
  tasks_[browser_process_id].clear();
  for (const auto& task : tasks) {
    tasks_[browser_process_id].push_back(task);
  }
  NotifyTasksUpdated(browser_process_id);
}

void EdgeWatcherServer::NotifyTasksUpdated(base::ProcessId browser_process_id) {
  if (!client_) {
    return;
  }

  client_->OnTasksUpdated(browser_process_id,
                          GetCopyOfTasks(browser_process_id));
}

void EdgeWatcherServer::OnConnectionError() {
  client_process_handle_.Close();
  client_.reset();
  receiver_.reset();
  mojo_connection_.reset();

  // Once the connection is closed, start listening for a new connection.
  base::SequencedTaskRunner::GetCurrentDefault()->PostTask(
      FROM_HERE, base::BindOnce(&EdgeWatcherServer::StartServer,
                                weak_factory_.GetWeakPtr()));
}

}  // namespace process_viewer
