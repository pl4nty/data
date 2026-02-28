// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_COMPOSE_INLINE_CORE_COMMON_COMPOSE_INLINE_PERMISSIONS_CONFIG_H_
#define COMPONENTS_EDGE_COMPOSE_INLINE_CORE_COMMON_COMPOSE_INLINE_PERMISSIONS_CONFIG_H_

namespace edge::compose_inline {

// Native C++ struct representing compose inline permission settings.
// Used with mojo StructTraits to automatically convert to/from the mojom
// ComposeInlinePermissionsConfig struct.
struct ComposeInlinePermissionsConfig {
  // Whether the start writing feature is allowed.
  bool is_allowed_for_start_writing = false;

  // Whether the rewrite feature is allowed.
  bool is_allowed_for_rewrite = false;
};

}  // namespace edge::compose_inline

#endif  // COMPONENTS_EDGE_COMPOSE_INLINE_CORE_COMMON_COMPOSE_INLINE_PERMISSIONS_CONFIG_H_
