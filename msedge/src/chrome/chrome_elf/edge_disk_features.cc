// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "chrome/chrome_elf/edge_disk_features.h"

#include <windows.h>

#include "base/strings/utf_string_conversions.h"
#include "chrome/chrome_elf/nt_registry/nt_registry.h"
#include "chrome/install_static/install_util.h"

namespace edge_disk_features {
// This file is for disk feature usage in chrome/chrome_elf, which is called
// under the loader lock. Use the version under base/ outside of chrome_elf.
bool IsDiskFeatureEnabled(
    const edge_early_features::EarlyFeature& early_feature) {
  CheckEarlyFeatureInitialized(early_feature);

  DWORD is_enabled;
  if (nt::QueryRegValueDWORD(nt::HKCU, nt::NONE,
                             install_static::GetRegistryPath()
                                 .append(L"\\")
              .append(base::UTF8ToWide(early_feature.feature.name))
                                 .c_str(),
                             nullptr, &is_enabled)) {
    return is_enabled != 0;
  }
  return early_feature.feature.default_state;
}

bool IsThirdPartyHookFeatureEnabled() {
  return !IsDiskFeatureEnabled(edge_early_features::kEdgeDisableThirdPartyHook);
}

}  // namespace edge_disk_features
