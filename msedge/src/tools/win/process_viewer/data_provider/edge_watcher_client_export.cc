// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <windows.h>

#include "tools/win/process_viewer/data_provider/edge_watcher_client.h"
#include "tools/win/process_viewer/data_provider/task_export.h"
#include "tools/win/process_viewer/data_provider/task_manager_client.h"

namespace {

using process_viewer::EdgeWatcherClient;
using process_viewer::Task;

extern "C" {

__declspec(dllexport) EdgeWatcherClient* CreateEdgeWatcherClient() {
  auto edge_watcher_client = std::make_unique<EdgeWatcherClient>();
  if (!edge_watcher_client->Initialize()) {
    return nullptr;
  }
  return edge_watcher_client.release();
}

__declspec(dllexport) void DestroyEdgeWatcherClient(
    EdgeWatcherClient* edge_watcher_client) {
  delete edge_watcher_client;
}

__declspec(dllexport) bool ConnectToEdgeWatcherServer(
    EdgeWatcherClient* edge_watcher_client) {
  if (!edge_watcher_client) {
    return false;
  }
  return edge_watcher_client->ConnectToServer();
}

__declspec(dllexport) bool GetEdgeWatcherMonitoredTasks(
    EdgeWatcherClient* edge_watcher_client,
    ULONG process_id,
    EdgeTaskExportSnapshot** snapshot) {
  if (!edge_watcher_client) {
    return false;
  }
  std::vector<Task> tasks;
  if (!edge_watcher_client->GetMonitoredTasks(process_id, &tasks)) {
    return false;
  }
  *snapshot = CreateEdgeTaskSnapshot(tasks).release();
  return true;
}

}  // extern "C"

}  // namespace
