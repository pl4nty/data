// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_SMART_FIND_ON_PAGE_EDGE_FIND_IN_PAGE_ENUMS_H_
#define COMPONENTS_EDGE_SMART_FIND_ON_PAGE_EDGE_FIND_IN_PAGE_ENUMS_H_

namespace edge {
namespace find_in_page {

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with "Microsoft.FindInPageStatus" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class FindInPageStatus {
  // Indicates that the cloud service request was sent successfully, and the
  // client got back a result successfully.
  kCloudServiceRequestOk = 0,

  // Indicates that the cloud service request was sent successfully, and while
  // we were waiting for a successful request (client connected to the
  // internet), we received an HTTP response code other than 200.
  kCloudServiceRequestFailed = 1,

  // Indicates that the cloud service request takes more time than expected.
  kCloudServiceRequestTimedout = 2,

  // Indicates that we have tried to send a cloud request with empty inputs.
  kCloudServiceRequestEmptyInputs = 3,

  // Indicates that we failed to build the payload of the cloud request.
  kCloudServiceRequestPrepareRequestBodyFailed = 4,

  // While waiting for the cloud service request response, the request can be
  // canceled.
  kCloudServiceRequestCanceledWhileWaitingForResponse = 5,

  // While waiting for the cloud service request response, the client may be
  // disconnected. As a result, the HTTP connection will be dropped. Instead of
  // counting that behavior as |kCloudServiceRequestFailed|, it will be
  // considered in another bucket.
  kCloudServiceRequestResponseIgnoredWhileDisconnected = 6,

  kMaxValue = kCloudServiceRequestResponseIgnoredWhileDisconnected,
};

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with "Microsoft.ParseResultStatus" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class ParseResultStatus {
  // Indicates that a result from a successful request is successfully parsed,
  // and the parsed result is not empty.
  kParseResultOk = 0,

  // Indicates that the HTTP request returned an error code like 500, 401, etc.
  kInvalidHttpRequest = 1,

  // Indicates that a result from a successful request is invalid JSON data.
  kJsonReaderFailed = 2,

  // We are expecting to receive a related match result as a JSON list. This
  // indicates that the result is not a JSON list.
  kInvalidRelatedMatchList = 3,

  kParseKeywordItemFailed = 4,  // Deprecated.

  // Each related match keyword should have a set of fields that provide details
  // on that result. Those fields are required. This indicates that one of those
  // fields is missing. We are expecting to receive a related match result as a
  // JSON list. This indicates that the result is not a JSON list.
  kKeywordItemSubKeyMissing = 5,

  // The fields that describe a related match keyword should have a specific
  // type. This indicated that one of those fields has a wrong field type.
  kKeywordItemInvalidSubKey = 6,

  // For some requests, the Turing service will return an empty results.
  kEmptyRelatedMatchesBeforeParsing = 7,

  // While parsing a result from a successful request, the entries may be
  // discarded for an invalid for missing JSON key. Therefore, we can end up
  // with empty results.
  kEmptyRelatedMatchesAfterParsing = 8,

  // Indicates that we are trying to parse a result for a non-successful request
  // while we are disconnected. Therefore, the result should be discarded.
  kEmptyRelatedMatchesWhileDisconnected = 9,

  // Indicates that we are trying to parse a result for a request that is
  // already canceled. Therefore, that result should be discarded.
  kNoRelatedMatchesWhileRequestCanceled = 10,

  kMaxValue = kNoRelatedMatchesWhileRequestCanceled,
};

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with "Microsoft.EdgeFindTogglesState" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class EdgeFindTogglesState {
  kNone = 0,
  kCase = 1,                     // 1 << 0
  kWholeWord = 2,                // 1 << 1
  kCaseWholeWord = 3,            // kCase | kWholeWord
  kDiacritics = 4,               // 1 << 2
  kCaseDiacritics = 5,           // kCase | kDiacritics
  kWholeWordDiacritics = 6,      // kWholeWord | kDiacritics
  kCaseWholeWordDiacritics = 7,  // kCase | kWholeWord | kDiacritics
  kRelatedMatches = 8,           // 1 << 3
  kCaseRelated = 9,              // kCase | kRelatedMatches
  // The following values are seen when FindFilters are toggled when LinkUI for
  // related matches is enabled.
  kWholeWordRelated = 10,            // kWholeWord | kRelatedMatches
  kCaseWholeWordRelated = 11,        // kCase | kWholeWord | kRelatedMatches
  kDiacriticsRelated = 12,           // kDiacritics | kRelatedMatches
  kCaseDiacriticsRelated = 13,       // kCase | kDiacritics | kRelatedMatches
  kWholeWordDiacriticsRelated = 14,  // kWholeWord | kDiacritics | kRelated
  kCaseWholeWordDiacriticsRelated = 15,  // kAll

  kMaxValue = kCaseWholeWordDiacriticsRelated,
};

// Entries should not be renumbered or removed and numeric values
// should never be reused. Please keep in sync with
// "Microsoft.Find.Sidebar.SwitchFindInPageState" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class EdgeFindInPageSwitchState {
  kFlyout = 0,   // Findbar
  kSidebar = 1,  // Sidebar

  kMaxValue = kSidebar,
};

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with "Microsoft.RelatedMatchClickStatus" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class RelatedMatchClickStatus {
  kNotClickedWithoutExactMatch = 0,
  kNotClickedWithExactMatch = 1,
  kClickedWithoutExactMatch = 2,
  kClickedWithExactMatch = 3,

  kMaxValue = kClickedWithExactMatch,
};

}  // namespace find_in_page
}  // namespace edge

#endif  // COMPONENTS_EDGE_SMART_FIND_ON_PAGE_EDGE_FIND_IN_PAGE_ENUMS_H_
