// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_EDGE_WEBVIEW_PROCESS_H_
#define TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_EDGE_WEBVIEW_PROCESS_H_

#include <windows.h>

#include "tools/win/process_viewer/data_provider/process.h"

namespace process_viewer {

class WebViewProcess : public Process {
 public:
  WebViewProcess(ULONG process_id,
                 LONGLONG create_time,
                 ULONG parent_process_id);
  ~WebViewProcess() override;
  WebViewProcess(const WebViewProcess&) = delete;
  WebViewProcess& operator=(const WebViewProcess&) = delete;

 protected:
  void OnCommandLineUpdated() override;
};

}  // namespace process_viewer

#endif  // TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_WEBVIEW_PROCESS_H_
