// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef CHROME_CHROME_ELF_EDGE_BEACON_DETECT_H_
#define CHROME_CHROME_ELF_EDGE_BEACON_DETECT_H_

#include <windows.h>

#include "base/no_destructor.h"
#include "chrome/install_static/install_util.h"

namespace beacon_detect {
// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with "Microsoft.HijackingPrevention.UnexpectedExitType"
// in src/tools/metrics/histograms/edge_enums.xml.
enum class BeaconIndex {
  kDllUnregisterDllNotification = 0,
  kRestoreEntryPoint = 1,
  kMaxBeacons = kRestoreEntryPoint + 1,
};

// We use a registry beacon to detect feature crash in elf. There are two types
// of crash scenarios: one where the feature code crashes directly, and another
// where the feature code causes other code to crash. For the direct scenario,
// we set a beacon at the start of the feature. When the feature code finishes
// running, we restore the beacon value. If a crash occurs during the feature's
// execution, the next time the feature runs, we check the beacon value to
// determine if a crash occurred. Next time the feature running ,we check the
// beacon value and can know whether this is a crash occured, For indirect
// scenario, when the beacon value reaches kLimitCrashCount, it should be
// checked once more to verify if it will indeed cause a crash. To do this, we
// set kIndirectDetectFlag to the beacon and ensure that ShouldDisableFeature
// returns false, thereby disabling the feature.When StopCrashDetection is
// called, it indicates that the crash may be related to the feature. However,
// if a crash occurs before StopCrashDetection is called, it means that the
// crash is not related to the feature, and we will enable the feature in the
// next launch.
class BeaconDetect {
 public:
  static void ResetBeaconsOnUpdate();
  static bool StartCrashDetection(BeaconIndex beacon_index,
                                  bool detect_indirect_crash);
  static void StopCrashDetection(BeaconIndex beacon_index);

  static DWORD GetBeaconValueFromRegistry(BeaconIndex beacon_index);
  static void WriteBeaconValueToRegistry(BeaconIndex beacon_index, DWORD value);

  static long GetDetectedFeatureIndex();

  static void ResetBeaconsOnProcessExit();

  static void ResetStaticVariablesForTesting();

  BeaconDetect(BeaconIndex beacon_index);
  ~BeaconDetect() = default;
  bool ShouldDisableFeature(bool detect_indirect_crash);

  void IncreaseValue();
  void ResetBeaconValue();

 private:
  BeaconIndex beacon_index_;
  DWORD beacon_value_;
};
}  // namespace beacon_detect

#endif  // CHROME_CHROME_ELF_EDGE_BEACON_DETECT_H_
