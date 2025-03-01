// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/data_provider/task_export.h"

std::unique_ptr<EdgeTaskExportSnapshot> CreateEdgeTaskSnapshot(
    const std::vector<process_viewer::Task>& tasks) {
  auto snapshot = std::make_unique<EdgeTaskExportSnapshot>();
  snapshot->task_count = tasks.size();
  snapshot->tasks = new EdgeTaskExport[tasks.size()];
  for (size_t i = 0; i < tasks.size(); i++) {
    snapshot->tasks[i].task_id = tasks[i].task_id;
    snapshot->tasks[i].process_id = tasks[i].process_id;
    snapshot->tasks[i].title = new WCHAR[tasks[i].title.length() + 1];
    wcscpy(snapshot->tasks[i].title, tasks[i].title.c_str());
  }
  return snapshot;
}

std::unique_ptr<IETaskExportSnapshot> CreateIETaskSnapshot(
    const std::vector<process_viewer::IETask>& tasks) {
  auto snapshot = std::make_unique<IETaskExportSnapshot>();
  snapshot->task_count = tasks.size();
  snapshot->tasks = new IETaskExport[tasks.size()];
  for (size_t i = 0; i < tasks.size(); i++) {
    snapshot->tasks[i].process_id = tasks[i].process_id;
    snapshot->tasks[i].thread_id = tasks[i].thread_id;
    snapshot->tasks[i].title = new WCHAR[tasks[i].title.length() + 1];
    wcscpy(snapshot->tasks[i].title, tasks[i].title.c_str());
  }
  return snapshot;
}

extern "C" {

__declspec(dllexport) void DestroyEdgeTaskSnapshot(
    EdgeTaskExportSnapshot* snapshot) {
  if (!snapshot) {
    return;
  }
  for (int i = 0; i < snapshot->task_count; i++) {
    delete snapshot->tasks[i].title;
  }
  delete snapshot->tasks;
  delete snapshot;
}

__declspec(dllexport) void DestroyIETaskSnapshot(
    IETaskExportSnapshot* snapshot) {
  if (!snapshot) {
    return;
  }
  for (int i = 0; i < snapshot->task_count; i++) {
    delete snapshot->tasks[i].title;
  }
  delete snapshot->tasks;
  delete snapshot;
}

}  // extern "C"
