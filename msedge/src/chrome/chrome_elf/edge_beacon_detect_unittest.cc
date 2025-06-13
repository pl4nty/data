// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "chrome/chrome_elf/edge_beacon_detect.h"

#include "base/strings/stringprintf.h"
#include "base/strings/utf_string_conversions.h"
#include "base/test/test_reg_util_win.h"
#include "chrome/chrome_elf/nt_registry/nt_registry.h"
#include "chrome/common/chrome_version.h"
#include "testing/gtest/include/gtest/gtest.h"

namespace beacon_detect {

constexpr wchar_t kElfRegistryBeaconKeyName[] = L"\\ElfBeacon";
constexpr wchar_t kElfRegistryVersionName[] = L"version";

constexpr DWORD kIndirectDetectDisableFeature = 0x80000000;
constexpr DWORD kIndirectDetectDisableFeatureSend = 0x80000001;
constexpr DWORD kIndirectDetectEnableFeature = 0x40000000;
constexpr DWORD kIndirectDetectLocked = 0x20000000;
constexpr DWORD kLimitCrashCount = 1;

void ResetBeaconsForTest() {
  HANDLE key_handle = INVALID_HANDLE_VALUE;

  if (!nt::CreateRegKey(nt::HKCU,
                        install_static::GetRegistryPath()
                            .append(kElfRegistryBeaconKeyName)
                            .c_str(),
                        KEY_QUERY_VALUE | KEY_SET_VALUE, &key_handle)) {
    return;
  }

  std::wstring edge_version;
  bool result =
      nt::QueryRegValueSZ(key_handle, kElfRegistryVersionName, &edge_version);
  if (!result || edge_version != TEXT(CHROME_VERSION_STRING)) {
    nt::SetRegValueSZ(key_handle, kElfRegistryVersionName,
                      TEXT(CHROME_VERSION_STRING));
    for (int i = 0; i < static_cast<int>(BeaconIndex::kMaxBeacons); ++i) {
      nt::DeleteRegValueKey(
          key_handle,
          base::ASCIIToWide(base::StringPrintf("beacon%d", i)).c_str());
    }
  }
  nt::CloseRegKey(key_handle);
}

void ExpectDisableFeature(BeaconIndex beacon_index) {
  BeaconDetect beacon_detector(beacon_index);
  EXPECT_TRUE(beacon_detector.ShouldDisableFeature(false));
}

void ExpectEnableFeature(BeaconIndex beacon_index) {
  BeaconDetect beacon_detector(beacon_index);
  EXPECT_FALSE(beacon_detector.ShouldDisableFeature(false));
}

void BeaconValueTest(BeaconIndex beacon_index, DWORD value) {
  EXPECT_EQ(BeaconDetect::GetBeaconValueFromRegistry(beacon_index), value);
}

class BeaconDetectTest : public testing::Test {
 protected:
  void SetUp() override {
    std::wstring temp;
    override_manager_.OverrideRegistry(HKEY_CURRENT_USER, &temp);
    ASSERT_TRUE(nt::SetTestingOverride(nt::HKCU, temp));
    ResetBeaconsForTest();
  }
  void TearDown() override {
    std::wstring temp;
    ASSERT_TRUE(nt::SetTestingOverride(nt::HKCU, temp));
  }
  registry_util::RegistryOverrideManager override_manager_;
};

TEST_F(BeaconDetectTest, ResetBeacons) {
  base::win::RegKey key_handle;
  ASSERT_TRUE(key_handle.Create(HKEY_CURRENT_USER,
                                install_static::GetRegistryPath()
                                    .append(kElfRegistryBeaconKeyName)
                                    .c_str(),
                                KEY_QUERY_VALUE) == ERROR_SUCCESS);

  std::wstring edge_version;
  key_handle.ReadValue(kElfRegistryVersionName, &edge_version);

  EXPECT_STREQ(edge_version.c_str(), TEXT(CHROME_VERSION_STRING));

  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification, 0);
}

