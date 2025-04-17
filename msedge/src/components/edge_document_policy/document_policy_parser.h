// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <string_view>
#include <unordered_map>
#include <utility>
#include <vector>


#ifndef COMPONENTS_EDGE_DOCUMENT_POLICY_DOCUMENT_POLICY_PARSER_H_
#define COMPONENTS_EDGE_DOCUMENT_POLICY_DOCUMENT_POLICY_PARSER_H_

namespace edge {

namespace document_policy {
enum PolicyStatus {
  ENABLED = 0,
  DISABLED = 1,
};

enum Policy {
  INTELLIGENT_COMPOSE = 0,
};
std::vector<std::pair<Policy, PolicyStatus>> ParseDocumentPolicies(
    std::string_view raw_policies);

std::unordered_map<std::string, Policy>* GetPolicyNameMap();
std::unordered_map<std::string, PolicyStatus>* GetPolicyStatus();

}  // namespace document_policy

}  // namespace edge

#endif  // COMPONENTS_EDGE_DOCUMENT_POLICY_DOCUMENT_POLICY_PARSER_H_
