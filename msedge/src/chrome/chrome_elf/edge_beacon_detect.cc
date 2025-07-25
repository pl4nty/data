// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "chrome/chrome_elf/edge_beacon_detect.h"

#include "base/strings/stringprintf.h"
#include "base/strings/utf_string_conversions.h"
#include "base/win/win_util.h"
#include "chrome/chrome_elf/nt_registry/nt_registry.h"
#include "chrome/common/chrome_version.h"
#include "chrome/install_static/install_details.h"
#include "chrome/install_static/install_util.h"

namespace beacon_detect {

constexpr wchar_t kElfRegistryBeaconKeyName[] = L"\\ElfBeacon";
constexpr wchar_t kElfRegistryVersionName[] = L"version";

constexpr DWORD kIndirectDetectDisableFeature = 0x80000000;
// This value indicates that histogram is send.
constexpr DWORD kIndirectDetectDisableFeatureSend = 0x80000001;
constexpr DWORD kIndirectDetectEnableFeature = 0x40000000;
constexpr DWORD kIndirectDetectLocked = 0x20000000;
constexpr DWORD kLimitCrashCount = 2;

BeaconIndex g_crash_detection_beacon_index_ = BeaconIndex::kMaxBeacons;

// Only one feature can be detected at a time, if true, it means that
// indirect detection is locked, and the feature should not be detected.
bool g_indirect_detection_locked_ = false;

BeaconDetect::BeaconDetect(BeaconIndex beacon_index)
    : beacon_index_(beacon_index) {
  ResetBeaconsOnUpdate();
  beacon_value_ = GetBeaconValueFromRegistry(beacon_index);
}

void BeaconDetect::ResetBeaconsOnUpdate() {
  static bool is_reset = false;
  if (is_reset) {
    return;
  }
  is_reset = true;

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

// Check if the beacon value indicates that the feature should be disabled.
// If the value is kIndirectDetectDisableFeature, it means an indirect crash has
// been detected. If the value is kLimitCrashCount, it means the limit for crash
// count has been reached. If the value is kLimitCrashCount+1, it means the
// feature should be disabled and needs to detect whether the crash is related
// to the feature. If the value is kIndirectDetectEnableFeature, it means the
// crash is not related to the feature. The function should be called at the
// beginning of the feature, before the value of becaon changes.
bool BeaconDetect::ShouldDisableFeature(bool detect_indirect_crash) {
  if (beacon_value_ < kLimitCrashCount) {
    IncreaseValue();
    return false;
  } else if (!detect_indirect_crash) {
    if (beacon_value_ == kLimitCrashCount) {
      g_crash_detection_beacon_index_ = beacon_index_;
    }
    return true;
  } else {
    if (beacon_value_ & kIndirectDetectDisableFeature) {
      if (beacon_value_ == kIndirectDetectDisableFeature) {
        g_crash_detection_beacon_index_ = beacon_index_;
      }
      return true;
    } else if (beacon_value_ == kLimitCrashCount ||
               beacon_value_ == kIndirectDetectLocked) {
      if (!g_indirect_detection_locked_) {
        g_indirect_detection_locked_ = true;
        beacon_value_ = kLimitCrashCount + 1;
        WriteBeaconValueToRegistry(beacon_index_, beacon_value_);
        return true;
      } else {
        // Indirect detection is locked by an other feature, do not disable
        // feature.
        if (beacon_value_ == kLimitCrashCount) {
          beacon_value_ = kIndirectDetectLocked;
          WriteBeaconValueToRegistry(beacon_index_, beacon_value_);
        }
        return false;
      }
    } else if (beacon_value_ == kLimitCrashCount + 1) {
      // This indicates that the feature was disabled previously, but a crash
      // still occurred. It is determined that the crash is not related to the
      // feature , so we set kIndirectDetectEnableFeature to the becaon value.
      beacon_value_ = kIndirectDetectEnableFeature;
      WriteBeaconValueToRegistry(beacon_index_, beacon_value_);
    } else {
      DCHECK(beacon_value_ == kIndirectDetectEnableFeature)
          << "Unexpected beacon value: " << beacon_value_;
    }

    return false;
  }
}

DWORD BeaconDetect::GetBeaconValueFromRegistry(BeaconIndex beacon_index) {
  DWORD value = 0;
  nt::QueryRegValueDWORD(
      nt::HKCU, nt::NONE,
      install_static::GetRegistryPath()
          .append(kElfRegistryBeaconKeyName)
          .c_str(),
      base::ASCIIToWide(
          base::StringPrintf("beacon%d", static_cast<int>(beacon_index)))
          .c_str(),
      &value);

  return value;
}

void BeaconDetect::WriteBeaconValueToRegistry(BeaconIndex beacon_index,
                                              DWORD value) {
  nt::SetRegValueDWORD(
      nt::HKCU, nt::NONE,
      install_static::GetRegistryPath()
          .append(kElfRegistryBeaconKeyName)
          .c_str(),
      base::ASCIIToWide(
          base::StringPrintf("beacon%d", static_cast<int>(beacon_index)))
          .c_str(),
      value);
}

void BeaconDetect::ResetBeaconValue() {
  if (beacon_value_ == kLimitCrashCount + 1) {
    beacon_value_ = kIndirectDetectDisableFeature;
    WriteBeaconValueToRegistry(beacon_index_, beacon_value_);
  } else if (beacon_value_ == kIndirectDetectLocked ||
             beacon_value_ == kIndirectDetectDisableFeature ||
             beacon_value_ == kIndirectDetectDisableFeatureSend ||
             beacon_value_ == 0) {
    // kIndirectDetectLocked indicates that another feature has detected an
    // indirect crash We should retain the beacon value for the next instance to
    // determine if the crash is related to this feature.
    return;
  } else {
    beacon_value_ = 0;
    WriteBeaconValueToRegistry(beacon_index_, beacon_value_);
  }
}

void BeaconDetect::IncreaseValue() {
  WriteBeaconValueToRegistry(beacon_index_, ++beacon_value_);
}

bool BeaconDetect::StartCrashDetection(BeaconIndex beacon_index,
                                       bool detect_indirect_crash) {
  if (install_static::InstallDetails::Get().is_webview()) {
    // WebView2 process does not support crash detection.
    return true;
  }
  beacon_detect::BeaconDetect beacon_detect(beacon_index);
  if (!beacon_detect.ShouldDisableFeature(detect_indirect_crash)) {
    return true;
  }

  return false;
}

// If StopCrashDetection is called, that means no crash has been occurred.
void BeaconDetect::StopCrashDetection(BeaconIndex beacon_index) {
  if (install_static::InstallDetails::Get().is_webview()) {
    return;
  }
  beacon_detect::BeaconDetect beacon_detect(beacon_index);
  beacon_detect.ResetBeaconValue();
}

long BeaconDetect::GetDetectedFeatureIndex() {
  if (g_crash_detection_beacon_index_ == BeaconIndex::kMaxBeacons) {
    // No feature has been disabled.
    return -1;
  }
  DWORD value = GetBeaconValueFromRegistry(g_crash_detection_beacon_index_);
  if (value == kIndirectDetectDisableFeatureSend) {
    return -1;
  } else if (value == kIndirectDetectDisableFeature) {
    WriteBeaconValueToRegistry(g_crash_detection_beacon_index_,
                               kIndirectDetectDisableFeatureSend);
  }
  return static_cast<long>(g_crash_detection_beacon_index_);
}

void BeaconDetect::ResetStaticVariablesForTesting() {
  g_indirect_detection_locked_ = false;
  g_crash_detection_beacon_index_ = BeaconIndex::kMaxBeacons;
}
}  // namespace beacon_detect
