// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/edge_process_watcher/browser_creation_watcher.h"

#include "chrome/common/edge_external_task_manager_shared.h"

namespace process_viewer {

BrowserCreationWatcher::BrowserCreationWatcher() = default;

BrowserCreationWatcher::~BrowserCreationWatcher() = default;

bool BrowserCreationWatcher::StartWatching(
    OnBrowserCreatedCallback on_browser_created_callback) {
  DCHECK(!watcher_.IsWatching());
  startup_event_.Set(
      CreateEvent(nullptr, FALSE, FALSE,
                  edge_external_task_manager::kEdgeStartupEventName));
  if (!startup_event_.IsValid()) {
    return false;
  }
  on_browser_created_callback_ = on_browser_created_callback;
  if (!watcher_.StartWatchingMultipleTimes(startup_event_.Get(), this)) {
    StopWatching();
    return false;
  }
  return true;
}

void BrowserCreationWatcher::StopWatching() {
  watcher_.StopWatching();
  on_browser_created_callback_.Reset();
  startup_event_.Close();
}

void BrowserCreationWatcher::OnObjectSignaled(HANDLE object) {
  on_browser_created_callback_.Run();
}

}  // namespace process_viewer
