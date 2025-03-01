// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_ABYDOS_FEATURES_H_
#define COMPONENTS_EDGE_ABYDOS_FEATURES_H_

#include "base/component_export.h"
#include "base/feature_list.h"
#include "base/metrics/field_trial_params.h"
#include "build/build_config.h"
#include "components/edge_abydos/buildflags.h"

#if !BUILDFLAG(EDGE_ENABLE_ABYDOS)
#error "Abydos Feature code has not been enabled."
#endif  // BUILDFLAG(EDGE_ENABLE_ABYDOS)

namespace edge {
namespace abydos {

COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
BASE_DECLARE_FEATURE(kAbydosHandwritingAttr);
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON) BASE_DECLARE_FEATURE(kAbydos);
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
extern bool IsAbydosEnabled();

COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
BASE_DECLARE_FEATURE(kAbydosForWindowlessWV2);
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
extern bool IsAbydosForWindowlessWV2Enabled();

COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
BASE_DECLARE_FEATURE(kDisableAbydosForPDF);
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
extern bool AbydosDisabledDueToPDFRendererSwitch();

// If enabled, Abydos will support gesture detection.
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
BASE_DECLARE_FEATURE(kAbydosGestureSupport);
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
extern bool IsAbydosGestureSupportEnabled();

// If enabled, Abydos will defer calling SetHandwritingState (until the first
// pen down) to improve browser start up perf.
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
BASE_DECLARE_FEATURE(kAbydosDeferSetHandwritingState);
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
extern bool IsAbydosDeferSetHandwritingStateEnabled();

// If enabled, the renderer will reinterpret the ATQ(s). This will enable users
// to write smaller text without the inking session getting cancelled.
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
BASE_DECLARE_FEATURE(kAbydosCustomTapDetection);
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
extern bool IsAbydosCustomTapDetectionEnabled();
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
extern const base::FeatureParam<double> kTapDistanceThresholdInMm;
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
extern double AbydosTapDistanceThresholdInMm();
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
extern const base::FeatureParam<int> kTapTimingThresholdInMs;
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
extern int AbydosTapTimingThresholdInMs();

// Support configurable number for how many character bounds will be cached by
// the browser.
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
BASE_DECLARE_FEATURE(kAbydosBoundsCollection);
// Specifies how many character bounds will be cached by the browser. Note that
// the bounds collection happens forwards and backwards. So, the total number of
// bounds cached will be 2x the number specified.
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
extern const base::FeatureParam<int> kAbydosBoundsCollectionCharacterLimit;
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
extern int AbydosBoundsCollectionCharacterLimit();

// Support configurable override for GetACPFromPoint `dwFlags` parameter.
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
BASE_DECLARE_FEATURE(kAbydosACP);
// Specifies whether to override the provided `dwFlags`, and if so, which
// flag(s) to provide.
enum class ACPMode : uint8_t {
  // Consume the OS provided flags
  kDefault,
  // Override to provide no flags
  kNone,
  // Override to provide `GXFPF_NEAREST`
  kNearest,
  // Override to provide `GXFPF_ROUND_NEAREST`
  kRoundNearest,
  // Override to provide `GXFPF_NEAREST | GXFPF_ROUND_NEAREST`
  kBoth,
};
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
extern const base::FeatureParam<ACPMode> kAbydosACPMode;
COMPONENT_EXPORT(EDGE_ABYDOS_COMMON)
extern ACPMode AbydosACPMode();

constexpr const char* ACPModeParamString(ACPMode mode) {
  switch (mode) {
    case ACPMode::kDefault:
      return "default";
    case ACPMode::kNone:
      return "none";
    case ACPMode::kNearest:
      return "nearest";
    case ACPMode::kRoundNearest:
      return "round-nearest";
    case ACPMode::kBoth:
      return "both";
  }
  NOTREACHED();
}

}  // namespace abydos
}  // namespace edge

#endif  // COMPONENTS_EDGE_ABYDOS_FEATURES_H_
