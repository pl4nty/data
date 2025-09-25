// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_TASK_EXPORT_H_
#define TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_TASK_EXPORT_H_

#include <windows.h>

#include <memory>
#include <vector>

#include "base/strings/utf_string_conversions.h"
#include "tools/win/process_viewer/data_provider/ie_task_provider.h"
#include "tools/win/process_viewer/data_provider/task_manager_client.h"

struct EdgeTaskExport {
  int64_t task_id;
  ULONG process_id;
  WCHAR* title;
};

struct EdgeTaskExportSnapshot {
  size_t task_count;
  EdgeTaskExport* tasks;

  EdgeTaskExportSnapshot(
      const std::vector<external_task_manager::mojom::Task>& tasks) {
    task_count = tasks.size();
    this->tasks = new EdgeTaskExport[tasks.size()];
    for (size_t i = 0; i < tasks.size(); i++) {
      this->tasks[i].task_id = tasks[i].task_id;
      this->tasks[i].process_id = tasks[i].process_id;
      this->tasks[i].title = new WCHAR[tasks[i].title.length() + 1];
      wcscpy(this->tasks[i].title,
             base::UTF16ToWide(tasks[i].title.c_str()).c_str());
    }
  }

  ~EdgeTaskExportSnapshot() {
    for (size_t i = 0; i < task_count; i++) {
      delete[] tasks[i].title;
    }
    delete[] tasks;
  }
};

struct IETaskExport {
  ULONG process_id;
  ULONG thread_id;
  WCHAR* title;
};

struct IETaskExportSnapshot {
  int task_count;
  IETaskExport* tasks;

  IETaskExportSnapshot(const std::vector<process_viewer::IETask>& tasks) {
    this->task_count = tasks.size();
    this->tasks = new IETaskExport[tasks.size()];
    for (size_t i = 0; i < tasks.size(); i++) {
      this->tasks[i].process_id = tasks[i].process_id;
      this->tasks[i].thread_id = tasks[i].thread_id;
      this->tasks[i].title = new WCHAR[tasks[i].title.length() + 1];
      wcscpy(this->tasks[i].title, tasks[i].title.c_str());
    }
  }

  ~IETaskExportSnapshot() {
    for (int i = 0; i < task_count; i++) {
      delete[] tasks[i].title;
    }
    delete[] tasks;
  }
};

#endif  // TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_TASK_EXPORT_H_
