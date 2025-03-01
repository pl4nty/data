// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_IE_PROCESS_H_
#define TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_IE_PROCESS_H_

#include <windows.h>

#include "tools/win/process_viewer/data_provider/process.h"

namespace process_viewer {

class IEProcess : public Process {
 public:
  IEProcess(ULONG process_id, LONGLONG create_time, ULONG parent_process_id);
  ~IEProcess() override;
  IEProcess(const IEProcess&) = delete;
  IEProcess& operator=(const IEProcess&) = delete;


 protected:
  void OnCommandLineUpdated() override;
};

}  // namespace process_viewer

#endif  // TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_IE_PROCESS_H_
