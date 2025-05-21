// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef CHROME_CHROME_ELF_EDGE_DISK_FEATURES_H_
#define CHROME_CHROME_ELF_EDGE_DISK_FEATURES_H_

#include "build/build_config.h"
#include "chrome/common/edge_early_feature_flag_win.h"

// This file is for disk feature usage in chrome/chrome_elf, which is called
// under the loader lock. Use the version under base/ outside of chrome_elf.
namespace edge_disk_features {
// Feature flag to disable upstream third party dll hook code, which leverages
// Windows loader shims based on undocumented behaviors.
bool IsThirdPartyHookFeatureEnabled();

bool IsDiskFeatureEnabled(
    const edge_early_features::EarlyFeature& early_feature);

}  // namespace edge_disk_features

#endif  // CHROME_CHROME_ELF_EDGE_DISK_FEATURES_H_
