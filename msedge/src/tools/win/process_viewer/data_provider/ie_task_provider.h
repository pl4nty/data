// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_IE_TASK_PROVIDER_H_
#define TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_IE_TASK_PROVIDER_H_

#include <windows.h>
#include <vector>
#include <string>


namespace process_viewer {

struct IETask {
  ULONG process_id;
  ULONG thread_id;
  std::wstring title;
};

class IETaskProvider {
 public:
  IETaskProvider();
  ~IETaskProvider();
  IETaskProvider(const IETaskProvider&) = delete;
  IETaskProvider& operator=(const IETaskProvider&) = delete;

  bool GetTasks(std::vector<IETask>* tasks);
};

}  // namespace process_viewer

#endif  // TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_IE_TASK_PROVIDER_H_
