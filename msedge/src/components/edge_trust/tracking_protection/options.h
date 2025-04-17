// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_TRUST_TRACKING_PROTECTION_OPTIONS_H_
#define COMPONENTS_EDGE_TRUST_TRACKING_PROTECTION_OPTIONS_H_

#include <stdint.h>

namespace tracking_prevention {

// `BlockSet` is used to set tracking protection options for blocking
// both cookies and resources from known tracking domains.
// Each `BlockSet` represents a group of `TrackingSource` categories that
// should be blocked.
using BlockSet = uint32_t;

// `EngagementSet` is used to represent a set of `TrackingSource` categories
// that are allowed to be ignored if significant engagement with the tracking
// organization currently exists.
using EngagementSet = uint32_t;

// `Mitigation` is used to identify what, if any, mitigation was applied to a
// given tracker check to allow a request that would otherwise be blocked.
//
// None: No mitigation was used
// SameOrg: The tracker was in the same organization as the top-level origin
// ProfileMode: A user preference for the TP mode prevents blocking this
//              tracker.
// OrgEngagement: 'High' engagement with the tracking organization
//                exists
// TransparentAdvertiser: Organization is in the TAP and meets a high bar for
//                        transparency and data management.
//
// This is used in telementry and entries should not be renumbered and numeric
// values should never be reused. Please keep in sync with
// "Microsoft.TrackingPrevention.Mitigation" in
// src/tools/metrics/histograms/edge_enums.xml.
// This also needs to be kept in sync with mojo at:
// src/services/network/public/mojom/network_service.mojom
enum class Mitigation {
  None = 0,
  SameOrg = 1,
  ProfileMode = 2,
  OrgEngagement = 3,
  TransparentAdvertiser = 4,
  kMaxValue = TransparentAdvertiser,
};

// Enum of all the types of trackers we may block. This maps to the type of
// enforcement actions tracking protection may take against trackers and helps
// update the UI with the appropriate information.
//
// This is used in telementry and entries should not be renumbered and numeric
// values should never be reused. Please keep in sync with
// "Microsoft.TrackerType" in src/tools/metrics/histograms/edge_enums.xml.
enum class TrackerType {
  CSPREPORT_RESOURCE = 0,
  FAVICON_RESOURCE = 1,
  FONT_RESOURCE = 2,
  IFRAME_RESOURCE = 3,
  IMAGE_RESOURCE = 4,
  MEDIA_RESOURCE = 5,
  OBJECT_RESOURCE = 6,
  OTHER_RESOURCE = 7,
  PING_RESOURCE = 8,
  PLUGIN_RESOURCE = 9,
  PREFETCH_RESOURCE = 10,
  PRELOAD_RESOURCE = 11,
  SCRIPT_RESOURCE = 12,
  SERVICE_WORKER_RESOURCE = 13,
  STORAGE = 14,
  STYLESHEET_RESOURCE = 15,
  WORKER_RESOURCE = 16,
  XHR_RESOURCE = 17,
  kMaxValue = XHR_RESOURCE,
};

// `TrackingError` is a list of all TrackingProtection errors that can occur.
// `TrackingError::None` may be used to signal no error/successful operation of
// an operation.
//
// This is used in telementry and entries should not be renumbered and numeric
// values should never be reused. Please keep in sync with
// "Microsoft.TrackingError" in src/tools/metrics/histograms/edge_enums.xml.
enum class TrackingError {
  NONE = 0,
  FILE_READ_ERROR = 1,
  INVALID_LIST_FORMAT = 2,
  MISSING_COMPONENT = 3,
  MISSING_LIST = 4,
  kMaxValue = MISSING_LIST,
};

// `TrackingSource` is used to identify, roughly, what type of tracker has been
// identified. This grouping is based on the majority of tracking activities
// that the specified domain carries out. These are keyed to a unique binary
// prefix so they can also be used as flags. A group of tracking sources, such
// as for a `BlockSet` may be represented numerically to allow for easier
// comparison. e.g. Advertising & Fingerprinting => 0x11
//
// This is used in telementry and entries should not be renumbered and numeric
// values should never be reused. Please keep in sync with
// "Microsoft.TrackingSource" in src/tools/metrics/histograms/edge_enums.xml.
enum class TrackingSource : uint32_t {
  None = 0x0000,
  Advertising = 0x0001,
  Analytics = 0x0002,
  Content = 0x0004,
  Cryptomining = 0x0008,
  Fingerprinting = 0x0010,
  Social = 0x0020,
  Other = 0x0040,
  Staging = 0x0080,
  AI = 0x0100,
  kMaxValue = AI,
};

// |UserPreference| is used to manage options configured via settings UI.
//
// This is used in telementry and entries should not be renumbered and numeric
// values should never be reused. Please keep in sync with
// "Microsoft.TrackingPrevention.UserPreference" in
// src/tools/metrics/histograms/edge_enums.xml.
// GENERATED_JAVA_ENUM_PACKAGE: (
//   org.chromium.chrome.browser.edge_tracking_prevention)
// GENERATED_JAVA_CLASS_NAME_OVERRIDE: TrackingPreventionUserPref
enum class UserPreference {
  OFF = 0,
  BASIC = 1,
  BALANCED = 2,
  STRICT_BLOCK = 3,
  kMaxValue = STRICT_BLOCK,
};

}  // namespace tracking_prevention

#endif  // COMPONENTS_EDGE_TRUST_TRACKING_PROTECTION_OPTIONS_H_
