// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef SERVICES_NETWORK_PUBLIC_CPP_EDGE_CIRCUIT_BREAKER_ENUMS_H_
#define SERVICES_NETWORK_PUBLIC_CPP_EDGE_CIRCUIT_BREAKER_ENUMS_H_

namespace network {

enum class CircuitBreakerOpenMechanism {
  RETRY_AFTER = 0,
  AUTOMATIC = 1,
  ECS = 2,
  kMaxValue = ECS,
};

}  // namespace network

#endif  // SERVICES_NETWORK_PUBLIC_CPP_EDGE_CIRCUIT_BREAKER_ENUMS_H_
