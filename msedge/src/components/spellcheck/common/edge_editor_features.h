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
BASE_DECLARE_FEATURE(kEdgeEditorSpellcheckerDlpCheck);

COMPONENT_EXPORT(EDGE_EDITOR_FEATURES)
bool IsEditorSpellcheckerDLPCheckEnabled();

COMPONENT_EXPORT(EDGE_EDITOR_FEATURES)
bool IsEditorSpellcheckEnabled();

}  // namespace edge
}  // namespace features

#endif  // COMPONENTS_SPELLCHECK_COMMON_EDGE_EDITOR_FEATURES_H_
