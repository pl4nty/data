// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_TASK_EXPORT_H_
#define TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_TASK_EXPORT_H_

#include <windows.h>
#include <memory>
#include <vector>

#include "tools/win/process_viewer/data_provider/ie_task_provider.h"
#include "tools/win/process_viewer/data_provider/task_manager_client.h"

struct EdgeTaskExport {
  int64_t task_id;
  ULONG process_id;
  WCHAR* title;
};

struct EdgeTaskExportSnapshot {
  int task_count;
  EdgeTaskExport* tasks;
};

struct IETaskExport {
  ULONG process_id;
  ULONG thread_id;
  WCHAR* title;
};

struct IETaskExportSnapshot {
  int task_count;
  IETaskExport* tasks;
};

std::unique_ptr<EdgeTaskExportSnapshot> CreateEdgeTaskSnapshot(
    const std::vector<process_viewer::Task>& tasks);

std::unique_ptr<IETaskExportSnapshot> CreateIETaskSnapshot(
    const std::vector<process_viewer::IETask>& tasks);

#endif  // TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_TASK_EXPORT_H_
