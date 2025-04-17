// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_IMAGE_MAGNIFY_CORE_COMMON_EDGE_IMAGE_MAGNIFY_CTRL_TAP_HELPER_H_
#define COMPONENTS_EDGE_IMAGE_MAGNIFY_CORE_COMMON_EDGE_IMAGE_MAGNIFY_CTRL_TAP_HELPER_H_

#include "base/time/time.h"
#include "third_party/abseil-cpp/absl/types/optional.h"

namespace edge_image_magnify {

class EdgeImageMagnifyCtrlTapHelper {
 public:
  EdgeImageMagnifyCtrlTapHelper();

  bool ShouldMagnifyFromCtrlDoubleTap(bool key_down, bool key_up);

 private:
  enum class EventNumber { First, Second };

  enum class CtrlTapState {
    Idle,
    CtrlFirstKeyDown,
    CtrlFirstKeyUp,
    CtrlSecondKeyDown
  };

  void RecordCtrlKeyDownTimeStamp(EventNumber event);
  void ResetCtrlKeyDownTimeStamp(EventNumber event);
  bool ExceedsKeyDownTimeLimit(EventNumber event);

  // Keeps track of the current state of ctrl key presses
  CtrlTapState state_ = CtrlTapState::Idle;

  // Records the previous timestamp for ctrl key-down event
  std::optional<base::TimeTicks> first_ctrl_key_down_timestamp_;
  std::optional<base::TimeTicks> second_ctrl_key_down_timestamp_;
};

}  // namespace edge_image_magnify

#endif  // COMPONENTS_EDGE_IMAGE_MAGNIFY_CORE_COMMON_EDGE_IMAGE_MAGNIFY_CTRL_TAP_HELPER_H_
