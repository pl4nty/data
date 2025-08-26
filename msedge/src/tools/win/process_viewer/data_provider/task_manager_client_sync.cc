// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/data_provider/task_manager_client_sync.h"

#include "base/functional/bind.h"
#include "base/time/time.h"

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

    // Signal and wait for the thread to exit, to ensure that the disconnect
    // task above completes before the TaskManagerClient is destroyed at the end
    // of this scope.
    ipc_thread_->Stop();
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

bool TaskManagerClientSync::GetSnapshot(const base::TimeDelta& wait_delta,
                                        std::vector<Task>* tasks) {
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

  base::AutoLock auto_lock(lock_);
  *tasks = std::move(last_snapshot_tasks_);
  return true;
}

bool TaskManagerClientSync::StartMonitoring() {
  DCHECK(!ipc_thread_->task_runner()->RunsTasksInCurrentSequence());
  if (!task_manager_client_ || !IsConnected()) {
    return false;
  }

  if (!ipc_thread_->task_runner()->PostTask(
          FROM_HERE,
          base::BindOnce(&TaskManagerClientSync::StartMonitoringOnIpcThread,
                         base::Unretained(this)))) {
    return false;
  }
  return true;
}

bool TaskManagerClientSync::StopMonitoring() {
  DCHECK(!ipc_thread_->task_runner()->RunsTasksInCurrentSequence());
  if (!task_manager_client_ || !IsConnected()) {
    return false;
  }

  if (!ipc_thread_->task_runner()->PostTask(
          FROM_HERE,
          base::BindOnce(&TaskManagerClientSync::StopMonitoringOnIpcThread,
                         base::Unretained(this)))) {
    return false;
  }
  return true;
}

bool TaskManagerClientSync::GetMonitoredTasks(std::vector<Task>* tasks) {
  base::AutoLock auto_lock(lock_);
  if (!shared_memory_mapping_.IsValid()) {
    return false;
  }
  return TaskManagerClient::GetMonitoredDataFromBuffer(
      shared_memory_mapping_.memory(), shared_memory_mapping_.size(), tasks);
}

void TaskManagerClientSync::OnConnected(ULONG process_id) {
  base::AutoLock auto_lock(lock_);
  is_connected_ = true;
  connect_complete_event_.Signal();
}

void TaskManagerClientSync::OnConnectionClosed(ULONG process_id) {
  base::AutoLock auto_lock(lock_);
  is_connected_ = false;
}

void TaskManagerClientSync::OnGotSnapshot(ULONG process_id,
                                          const std::vector<Task>& tasks) {
  base::AutoLock auto_lock(lock_);
  last_snapshot_tasks_ = std::move(tasks);
  snapshot_complete_event_.Signal();
}

void TaskManagerClientSync::OnSharedMemoryRegionChanged(
    ULONG process_id,
    const base::ReadOnlySharedMemoryRegion& region) {
  base::AutoLock auto_lock(lock_);
  shared_memory_mapping_ = region.Map();
}

void TaskManagerClientSync::ConnectOnIpcThread(ULONG process_id) {
  task_manager_client_->ConnectToServer(process_id);
}

void TaskManagerClientSync::RequestSnapshotOnIpcThread() {
  task_manager_client_->RequestSnapshot();
}

void TaskManagerClientSync::StartMonitoringOnIpcThread() {
  task_manager_client_->StartMonitoring();
}

void TaskManagerClientSync::StopMonitoringOnIpcThread() {
  task_manager_client_->StopMonitoring();
}

bool TaskManagerClientSync::IsConnected() {
  base::AutoLock auto_lock(lock_);
  return is_connected_;
}

}  // namespace process_viewer
