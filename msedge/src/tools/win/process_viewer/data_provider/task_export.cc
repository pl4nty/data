// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/data_provider/task_export.h"

extern "C" {

__declspec(dllexport) void DestroyEdgeTaskSnapshot(
    EdgeTaskExportSnapshot* snapshot) {
  delete snapshot;
}

__declspec(dllexport) void DestroyIETaskSnapshot(
    IETaskExportSnapshot* snapshot) {
  delete snapshot;
}

}  // extern "C"
