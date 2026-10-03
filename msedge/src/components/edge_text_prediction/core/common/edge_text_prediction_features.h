// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_TEXT_PREDICTION_CORE_COMMON_EDGE_TEXT_PREDICTION_FEATURES_H_
#define COMPONENTS_EDGE_TEXT_PREDICTION_CORE_COMMON_EDGE_TEXT_PREDICTION_FEATURES_H_

#include "base/component_export.h"
#include "base/feature_list.h"
#include "base/metrics/field_trial_params.h"
#include "build/build_config.h"

namespace edge {
namespace text_prediction {

COMPONENT_EXPORT(EDGE_TEXT_PREDICTION_FEATURES)
extern bool IsUseMicrosoftTuringForTextPredictionEnabled();

// If enabled, the Microsoft Turing text prediction service
// (turing-writingassistance.edge.microsoft.com) is not contacted while Edge
// runs as the unified Copilot app (copilotapp.exe), pending compliance work.
// Scoped to the unified Copilot app via CopilotAppType::kUnifiedOnly and
// enabled there by UnifiedCopilotPermanentFeatureOverrides.
COMPONENT_EXPORT(EDGE_TEXT_PREDICTION_FEATURES)
BASE_DECLARE_COPILOT_FEATURE(kTextPredictionDisabledInCopilotApp);

// Returns false when running as the unified Copilot app (copilotapp.exe), where
// the Microsoft Turing text prediction service
// (turing-writingassistance.edge.microsoft.com) is disabled pending compliance
// review (gated by kTextPredictionDisabledInCopilotApp). Returns true in all
// other processes. Both the network master gate
// (IsUseMicrosoftTuringForTextPredictionEnabled) and the host pref gate
// (IsTextPredictionSettingEnabled) route their Copilot-app disable decision
// through this helper.
COMPONENT_EXPORT(EDGE_TEXT_PREDICTION_FEATURES)
bool IsTextPredictionServiceEnabled();

// This is a helper method to set current country code for test. Should only be
// used by test.
COMPONENT_EXPORT(EDGE_TEXT_PREDICTION_FEATURES)
void SetCountryCodeByStringForTesting(const std::string& county_code);

// Feature flag to enable global languages
COMPONENT_EXPORT(EDGE_TEXT_PREDICTION_FEATURES)
BASE_DECLARE_FEATURE(kTextPredictionGlobalLanguage);

// This is the param of specifying the languages
COMPONENT_EXPORT(EDGE_TEXT_PREDICTION_FEATURES)
extern const base::FeatureParam<std::string> kTextPredictionSupportedLanguages;

// This is the param to specify the queue size of requests
COMPONENT_EXPORT(EDGE_TEXT_PREDICTION_FEATURES)
extern const base::FeatureParam<size_t> kTextPredictionQueueSize;

// Feature flag to enable thresholding for text prediction
COMPONENT_EXPORT(EDGE_TEXT_PREDICTION_FEATURES)
BASE_DECLARE_FEATURE(kTextPredictionThreshold);

// This is the param of specifying the minimum score. Predictions with lower
// score than the threshold will be regarded as no prediction
COMPONENT_EXPORT(EDGE_TEXT_PREDICTION_FEATURES)
extern const base::FeatureParam<double> kTextPredictionThresholdMinScore;

}  // namespace text_prediction
}  // namespace edge
#endif  // COMPONENTS_EDGE_TEXT_PREDICTION_CORE_COMMON_EDGE_TEXT_PREDICTION_FEATURES_H_
