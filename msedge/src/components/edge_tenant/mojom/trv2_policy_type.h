// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_TENANT_MOJOM_TRV2_POLICY_TYPE_H_
#define COMPONENTS_EDGE_TENANT_MOJOM_TRV2_POLICY_TYPE_H_

#include <string>
#include <vector>

#include "base/memory/ref_counted.h"
#include "components/edge_tenant/common/trv2_policy.h"

namespace trv2 {

// Keep in sync with Trv2Policy in trv2.mojom.
class Trv2Policy : public base::RefCountedThreadSafe<Trv2Policy> {
 public:
  REQUIRE_ADOPTION_FOR_REFCOUNTED_TYPE();

  explicit Trv2Policy(edge::tenant_restrictions::trv2::Policy&& policy);

  Trv2Policy(const Trv2Policy&) = delete;
  Trv2Policy& operator=(const Trv2Policy&) = delete;

  const std::string& payload() const { return policy_.payload(); }

  const std::vector<edge::tenant_restrictions::trv2::Policy::HostNode>& hosts()
      const {
    return policy_.hosts();
  }

  const edge::tenant_restrictions::trv2::Policy& policy() const {
    return policy_;
  }

 private:
  friend class base::RefCountedThreadSafe<Trv2Policy>;
  ~Trv2Policy();

  edge::tenant_restrictions::trv2::Policy policy_;
};

}  // namespace trv2

#endif  // COMPONENTS_EDGE_TENANT_MOJOM_TRV2_POLICY_TYPE_H_
