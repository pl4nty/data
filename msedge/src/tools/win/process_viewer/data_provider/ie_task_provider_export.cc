// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <windows.h>

#include "tools/win/process_viewer/data_provider/ie_task_provider.h"
#include "tools/win/process_viewer/data_provider/task_export.h"

namespace {

using process_viewer::IETask;
using process_viewer::IETaskProvider;

extern "C" {

__declspec(dllexport) IETaskProvider* CreateIETaskProvider() {
  return new IETaskProvider;
}

__declspec(dllexport) void DestroyIETaskProvider(
    IETaskProvider* ie_task_provider) {
  delete ie_task_provider;
}

__declspec(dllexport) bool GetIETaskProviderTasks(
    IETaskProvider* ie_task_provider,
    IETaskExportSnapshot** snapshot) {
  if (!ie_task_provider) {
    return false;
  }
  std::vector<IETask> tasks;
  if (!ie_task_provider->GetTasks(&tasks)) {
    return false;
  }
  *snapshot = new IETaskExportSnapshot(tasks);
  return true;
}

}  // extern "C"

}  // namespace
