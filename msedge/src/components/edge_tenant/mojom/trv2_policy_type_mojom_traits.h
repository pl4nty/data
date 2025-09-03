// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_TENANT_MOJOM_TRV2_POLICY_TYPE_MOJOM_TRAITS_H_
#define COMPONENTS_EDGE_TENANT_MOJOM_TRV2_POLICY_TYPE_MOJOM_TRAITS_H_

#include <string>
#include <vector>

#include "base/memory/scoped_refptr.h"
#include "components/edge_tenant/common/trv2_policy.h"
#include "components/edge_tenant/mojom/trv2.mojom-shared.h"
#include "components/edge_tenant/mojom/trv2_policy_type.h"
#include "mojo/public/cpp/bindings/struct_traits.h"

namespace mojo {

template <>
struct StructTraits<trv2::mojom::HostNodeDataView,
                    edge::tenant_restrictions::trv2::Policy::HostNode> {
  static const std::string& hostname(
      const edge::tenant_restrictions::trv2::Policy::HostNode& node) {
    return node.hostname;
  }

  static bool is_wild_card(
      const edge::tenant_restrictions::trv2::Policy::HostNode& node) {
    return node.is_wild_card;
  }

  static bool Read(trv2::mojom::HostNodeDataView data,
                   edge::tenant_restrictions::trv2::Policy::HostNode* out);
};

template <>
class StructTraits<trv2::mojom::Trv2PolicyDataView,
                   scoped_refptr<trv2::Trv2Policy>> {
 public:
  static bool IsNull(const scoped_refptr<trv2::Trv2Policy>& r) { return !r; }

  static void SetToNull(scoped_refptr<trv2::Trv2Policy>* output) {
    *output = nullptr;
  }

  static const std::string& payload(
      const scoped_refptr<trv2::Trv2Policy>& policy) {
    return policy->payload();
  }

  static const std::vector<edge::tenant_restrictions::trv2::Policy::HostNode>&
  hosts(const scoped_refptr<trv2::Trv2Policy>& policy) {
    return policy->hosts();
  }

  static bool Read(trv2::mojom::Trv2PolicyDataView data,
                   scoped_refptr<trv2::Trv2Policy>* out);
};

}  // namespace mojo

#endif  // COMPONENTS_EDGE_TENANT_MOJOM_TRV2_POLICY_TYPE_MOJOM_TRAITS_H_
