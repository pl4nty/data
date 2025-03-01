// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/data_provider/edge_process_constants.h"

#include "chrome/common/chrome_switches.h"
#include "components/crash/core/app/crash_switches.h"
#include "content/public/common/content_switches.h"
#include "extensions/buildflags/buildflags.h"
#include "testing/gtest/include/gtest/gtest.h"

#if BUILDFLAG(ENABLE_EXTENSIONS)
#include "extensions/common/switches.h"
#endif

namespace process_viewer {

TEST(EdgeProcessConstantsTest, SwitchesMatchProductCode) {
  EXPECT_STREQ(kProcessTypeSwitch, switches::kProcessType);
  EXPECT_STREQ(kRendererProcess, switches::kRendererProcess);
  EXPECT_STREQ(kGpuProcess, switches::kGpuProcess);
  EXPECT_STREQ(kUtilityProcess, switches::kUtilityProcess);
  EXPECT_STREQ(kPpapiPluginProcess, switches::kPpapiPluginProcess);
  // kPpapiBrokerProcess is no longer in the product to verify against.
  EXPECT_STREQ(kCrashpadHandlerProcess,
               crash_reporter::switches::kCrashpadHandler);
#if BUILDFLAG(ENABLE_EXTENSIONS)
  EXPECT_STREQ(kExtensionProcessSwitch,
               extensions::switches::kExtensionProcess);
#endif
}

}  // namespace process_viewer
