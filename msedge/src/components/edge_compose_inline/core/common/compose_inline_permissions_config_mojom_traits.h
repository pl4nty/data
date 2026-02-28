// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_COMPOSE_INLINE_CORE_COMMON_COMPOSE_INLINE_PERMISSIONS_CONFIG_MOJOM_TRAITS_H_
#define COMPONENTS_EDGE_COMPOSE_INLINE_CORE_COMMON_COMPOSE_INLINE_PERMISSIONS_CONFIG_MOJOM_TRAITS_H_

#include "components/edge_compose_inline/core/common/compose_inline_host.mojom-shared.h"
#include "components/edge_compose_inline/core/common/compose_inline_permissions_config.h"

namespace mojo {

template <>
struct StructTraits<
    edge::compose_inline::mojom::ComposeInlinePermissionsConfigDataView,
    edge::compose_inline::ComposeInlinePermissionsConfig> {
  static bool is_allowed_for_start_writing(
      const edge::compose_inline::ComposeInlinePermissionsConfig& config) {
    return config.is_allowed_for_start_writing;
  }

  static bool is_allowed_for_rewrite(
      const edge::compose_inline::ComposeInlinePermissionsConfig& config) {
    return config.is_allowed_for_rewrite;
  }

  static bool Read(
      edge::compose_inline::mojom::ComposeInlinePermissionsConfigDataView data,
      edge::compose_inline::ComposeInlinePermissionsConfig* out) {
    out->is_allowed_for_start_writing = data.is_allowed_for_start_writing();
    out->is_allowed_for_rewrite = data.is_allowed_for_rewrite();
    return true;
  }
};

}  // namespace mojo

#endif  // COMPONENTS_EDGE_COMPOSE_INLINE_CORE_COMMON_COMPOSE_INLINE_PERMISSIONS_CONFIG_MOJOM_TRAITS_H_
