// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "chrome/chrome_elf/edge_disk_features.h"

#include <optional>
#include <string>

#include "base/strings/utf_string_conversions.h"
#include "base/test/test_reg_util_win.h"
#include "base/win/registry.h"
#include "chrome/chrome_elf/nt_registry/nt_registry.h"
#include "chrome/install_static/install_util.h"
#include "testing/gtest/include/gtest/gtest.h"

namespace {

// Isolate Win32 writes and native production reads from real Edge settings by
// routing both APIs through the same temporary HKCU root.
class EdgeDiskFeatureTest : public testing::Test {
 protected:
  void SetUp() override {
    ASSERT_TRUE(nt::GetTestingOverride(nt::HKCU).empty());

    edge_registry_override_.emplace();
    ASSERT_NO_FATAL_FAILURE(edge_registry_override_->OverrideRegistry(
        HKEY_CURRENT_USER, &edge_registry_path_));
    ASSERT_TRUE(nt::SetTestingOverride(nt::HKCU, edge_registry_path_));
  }

  void TearDown() override {
    if (edge_registry_override_) {
      EXPECT_TRUE(nt::SetTestingOverride(nt::HKCU, std::wstring()));
      EXPECT_TRUE(nt::GetTestingOverride(nt::HKCU).empty());
      edge_registry_override_.reset();
    }
  }

  void VerifyDiskFeatureRegistryBehavior(
      const edge_early_features::EarlyFeature& feature) {
    const std::wstring registry_path =
        install_static::GetRegistryPath().append(L"\\").append(
            base::UTF8ToWide(feature.feature.name));
    base::win::RegKey key;
    ASSERT_EQ(ERROR_SUCCESS,
              key.Create(HKEY_CURRENT_USER, registry_path.c_str(),
                         KEY_QUERY_VALUE | KEY_SET_VALUE));

    ASSERT_EQ(ERROR_SUCCESS, key.WriteValue(nullptr, DWORD{1}));
    EXPECT_TRUE(edge_disk_features::IsDiskFeatureEnabled(feature));

    ASSERT_EQ(ERROR_SUCCESS, key.WriteValue(nullptr, DWORD{0}));
    EXPECT_FALSE(edge_disk_features::IsDiskFeatureEnabled(feature));

    ASSERT_EQ(ERROR_SUCCESS,
              key.DeleteKey(L"", base::win::RegKey::RecursiveDelete(false)));
    EXPECT_EQ(edge_disk_features::IsDiskFeatureEnabled(feature),
              feature.feature.default_state);
  }

 private:
  std::wstring edge_registry_path_;
  std::optional<registry_util::RegistryOverrideManager> edge_registry_override_;
};

TEST_F(EdgeDiskFeatureTest, IsDiskFeatureV2Enabled) {
  VerifyDiskFeatureRegistryBehavior(edge_early_features::kModuleTrackerV2);
}

TEST_F(EdgeDiskFeatureTest, IsDiskFeatureV3Enabled) {
  VerifyDiskFeatureRegistryBehavior(edge_early_features::kModuleTrackerV3);
}

TEST_F(EdgeDiskFeatureTest, IsDiskFeatureV4Enabled) {
  VerifyDiskFeatureRegistryBehavior(edge_early_features::kModuleTrackerV4);
}

}  // namespace
