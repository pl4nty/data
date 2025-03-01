// Copyright 2019 The Chromium Authors. All rights reserved.
// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/data_provider/edge_process_constants.h"

namespace process_viewer {

const char kProcessTypeSwitch[] = "type";
const char kExtensionProcessSwitch[] = "extension-process";

const char kRendererProcess[] = "renderer";
const char kGpuProcess[] = "gpu-process";
const char kUtilityProcess[] = "utility";
const char kPpapiPluginProcess[] = "ppapi";
// The ppapi-broker process no longer exists in the product code, but we want
// to be able to detect it in older versions of Edge.
const char kPpapiBrokerProcess[] = "ppapi-broker";
const char kCrashpadHandlerProcess[] = "crashpad-handler";
const char kWatcherProcess[] = "watcher";

}  // namespace process_viewer
