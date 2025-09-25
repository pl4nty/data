// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/data_provider/task_manager_client.h"

#include <windows.h>

#include "base/functional/bind.h"
#include "base/strings/utf_string_conversions.h"
#include "base/task/sequenced_task_runner.h"
#include "chrome/common/edge_external_task_manager/external_task_manager_shared.h"
#include "mojo/public/cpp/platform/named_platform_channel.h"
#include "third_party/abseil-cpp/absl/types/optional.h"

namespace process_viewer {

TaskManagerClient::TaskManagerClient()
    : TaskManagerClient(base::SequencedTaskRunner::GetCurrentDefault()) {}

TaskManagerClient::TaskManagerClient(
    scoped_refptr<base::SequencedTaskRunner> task_runner) {
  DCHECK(task_runner);
  task_runner_ = task_runner;
}

TaskManagerClient::~TaskManagerClient() = default;

bool TaskManagerClient::IsConnected() {
  return client_receiver_.is_bound();
}

bool TaskManagerClient::ConnectToServer(ULONG process_id) {
  DCHECK(task_runner_->RunsTasksInCurrentSequence());
  if (client_receiver_.is_bound()) {
    return false;
  }

  mojo::PlatformChannelEndpoint client_endpoint =
      mojo::NamedPlatformChannel::ConnectToServer(
          edge_external_task_manager::GetServerName(process_id));
  if (!client_endpoint.is_valid()) {
    return false;
  }

  mojo_connection_ = std::make_unique<mojo::IsolatedConnection>();
  auto message_pipe = mojo_connection_->Connect(std::move(client_endpoint));

  server_remote_ =
      mojo::Remote<external_task_manager::mojom::ExternalTaskManagerServer>(
          mojo::PendingRemote<
              external_task_manager::mojom::ExternalTaskManagerServer>(
              std::move(message_pipe), 0));

  mojo::PendingRemote<external_task_manager::mojom::ExternalTaskManagerClient>
      client_remote;
  client_receiver_.Bind(client_remote.InitWithNewPipeAndPassReceiver());
  server_remote_->Connect(std::move(client_remote));
  SendOnConnected(process_id);

  process_id_ = process_id;
  return true;
}

void TaskManagerClient::Disconnect() {
  DCHECK(task_runner_->RunsTasksInCurrentSequence());
  server_remote_.reset();
  client_receiver_.reset();
  mojo_connection_.reset();
  process_id_ = 0;
}

bool TaskManagerClient::RequestSnapshot() {
  DCHECK(task_runner_->RunsTasksInCurrentSequence());

  server_remote_->GetSnapshot(base::BindOnce(&TaskManagerClient::OnTasksUpdated,
                                             base::Unretained(this)));

  return true;
}

void TaskManagerClient::AddObserver(Observer* observer) {
  DCHECK(task_runner_->RunsTasksInCurrentSequence());
  observers_.AddObserver(observer);
}

void TaskManagerClient::RemoveObserver(const Observer* observer) {
  DCHECK(task_runner_->RunsTasksInCurrentSequence());
  observers_.RemoveObserver(observer);
}

void TaskManagerClient::SendOnConnected(ULONG process_id) {
  for (auto& observer : observers_) {
    observer.OnConnected(process_id);
  }
}

void TaskManagerClient::SendOnConnectionClosed(ULONG process_id) {
  for (auto& observer : observers_) {
    observer.OnConnectionClosed(process_id);
  }
}

void TaskManagerClient::SendOnGotSnapshot(
    ULONG process_id,
    const std::vector<external_task_manager::mojom::Task>& tasks) {
  for (auto& observer : observers_) {
    observer.OnGotSnapshot(process_id, tasks);
  }
}

void TaskManagerClient::OnConnectionClosed() {
  DCHECK(task_runner_->RunsTasksInCurrentSequence());
  Disconnect();
  SendOnConnectionClosed(process_id_);
}

void TaskManagerClient::OnTasksUpdated(
    std::vector<external_task_manager::mojom::TaskPtr> tasks) {
  std::vector<external_task_manager::mojom::Task> task_list;
  for (auto& task : tasks) {
    task_list.push_back(*task);
  }
  SendOnGotSnapshot(process_id_, task_list);
}

}  // namespace process_viewer
