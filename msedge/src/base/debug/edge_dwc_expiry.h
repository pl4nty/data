// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef BASE_DEBUG_EDGE_DWC_EXPIRY_H_
#define BASE_DEBUG_EDGE_DWC_EXPIRY_H_

#include <algorithm>
#include <cstddef>
#include <cstdint>

namespace base::debug {

// Generated sorted array of expired DwC workitem IDs.
// See tools/dwc/generate_expired_dwc_array.py for codegen details.
#include "tools/dwc/expired_dwc_list.inc"

// Returns true if the DwC workitem has expired per edge_dwcs.xml.
//
// This is consteval (an immediate function): every call is evaluated at
// compile time. The workitem argument must be a compile-time constant
// (which is always the case in DUMP_WITHOUT_CRASHING()). For expired
// workitems, the entire DumpWithoutCrashing() call is dead-code-eliminated
// via if constexpr — zero runtime cost.
consteval bool IsDwcExpired(int64_t workitem) {
  if (kExpiredDwcWorkitemsSize == 0) {
    return false;
  }
  return std::ranges::binary_search(kExpiredDwcWorkitems, workitem);
}

}  // namespace base::debug

#endif  // BASE_DEBUG_EDGE_DWC_EXPIRY_H_
