// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef UI_BASE_IME_EDGE_ABYDOS_IME_TYPES_H_
#define UI_BASE_IME_EDGE_ABYDOS_IME_TYPES_H_

#include <cstdint>

#include "base/notreached.h"
#include "components/edge_abydos/buildflags.h"

namespace ui {

// Forward declarations for unsupported platforms.
enum class AbydosAction : uint8_t;
enum class AbydosRequest : uint8_t;
enum class AbydosResponse : uint8_t;

// Edge only.
// See also: //ui/base/ime/mojom/ime_types.mojom
// Used to notify the external Abydos API of relevant events.
// Sent from the Renderer Process to the Browser Process.
enum class AbydosAction : uint8_t {
  kNone,
  kNotifyIntent,
  kNotifyTap,
  kNotifyStroke,
  kNotifyEditContext,
};

// See also: //ui/base/ime/mojom/ime_types.mojom
// Indicates what work or data the external Abydos API is requesting.
// Sent from the Browser Process to the Renderer Process.
enum class AbydosRequest : uint8_t {
  kNone,
  kFocusHandwritingTarget,
};

// See also: //ui/base/ime/mojom/ime_types.mojom
// The response to a ::ui::AbydosRequest.
// Sent from the Renderer Process to the Browser Process.
enum class AbydosResponse : uint8_t {
  kNone,
  // The following values are related to:
  // - ui::AbydosAction::kNotifyEditContext
  // - ui::AbydosRequest::kFocusHandwritingTarget
  // - TfHandwritingFocusTargetResponse
  kNoTarget,
  kTargetFocused,
  kTargetFocusedNoCorrections,
};

constexpr const char* AbydosActionName(AbydosAction action) {
#define CASE_TYPE(t)       \
  case AbydosAction::k##t: \
    return #t
  switch (action) {
    CASE_TYPE(None);
    CASE_TYPE(NotifyIntent);
    CASE_TYPE(NotifyTap);
    CASE_TYPE(NotifyStroke);
    CASE_TYPE(NotifyEditContext);
  }
#undef CASE_TYPE
  NOTREACHED();
}

constexpr const char* AbydosRequestName(AbydosRequest action) {
#define CASE_TYPE(t)        \
  case AbydosRequest::k##t: \
    return #t
  switch (action) {
    CASE_TYPE(None);
    CASE_TYPE(FocusHandwritingTarget);
  }
#undef CASE_TYPE
  NOTREACHED();
}

constexpr const char* AbydosResponseName(AbydosResponse action) {
#define CASE_TYPE(t)         \
  case AbydosResponse::k##t: \
    return #t
  switch (action) {
    CASE_TYPE(None);
    CASE_TYPE(NoTarget);
    CASE_TYPE(TargetFocused);
    CASE_TYPE(TargetFocusedNoCorrections);
  }
#undef CASE_TYPE
  NOTREACHED();
}

constexpr bool IsAbydosResponseValid(ui::AbydosAction abydos_action,
                                     ui::AbydosResponse abydos_response) {
  switch (abydos_response) {
    case ui::AbydosResponse::kNone:
      return abydos_action != ui::AbydosAction::kNotifyEditContext;
    case ui::AbydosResponse::kNoTarget:
    case ui::AbydosResponse::kTargetFocused:
    case ui::AbydosResponse::kTargetFocusedNoCorrections:
      return abydos_action == ui::AbydosAction::kNotifyEditContext;
  }
}

}  // namespace ui

#endif  // UI_BASE_IME_EDGE_ABYDOS_IME_TYPES_H_
