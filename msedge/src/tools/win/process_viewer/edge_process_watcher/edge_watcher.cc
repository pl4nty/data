// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/edge_process_watcher/edge_watcher.h"

#include "base/functional/bind.h"

namespace process_viewer {

EdgeWatcher::EdgeWatcher() = default;

EdgeWatcher::~EdgeWatcher() = default;

bool EdgeWatcher::StartWatching() {
  if (!browser_creation_watcher_.StartWatching(base::BindRepeating(
          &EdgeWatcher::CheckForBrowserProcesses, base::Unretained(this)))) {
    return false;
  }
  CheckForBrowserProcesses();
  return true;
}

void EdgeWatcher::StopWatching() {
  browser_creation_watcher_.StopWatching();
}

void EdgeWatcher::AddObserver(Observer* observer) {
  observers_.AddObserver(observer);
}

void EdgeWatcher::RemoveObserver(const Observer* observer) {
  observers_.RemoveObserver(observer);
}

void EdgeWatcher::OnConnected(ULONG process_id) {
}

void EdgeWatcher::OnConnectionClosed(ULONG process_id) {
  browser_processes_.erase(process_id);
}

void EdgeWatcher::OnGotSnapshot(
    ULONG process_id,
    const std::vector<external_task_manager::mojom::Task>& tasks) {
  for (Observer& observer : observers_) {
    observer.OnGotSnapshot(process_id, tasks);
  }
}

void EdgeWatcher::CheckForBrowserProcesses() {
  // Find any browser processes that we don't already know about.
  process_data_provider_.Refresh();
  for (const auto& process : process_data_provider_.GetProcesses()) {
    if (process->type() == ProcessType::Browser) {
      auto it = browser_processes_.find(process->process_id());
      if (it == browser_processes_.end()) {
        OnBrowserProcessFound(process->process_id());
      }
    }
  }
}

void EdgeWatcher::OnBrowserProcessFound(ULONG process_id) {
  auto browser_process = std::make_unique<WatchedBrowserProcess>();
  if (!browser_process->task_manager_client.ConnectToServer(process_id)) {
    return;
  }
  browser_process->task_manager_client.AddObserver(this);
  browser_processes_[process_id] = std::move(browser_process);
}

}  // namespace process_viewer
