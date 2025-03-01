// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_EDGE_PROCESS_H_
#define TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_EDGE_PROCESS_H_

#include <windows.h>

#include "tools/win/process_viewer/data_provider/process.h"

namespace process_viewer {

class EdgeProcess : public Process {
 public:
  EdgeProcess(ULONG process_id, LONGLONG create_time, ULONG parent_process_id);
  ~EdgeProcess() override;
  EdgeProcess(const EdgeProcess&) = delete;
  EdgeProcess& operator=(const EdgeProcess&) = delete;


 protected:
  void OnCommandLineUpdated() override;
};

}  // namespace process_viewer

#endif  // TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_EDGE_PROCESS_H_
