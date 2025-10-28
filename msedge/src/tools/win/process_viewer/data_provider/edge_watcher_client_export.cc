// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <windows.h>

#include "chrome/common/edge_external_task_manager/external_task_manager.mojom.h"
#include "tools/win/process_viewer/data_provider/edge_watcher_client.h"
#include "tools/win/process_viewer/data_provider/task_export.h"
#include "tools/win/process_viewer/data_provider/task_manager_client.h"

namespace {

using process_viewer::EdgeWatcherClient;

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

  EdgeTaskExportSnapshot* last_snapshot =
      edge_watcher_client->GetLastSnapshot(process_id);
  if (last_snapshot) {
    *snapshot = last_snapshot;
    return true;
  }

  return false;
}

}  // extern "C"

}  // namespace
