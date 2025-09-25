// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/data_provider/task_manager_client_sync.h"

#include "base/functional/bind.h"
#include "base/time/time.h"
#include "chrome/common/edge_external_task_manager/external_task_manager_shared.h"

namespace process_viewer {

TaskManagerClientSync::TaskManagerClientSync()
    : connect_complete_event_(base::WaitableEvent::ResetPolicy::AUTOMATIC),
      snapshot_complete_event_(base::WaitableEvent::ResetPolicy::AUTOMATIC) {}

TaskManagerClientSync::~TaskManagerClientSync() {
  if (ipc_thread_) {
    ipc_thread_->task_runner()->PostTask(
        FROM_HERE,
        base::BindOnce(&TaskManagerClient::Disconnect,
                       base::Unretained(task_manager_client_.get())));

    ipc_thread_->Stop();

    task_manager_client_.reset();
    ipc_thread_.reset();
  }
}

bool TaskManagerClientSync::Initialize() {
  auto ipc_thread =
      std::make_unique<base::Thread>("TaskManagerClientIpcThread");
  if (!ipc_thread->StartWithOptions(
          base::Thread::Options(base::MessagePumpType::DEFAULT, 0))) {
    return false;
  }

  auto task_manager_client =
      std::make_unique<TaskManagerClient>(ipc_thread->task_runner());
  if (!ipc_thread->task_runner()->PostTask(
          FROM_HERE,
          base::BindOnce(&TaskManagerClient::AddObserver,
                         base::Unretained(task_manager_client.get()), this))) {
    ipc_thread->Stop();
    return false;
  }

  ipc_thread_ = std::move(ipc_thread);
  task_manager_client_ = std::move(task_manager_client);
  return true;
}

bool TaskManagerClientSync::ConnectToServer(ULONG process_id,
                                            const base::TimeDelta& wait_delta) {
  DCHECK(!ipc_thread_->task_runner()->RunsTasksInCurrentSequence());
  if (!task_manager_client_ || IsConnected()) {
    return false;
  }

  connect_complete_event_.Reset();

  // Initiate a connection to the Edge browser process on the IPC thread.
  if (!ipc_thread_->task_runner()->PostTask(
          FROM_HERE, base::BindOnce(&TaskManagerClientSync::ConnectOnIpcThread,
                                    base::Unretained(this), process_id))) {
    return false;
  }
  if (!connect_complete_event_.TimedWait(wait_delta)) {
    return false;
  }
  return IsConnected();
}

bool TaskManagerClientSync::UpdateSnapshot(const base::TimeDelta& wait_delta) {
  DCHECK(!ipc_thread_->task_runner()->RunsTasksInCurrentSequence());
  if (!task_manager_client_ || !IsConnected()) {
    return false;
  }

  // If a previous GetSnapshot call timed out, the event may already be signaled
  // from when we finally got a response. Reset to wait for a new response.
  snapshot_complete_event_.Reset();

  if (!ipc_thread_->task_runner()->PostTask(
          FROM_HERE,
          base::BindOnce(&TaskManagerClientSync::RequestSnapshotOnIpcThread,
                         base::Unretained(this)))) {
    return false;
  }

  // Wait on a response from the Edge browser process.
  if (!snapshot_complete_event_.TimedWait(wait_delta)) {
    return false;
  }

  return true;
}

EdgeTaskExportSnapshot* TaskManagerClientSync::GetLastSnapshot() {
  base::AutoLock auto_lock(lock_);
  return new EdgeTaskExportSnapshot(last_snapshot_tasks_);
}

std::vector<external_task_manager::mojom::Task>
TaskManagerClientSync::GetLastTasks() {
  base::AutoLock auto_lock(lock_);
  return last_snapshot_tasks_;
}

void TaskManagerClientSync::OnConnected(ULONG process_id) {
  connect_complete_event_.Signal();
}

void TaskManagerClientSync::OnConnectionClosed(ULONG process_id) {}

void TaskManagerClientSync::OnGotSnapshot(
    ULONG process_id,
    const std::vector<external_task_manager::mojom::Task>& tasks) {
  DCHECK(ipc_thread_->task_runner()->RunsTasksInCurrentSequence());
  base::AutoLock auto_lock(lock_);
  last_snapshot_tasks_ = std::move(tasks);
  snapshot_complete_event_.Signal();
}

void TaskManagerClientSync::ConnectOnIpcThread(ULONG process_id) {
  DCHECK(ipc_thread_->task_runner()->RunsTasksInCurrentSequence());
  task_manager_client_->ConnectToServer(process_id);
}

void TaskManagerClientSync::RequestSnapshotOnIpcThread() {
  DCHECK(ipc_thread_->task_runner()->RunsTasksInCurrentSequence());
  task_manager_client_->RequestSnapshot();
}

bool TaskManagerClientSync::IsConnected() {
  return task_manager_client_->IsConnected();
}

}  // namespace process_viewer
