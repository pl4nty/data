// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_DLP_MOJOM_LLM_PAYLOAD_MONITOR_TYPES_H_
#define COMPONENTS_EDGE_DLP_MOJOM_LLM_PAYLOAD_MONITOR_TYPES_H_

#include "base/containers/flat_map.h"

class GURL;

namespace dlp {

// Keep in sync with LLMPayloadMonitorConfig in llm_payload_monitor_types.mojom.
// The mojom file has comments about each of these values.
enum LLMPayloadMonitorConfig {
  kNone,
  kNotify,
  kNotifyAndAwaitVerdict,
  kBlockAndNotify,
  kMaxValue = kBlockAndNotify,
};

// Keep in sync with LLMPayloadMonitorSitePolicy in
// llm_payload_monitor_types.mojom.
struct LLMPayloadMonitorSitePolicy {
  LLMPayloadMonitorConfig request_config = LLMPayloadMonitorConfig::kNone;
  LLMPayloadMonitorConfig response_config = LLMPayloadMonitorConfig::kNone;
};

using LLMPayloadMonitorPolicies =
    base::flat_map<GURL, dlp::LLMPayloadMonitorSitePolicy>;

}  // namespace dlp

#endif  // COMPONENTS_EDGE_DLP_MOJOM_LLM_PAYLOAD_MONITOR_TYPES_H_
