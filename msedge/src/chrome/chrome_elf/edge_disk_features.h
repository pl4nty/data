// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef CHROME_CHROME_ELF_EDGE_DISK_FEATURES_H_
#define CHROME_CHROME_ELF_EDGE_DISK_FEATURES_H_

#include "build/build_config.h"

// This file is for disk feature usage in chrome/chrome_elf, which is called
// under the loader lock. Use the version under base/ outside of chrome_elf.
namespace edge_disk_features {

#if defined(ARCH_CPU_X86_64)
// Feature flag to enable downstream dll blocking code, which leverages
// documented ntdll loader hook APIs and export table patching of 3p dlls which
// get loaded.
bool IsModuleTrackerFeatureEnabled();
bool IsModuleTrackerV2FeatureEnabled();
bool IsModuleTrackerV3FeatureEnabled();
bool IsModuleTrackerV4FeatureEnabled();
bool IsModuleTrackerV5FeatureEnabled();
bool IsModuleTrackerV6FeatureEnabled();
#endif  // defined(ARCH_CPU_X86_64)

// Feature flag to disable upstream third party dll hook code, which leverages
// Windows loader shims based on undocumented behaviors.
bool IsThirdPartyHookFeatureEnabled();

}  // namespace edge_disk_features

#endif  // CHROME_CHROME_ELF_EDGE_DISK_FEATURES_H_
