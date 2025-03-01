// Copyright 2019 The Chromium Authors. All rights reserved.
// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_EDGE_PROCESS_CONSTANTS_H_
#define TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_EDGE_PROCESS_CONSTANTS_H_

namespace process_viewer {

extern const char kProcessTypeSwitch[];
extern const char kExtensionProcessSwitch[];

extern const char kRendererProcess[];
extern const char kGpuProcess[];
extern const char kUtilityProcess[];
extern const char kPpapiPluginProcess[];
extern const char kPpapiBrokerProcess[];
extern const char kCrashpadHandlerProcess[];
extern const char kWatcherProcess[];

}  // namespace process_viewer

#endif  // TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_EDGE_PROCESS_CONSTANTS_H_
