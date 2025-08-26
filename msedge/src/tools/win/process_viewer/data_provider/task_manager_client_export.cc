// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <windows.h>

#include "base/time/time.h"
#include "tools/win/process_viewer/data_provider/task_export.h"
#include "tools/win/process_viewer/data_provider/task_manager_client_sync.h"

namespace {

using process_viewer::Task;
using process_viewer::TaskManagerClientSync;

extern "C" {

__declspec(dllexport) TaskManagerClientSync* CreateTaskManagerClient() {
  auto task_manager_client = std::make_unique<TaskManagerClientSync>();
  if (!task_manager_client->Initialize()) {
    return nullptr;
  }
  return task_manager_client.release();
}

__declspec(dllexport) void DestroyTaskManagerClient(
    TaskManagerClientSync* task_manager_client) {
  delete task_manager_client;
}

__declspec(dllexport) bool ConnectToTaskManagerServer(
    TaskManagerClientSync* task_manager_client,
    ULONG process_id,
    int64_t timeout_ms) {
  if (!task_manager_client || timeout_ms < 0) {
    return false;
  }
  base::TimeDelta wait_delta = base::Milliseconds(timeout_ms);
  return task_manager_client->ConnectToServer(process_id, wait_delta);
}

__declspec(dllexport) bool GetTaskManagerSnapshot(
    TaskManagerClientSync* task_manager_client,
    int64_t timeout_ms,
    EdgeTaskExportSnapshot** snapshot) {
  if (!task_manager_client || timeout_ms < 0) {
    return false;
  }
  base::TimeDelta wait_delta = base::Milliseconds(timeout_ms);
  std::vector<Task> tasks;
  if (!task_manager_client->GetSnapshot(wait_delta, &tasks)) {
    return false;
  }

  *snapshot = CreateEdgeTaskSnapshot(tasks).release();
  return true;
}

__declspec(dllexport) bool StartTaskManagerMonitoring(
    TaskManagerClientSync* task_manager_client) {
  if (!task_manager_client) {
    return false;
  }
  return task_manager_client->StartMonitoring();
}

__declspec(dllexport) bool StopTaskManagerMonitoring(
    TaskManagerClientSync* task_manager_client) {
  if (!task_manager_client) {
    return false;
  }
  return task_manager_client->StopMonitoring();
}

__declspec(dllexport) bool GetTaskManagerMonitoredTasks(
    TaskManagerClientSync* task_manager_client,
    EdgeTaskExportSnapshot** snapshot) {
  if (!task_manager_client) {
    return false;
  }
  std::vector<Task> tasks;
  if (!task_manager_client->GetMonitoredTasks(&tasks)) {
    return false;
  }
  *snapshot = CreateEdgeTaskSnapshot(tasks).release();
  return true;
}

}  // extern "C"

}  // namespace
