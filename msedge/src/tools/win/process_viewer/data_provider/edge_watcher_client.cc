// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/data_provider/edge_watcher_client.h"

#include <windows.h>

#include "base/functional/bind.h"
#include "base/threading/thread.h"
#include "chrome/common/edge_external_task_manager/external_task_manager_shared.h"
#include "mojo/public/cpp/platform/named_platform_channel.h"
#include "third_party/abseil-cpp/absl/types/optional.h"
#include "tools/win/process_viewer/common/edge_watcher_common.h"

namespace process_viewer {

EdgeWatcherClient::EdgeWatcherClient() : receiver_(this) {}

EdgeWatcherClient::~EdgeWatcherClient() {
  if (ipc_thread_) {
    ipc_thread_->task_runner()->PostTask(
        FROM_HERE, base::BindOnce(&EdgeWatcherClient::DisconnectOnIpcThread,
                                  base::Unretained(this)));

    // Signal and wait for the thread to exit, to ensure that the disconnect
    // task above completes before the thread is destroyed at the end of this
    // scope.
    ipc_thread_->Stop();
  }
}

bool EdgeWatcherClient::Initialize() {
  ipc_thread_ = std::make_unique<base::Thread>("EdgeWatcherClientIpcThread");
  if (!ipc_thread_->StartWithOptions(
          base::Thread::Options(base::MessagePumpType::DEFAULT, 0))) {
    ipc_thread_.reset();
    return false;
  }
  return true;
}

bool EdgeWatcherClient::ConnectToServer() {
  DCHECK(!ipc_thread_->task_runner()->RunsTasksInCurrentSequence());
  if (!ipc_thread_ || IsConnected()) {
    return false;
  }

  // Attmept to open the connection with the EdgeWatcher server on the IPC
  // thread, and wait for completion. This doesn't block on any communication
  // with the server process.
  base::WaitableEvent complete_event;
  if (!ipc_thread_->task_runner()->PostTask(
          FROM_HERE, base::BindOnce(&EdgeWatcherClient::ConnectOnIpcThread,
                                    base::Unretained(this)))) {
    return false;
  }
  if (!ipc_thread_->task_runner()->PostTask(
          FROM_HERE, base::BindOnce(&base::WaitableEvent::Signal,
                                    base::Unretained(&complete_event)))) {
    return false;
  }
  complete_event.Wait();
  return IsConnected();
}

EdgeTaskExportSnapshot* EdgeWatcherClient::GetLastSnapshot(
    base::ProcessId browser_process_id) {
  base::AutoLock auto_lock(lock_);
  auto tasks_iter = tasks_.find(browser_process_id);

  if (tasks_iter != tasks_.end()) {
    return new EdgeTaskExportSnapshot(tasks_iter->second);
  }

  return nullptr;
}

void EdgeWatcherClient::OnTasksUpdated(
    base::ProcessId browser_process_id,
    std::vector<external_task_manager::mojom::TaskPtr> tasks) {
  base::AutoLock auto_lock(lock_);
  tasks_[browser_process_id] =
      std::vector<external_task_manager::mojom::Task>();
  for (const auto& task : tasks) {
    tasks_[browser_process_id].push_back(*task);
  }
}

void EdgeWatcherClient::ConnectOnIpcThread() {
  mojo::PlatformChannelEndpoint client_endpoint =
      mojo::NamedPlatformChannel::ConnectToServer(
          mojo::NamedPlatformChannel::ServerNameFromUTF8(
              kEdgeWatcherChannelName));
  if (!client_endpoint.is_valid()) {
    return;
  }

  mojo_connection_ = std::make_unique<mojo::IsolatedConnection>();
  auto message_pipe = mojo_connection_->Connect(std::move(client_endpoint));

  mojo::FuseMessagePipes(std::move(message_pipe),
                         edge_watcher_.BindNewPipeAndPassReceiver().PassPipe());

  mojo::PendingAssociatedRemote<mojom::EdgeWatcherClient> client_remote;
  receiver_.Bind(client_remote.InitWithNewEndpointAndPassReceiver());
  edge_watcher_->SetClient(GetCurrentProcessId(), std::move(client_remote));

  base::AutoLock auto_lock(lock_);
  is_connected_ = true;
}

void EdgeWatcherClient::DisconnectOnIpcThread() {
  receiver_.reset();
  edge_watcher_.reset();
  mojo_connection_.reset();

  base::AutoLock auto_lock(lock_);
  is_connected_ = false;
}

bool EdgeWatcherClient::IsConnected() {
  base::AutoLock auto_lock(lock_);
  return is_connected_;
}

}  // namespace process_viewer
