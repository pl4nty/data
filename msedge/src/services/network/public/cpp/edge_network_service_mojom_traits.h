// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef SERVICES_NETWORK_PUBLIC_CPP_EDGE_NETWORK_SERVICE_MOJOM_TRAITS_H_
#define SERVICES_NETWORK_PUBLIC_CPP_EDGE_NETWORK_SERVICE_MOJOM_TRAITS_H_

#include "components/edge_trust/tracking_protection/options.h"
#include "mojo/public/cpp/bindings/enum_traits.h"
#include "services/network/public/cpp/edge_circuit_breaker_enums.h"
#include "services/network/public/mojom/url_loader_network_service_observer.mojom.h"

namespace mojo {
template <>
struct EnumTraits<network::mojom::CircuitBreakerOpenMechanism,
                  network::CircuitBreakerOpenMechanism> {
  static network::mojom::CircuitBreakerOpenMechanism ToMojom(
      network::CircuitBreakerOpenMechanism input);
  static network::CircuitBreakerOpenMechanism FromMojom(
      network::mojom::CircuitBreakerOpenMechanism input);
};

template <>
struct EnumTraits<network::mojom::Mitigation, tracking_prevention::Mitigation> {
  static network::mojom::Mitigation ToMojom(
      tracking_prevention::Mitigation input);
  static tracking_prevention::Mitigation FromMojom(
      network::mojom::Mitigation input);
};

template <>
struct EnumTraits<network::mojom::TrackerType,
                  tracking_prevention::TrackerType> {
  static network::mojom::TrackerType ToMojom(
      tracking_prevention::TrackerType input);
  static tracking_prevention::TrackerType FromMojom(
      network::mojom::TrackerType input);
};
}  // namespace mojo

#endif  // SERVICES_NETWORK_PUBLIC_CPP_EDGE_NETWORK_SERVICE_MOJOM_TRAITS_H_
