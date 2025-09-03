// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_TENANT_COMMON_TRV2_POLICY_H_
#define COMPONENTS_EDGE_TENANT_COMMON_TRV2_POLICY_H_

#include <string>
#include <vector>

class GURL;

namespace edge {
namespace tenant_restrictions {
namespace trv2 {

class Policy {
 public:
  struct HostNode {
    std::string hostname;
    bool is_wild_card;
    bool operator<(const HostNode& rhs) const;
    bool Match(const std::string& hostname) const;
    bool operator==(const HostNode& rhs) const {
      return !(*this < rhs) && !(rhs < *this);
    }
    bool IsValid() const;
  };
  explicit Policy(const std::string& payload,
                  const std::vector<std::string>& hosts);
  // Requires pre-validated payload/hosts.
  explicit Policy(std::string payload, std::vector<HostNode> hosts);
  Policy(const Policy& rhs) = delete;
  Policy(Policy&& rhs);
  ~Policy();

  bool IsUrlWeCareAbout(const GURL& url) const;
  const std::string& payload() const { return header_payload_; }
  const std::vector<HostNode>& hosts() const { return hosts_; }
  std::vector<std::string> PackHosts() const;
  bool IsActive() const { return !header_payload_.empty() && !hosts_.empty(); }
  bool IsValid() const {
    return IsActive() || (header_payload_.empty() && hosts_.empty());
  }

  Policy& operator=(const Policy& rhs) = delete;
  Policy& operator=(Policy&& rhs);
  bool operator==(const Policy& rhs) const;
  bool operator!=(const Policy& rhs) const { return !operator==(rhs); }

 private:
  friend class Trv2PolicyTest;

  static std::vector<HostNode> UnpackHosts(
      const std::vector<std::string>& hosts);
  void InitHosts(std::vector<HostNode> hosts);

  std::string header_payload_;
  std::vector<HostNode> hosts_;
};

}  // namespace trv2
}  // namespace tenant_restrictions
}  // namespace edge

#endif  // COMPONENTS_EDGE_TENANT_COMMON_TRV2_POLICY_H_