TEST_F(BeaconDetectTest, IncreaseValue) {
  BeaconDetect::ResetStaticVariablesForTesting();

  BeaconDetect::WriteBeaconValueToRegistry(
      BeaconIndex::kDllUnregisterDllNotification, 1);
  BeaconDetect beacon_detector(BeaconIndex::kDllUnregisterDllNotification);
  beacon_detector.IncreaseValue();
  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification, 2);
}

TEST_F(BeaconDetectTest, DirectCrashCrash) {
  BeaconDetect::ResetStaticVariablesForTesting();
  bool indirect_crash_detect = false;
  BeaconDetect::WriteBeaconValueToRegistry(
      BeaconIndex::kDllUnregisterDllNotification, 0);
  EXPECT_TRUE(BeaconDetect::StartCrashDetection(
      BeaconIndex::kDllUnregisterDllNotification, indirect_crash_detect));
  for (int i = 0; i < kLimitCrashCount - 1; ++i) {
    BeaconDetect::StartCrashDetection(
        BeaconIndex::kDllUnregisterDllNotification, indirect_crash_detect);
  }

  ExpectDisableFeature(BeaconIndex::kDllUnregisterDllNotification);
  EXPECT_EQ(BeaconDetect::GetDetectedFeatureIndex(),
            static_cast<long>(BeaconIndex::kDllUnregisterDllNotification));
  BeaconDetect::StopCrashDetection(BeaconIndex::kDllUnregisterDllNotification);
  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification, 0);
}

TEST_F(BeaconDetectTest, IndirectDetectBeaconValue0) {
  BeaconDetect::ResetStaticVariablesForTesting();
  BeaconDetect::WriteBeaconValueToRegistry(
      BeaconIndex::kDllUnregisterDllNotification, 0);

  EXPECT_TRUE(BeaconDetect::StartCrashDetection(
      BeaconIndex::kDllUnregisterDllNotification, true));

  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification, 1);
  BeaconDetect::StopCrashDetection(BeaconIndex::kDllUnregisterDllNotification);
  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification, 0);
}

TEST_F(BeaconDetectTest, IndirectDetectBeaconValue_LimitCrashCount) {
  BeaconDetect::ResetStaticVariablesForTesting();
  BeaconDetect::WriteBeaconValueToRegistry(
      BeaconIndex::kDllUnregisterDllNotification, kLimitCrashCount);
  EXPECT_FALSE(BeaconDetect::StartCrashDetection(
      BeaconIndex::kDllUnregisterDllNotification, true));

  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification,
                  kLimitCrashCount + 1);
  BeaconDetect::StopCrashDetection(BeaconIndex::kDllUnregisterDllNotification);
  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification,
                  kIndirectDetectDisableFeature);
}

TEST_F(BeaconDetectTest, IndirectDetectBeaconValue_IndirectDetectLocked) {
  BeaconDetect::ResetStaticVariablesForTesting();
  BeaconDetect::WriteBeaconValueToRegistry(
      BeaconIndex::kDllUnregisterDllNotification, kLimitCrashCount);
  BeaconDetect::WriteBeaconValueToRegistry(BeaconIndex::kRestoreEntryPoint,
                                           kLimitCrashCount);
  EXPECT_FALSE(BeaconDetect::StartCrashDetection(
      BeaconIndex::kDllUnregisterDllNotification, true));
  EXPECT_TRUE(
      BeaconDetect::StartCrashDetection(BeaconIndex::kRestoreEntryPoint, true));
  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification,
                  kLimitCrashCount + 1);

  BeaconValueTest(BeaconIndex::kRestoreEntryPoint, kIndirectDetectLocked);
  BeaconDetect::StopCrashDetection(BeaconIndex::kDllUnregisterDllNotification);
  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification,
                  kIndirectDetectDisableFeature);

  BeaconDetect::StopCrashDetection(BeaconIndex::kRestoreEntryPoint);
  BeaconValueTest(BeaconIndex::kRestoreEntryPoint, kIndirectDetectLocked);

  BeaconDetect::ResetStaticVariablesForTesting();
  EXPECT_FALSE(
      BeaconDetect::StartCrashDetection(BeaconIndex::kRestoreEntryPoint, true));
  BeaconValueTest(BeaconIndex::kRestoreEntryPoint, kLimitCrashCount + 1);
}

