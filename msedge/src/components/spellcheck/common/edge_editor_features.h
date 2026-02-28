// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_SPELLCHECK_COMMON_EDGE_EDITOR_FEATURES_H_
#define COMPONENTS_SPELLCHECK_COMMON_EDGE_EDITOR_FEATURES_H_

#include "base/component_export.h"
#include "base/feature_list.h"
#include "base/metrics/field_trial_params.h"
#include "build/build_config.h"

namespace features {
namespace edge {

// If enabled, edge uses DLP check to determine whether to use remote
// spellchecking service.
COMPONENT_EXPORT(EDGE_EDITOR_FEATURES)
BASE_DECLARE_FEATURE(kEdgeEditorSpellcheckerDlpCheck);

// If enabled, detects the appropriate Microsoft Editor endpoint based on
// the user's sovereign cloud environment from their AAD sign-in.
COMPONENT_EXPORT(EDGE_EDITOR_FEATURES)
BASE_DECLARE_FEATURE(kEdgeEditorEnvironmentEndpointDetection);

COMPONENT_EXPORT(EDGE_EDITOR_FEATURES)
bool IsEditorSpellcheckerDLPCheckEnabled();

COMPONENT_EXPORT(EDGE_EDITOR_FEATURES)
bool IsEditorEnvironmentEndpointDetectionEnabled();

COMPONENT_EXPORT(EDGE_EDITOR_FEATURES)
bool IsEditorSpellcheckEnabled();

BASE_DECLARE_FEATURE(kEdgeEditorSpellcheckerUXV2);
COMPONENT_EXPORT(EDGE_EDITOR_FEATURES)
bool IsEditorSpellcheckerUXV2Enabled();

}  // namespace edge
}  // namespace features

#endif  // COMPONENTS_SPELLCHECK_COMMON_EDGE_EDITOR_FEATURES_H_
