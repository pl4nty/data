// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_DLP_MOJOM_LLM_PAYLOAD_MONITOR_TYPES_MOJOM_TRAITS_H_
#define COMPONENTS_EDGE_DLP_MOJOM_LLM_PAYLOAD_MONITOR_TYPES_MOJOM_TRAITS_H_

#include "base/containers/flat_map.h"
#include "components/edge_dlp/mojom/llm_payload_monitor_types.h"
#include "components/edge_dlp/mojom/llm_payload_monitor_types.mojom-shared.h"
#include "mojo/public/cpp/bindings/enum_traits.h"
#include "mojo/public/cpp/bindings/struct_traits.h"
#include "url/gurl.h"

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

template <>
class StructTraits<dlp::mojom::DomainPolicyPartsDataView,
                   dlp::LLMPayloadMonitorPolicies::DomainPolicyParts> {
 public:
  static const std::string& domain(
      const dlp::LLMPayloadMonitorPolicies::DomainPolicyParts& input) {
    return input.domain;
  }

  static const dlp::LLMPayloadMonitorSitePolicy& policy(
      const dlp::LLMPayloadMonitorPolicies::DomainPolicyParts& input) {
    return input.policy;
  }

  static bool Read(dlp::mojom::DomainPolicyPartsDataView data,
                   dlp::LLMPayloadMonitorPolicies::DomainPolicyParts* output);
};

template <>
class StructTraits<dlp::mojom::LLMPayloadMonitorPoliciesDataView,
                   dlp::LLMPayloadMonitorPolicies> {
 public:
  static base::flat_map<GURL, dlp::LLMPayloadMonitorSitePolicy> exact_urls(
      const dlp::LLMPayloadMonitorPolicies& input) {
    return input.exact_urls;
  }

  static std::vector<dlp::LLMPayloadMonitorPolicies::DomainPolicyParts> domains(
      const dlp::LLMPayloadMonitorPolicies& input) {
    return input.domains;
  }

  static bool Read(dlp::mojom::LLMPayloadMonitorPoliciesDataView sets,
                   dlp::LLMPayloadMonitorPolicies* out_sets);
};

}  // namespace mojo

#endif  // COMPONENTS_EDGE_DLP_MOJOM_LLM_PAYLOAD_MONITOR_TYPES_MOJOM_TRAITS_H_
