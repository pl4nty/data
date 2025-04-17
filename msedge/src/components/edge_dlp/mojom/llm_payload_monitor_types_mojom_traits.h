// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_DLP_MOJOM_LLM_PAYLOAD_MONITOR_TYPES_MOJOM_TRAITS_H_
#define COMPONENTS_EDGE_DLP_MOJOM_LLM_PAYLOAD_MONITOR_TYPES_MOJOM_TRAITS_H_

#include "components/edge_dlp/mojom/llm_payload_monitor_types.h"
#include "components/edge_dlp/mojom/llm_payload_monitor_types.mojom-shared.h"
#include "mojo/public/cpp/bindings/enum_traits.h"
#include "mojo/public/cpp/bindings/struct_traits.h"

namespace mojo {

template <>
struct EnumTraits<dlp::mojom::LLMPayloadMonitorConfig,
                  dlp::LLMPayloadMonitorConfig> {
  static dlp::mojom::LLMPayloadMonitorConfig ToMojom(
      dlp::LLMPayloadMonitorConfig input);
  static bool FromMojom(dlp::mojom::LLMPayloadMonitorConfig input,
                        dlp::LLMPayloadMonitorConfig* out);
};

template <>
class StructTraits<dlp::mojom::LLMPayloadMonitorSitePolicyDataView,
                   dlp::LLMPayloadMonitorSitePolicy> {
 public:
  static dlp::LLMPayloadMonitorConfig request_config(
      const dlp::LLMPayloadMonitorSitePolicy& input) {
    return input.request_config;
  }

  static dlp::LLMPayloadMonitorConfig response_config(
      const dlp::LLMPayloadMonitorSitePolicy& input) {
    return input.response_config;
  }

  static bool Read(dlp::mojom::LLMPayloadMonitorSitePolicyDataView data,
                   dlp::LLMPayloadMonitorSitePolicy* output);
};

}  // namespace mojo

#endif  // COMPONENTS_EDGE_DLP_MOJOM_LLM_PAYLOAD_MONITOR_TYPES_MOJOM_TRAITS_H_