TEST_F(BeaconDetectTest, IndirectDetectBeaconValue_LimitCrashCountAdd1) {
  BeaconDetect::ResetStaticVariablesForTesting();
  BeaconDetect::WriteBeaconValueToRegistry(
      BeaconIndex::kDllUnregisterDllNotification, kLimitCrashCount + 1);
  EXPECT_TRUE(BeaconDetect::StartCrashDetection(
      BeaconIndex::kDllUnregisterDllNotification, true));
  EXPECT_EQ(BeaconDetect::GetDetectedFeatureIndex(), -1);
  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification,
                  kIndirectDetectEnableFeature);
  BeaconDetect::StopCrashDetection(BeaconIndex::kDllUnregisterDllNotification);
  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification, 0);
}

TEST_F(BeaconDetectTest, IndirectDetectBeaconValue_EnableFeature) {
  BeaconDetect::ResetStaticVariablesForTesting();
  BeaconDetect::WriteBeaconValueToRegistry(
      BeaconIndex::kDllUnregisterDllNotification, kIndirectDetectEnableFeature);
  EXPECT_TRUE(BeaconDetect::StartCrashDetection(
      BeaconIndex::kDllUnregisterDllNotification, true));
  EXPECT_EQ(BeaconDetect::GetDetectedFeatureIndex(), -1);
  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification,
                  kIndirectDetectEnableFeature);
  BeaconDetect::StopCrashDetection(BeaconIndex::kDllUnregisterDllNotification);
  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification, 0);
}

TEST_F(BeaconDetectTest, IndirectDetectBeaconValue_DisableFeature) {
  BeaconDetect::ResetStaticVariablesForTesting();
  BeaconDetect::WriteBeaconValueToRegistry(
      BeaconIndex::kDllUnregisterDllNotification,
      kIndirectDetectDisableFeature);
  EXPECT_FALSE(BeaconDetect::StartCrashDetection(
      BeaconIndex::kDllUnregisterDllNotification, true));
  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification,
                  kIndirectDetectDisableFeature);
  BeaconDetect::StopCrashDetection(BeaconIndex::kDllUnregisterDllNotification);
  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification,
                  kIndirectDetectDisableFeature);
  // If EQ kDllUnregisterDllNotification, the beacon value will be set to
  // kIndirectDetectDisableFeatureSend
  EXPECT_EQ(BeaconDetect::GetDetectedFeatureIndex(),
            static_cast<long>(BeaconIndex::kDllUnregisterDllNotification));
  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification,
                  kIndirectDetectDisableFeatureSend);
}

TEST_F(BeaconDetectTest, IndirectDetectBeaconValue_DisableFeatureSend) {
  BeaconDetect::ResetStaticVariablesForTesting();
  BeaconDetect::WriteBeaconValueToRegistry(
      BeaconIndex::kDllUnregisterDllNotification,
      kIndirectDetectDisableFeatureSend);
  EXPECT_FALSE(BeaconDetect::StartCrashDetection(
      BeaconIndex::kDllUnregisterDllNotification, true));
  EXPECT_EQ(BeaconDetect::GetDetectedFeatureIndex(), -1);
  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification,
                  kIndirectDetectDisableFeatureSend);
  BeaconDetect::StopCrashDetection(BeaconIndex::kDllUnregisterDllNotification);
  BeaconValueTest(BeaconIndex::kDllUnregisterDllNotification,
                  kIndirectDetectDisableFeatureSend);
}
}  // namespace beacon_detect
