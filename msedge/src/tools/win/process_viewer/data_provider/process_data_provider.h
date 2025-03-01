// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_PROCESS_DATA_PROVIDER_H_
#define TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_PROCESS_DATA_PROVIDER_H_

#include <memory>
#include <vector>

#include "tools/win/process_viewer/data_provider/process.h"

namespace process_viewer {

enum ProcessViewType { Unknown, Edge, IE, Webview };

// This class queries the operating system to find processes of interest (namely
// Edge processes), and provides a list of those processes along with data about
// them.
class ProcessDataProvider {
 public:
  ProcessDataProvider();
  ~ProcessDataProvider();
  ProcessDataProvider(const ProcessDataProvider&) = delete;
  ProcessDataProvider& operator=(const ProcessDataProvider&) = delete;

  // Refreshes the list of processes and the data about those processes.
  void Refresh();

  // Returns the list of processes as of the last time Refresh was called.
  const std::vector<std::unique_ptr<Process>>& GetProcesses() const;

 private:
  std::vector<std::unique_ptr<Process>> processes_;
  size_t last_buffer_size_ = 0;
};

}  // namespace process_viewer

#endif  // TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_PROCESS_DATA_PROVIDER_H_
