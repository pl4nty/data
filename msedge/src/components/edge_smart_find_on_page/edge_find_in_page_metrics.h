// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_SMART_FIND_ON_PAGE_EDGE_FIND_IN_PAGE_METRICS_H_
#define COMPONENTS_EDGE_SMART_FIND_ON_PAGE_EDGE_FIND_IN_PAGE_METRICS_H_

#include "base/memory/scoped_refptr.h"
#include "base/time/time.h"
#include "components/edge_smart_find_on_page/core/mojom/edge_find_on_page.mojom.h"
#include "components/edge_smart_find_on_page/edge_find_in_page_enums.h"

namespace net {
class HttpResponseHeaders;
}

namespace edge::find_in_page {

enum class EndpointType {
  kEnglish = 0,
  kUniversal,
  kNone,
};

namespace metrics {

namespace helper {

std::string BuildMetricNameForEndpoint(EndpointType endpoint_type_name,
                                       std::string metric_name_prefix);

}  // namespace helper

// When running Edge with the smart find feature enabled, we expected to have
// smart match results during the find operation. This method helps to record
// how often the find operation will found a smart match.
void RecordHasSmartMatch(bool has_smart_match);

// When showing related matches, some or all of them may be discarded because
// they cannot fit in the Find Bar container. This method will only be called
// when all the related matches have been discarded.
void RecordAllRelatedMatchesDiscarded(bool all_related_matches_discarded);

// Records the click event on a related match link.
void RecordRelatedMatchLinkClickEvent();

// Records the find bar close event.
void RecordFindBarClosedEvent();

// Records the tab switch during find session.
void RecordTabSwitchDuringFindSession();

// Records the find bar show event during each new invocation and tab switch.
void RecordFindBarUsageEventDuringNewInvocationAndTabSwitch();

// Records the find bar visibility duration before each tab switch.
void RecordFindBarVisibilityDurationBeforeTabSwitch(
    const base::TimeDelta& duration);

// Records whether the user has performed a find request before closing the find
// bar. The denominator of this metric is the number of times the find bar is
// closed, which also corresponds to the find bar invocation count(open).
void RecordHasPerformedFindRequest(bool has_typed_in_find_bar);

// Records whether the user has clicked on a contextual result during a find
// session.
void RecordContextualResultClickBySession(bool is_contextual_result_clicked);

// Records whether the user clicked on the related match shown in the find
// bar.
void RecordRelatedMatchClicked(bool is_related_match_clicked);

// Records whether exact matches was found when related matches get shown to the
// users.
void RecordRelatedMatchClickedWhileExactMatchesWasFound(
    bool is_related_match_clicked,
    bool is_exact_match_found_when_showing_related_match);

// This method helps to record how often a find operation will found at least
// one exact match.
void RecordHasExactMatch(bool has_exact_match);

// Record the duration of each call to the smart find cloud service. The
// duration is the time from the time where the request is initiated and the
// time where we receive the result.
void RecordTotalNetworkLatency(EndpointType endpoint_type,
                               const base::TimeDelta& duration);

// Records the status of a call to the smart find cloud service.
void RecordCloudServiceRequestStatus(EndpointType endpoint_type,
                                     FindInPageStatus status);

// Record the network response code of the corresponding service request.
void RecordCloudServiceHttpResponseCode(EndpointType endpoint_type,
                                        int response_code);

// Record the duration of each request on the server side. That duration is the
// time from when the request is sent to turing service and when the client
// receives the result (note: the response time may include the time to send the
// response over the network).
void RecordTuringServiceRequestDuration(EndpointType endpoint_type,
                                        const base::TimeDelta& duration);

// Records the x-turingapi-server-latency-ms network response header, which
// measures how long the server took to compute the find related matches in
// milliseconds.
void RecordTuringServiceResponseHeaders(
    EndpointType endpoint_type,
    scoped_refptr<net::HttpResponseHeaders> response_headers);

// This method helps to record the smart find toggle state during the find
// operation. But it will be recorded once for a sequence of character typed by
// the user based on the time between user keystrokes. Currently, the maximum
// delta time between keystrokes is fixed at 3 seconds (see
// edge_find_in_page_metrics.cc).
void RecordFindIncludeRelatedMatchesValue(bool include_related_matches);

// Records the number of Smart Match results for each request.
void RecordSmartMatchCount(EndpointType endpoint_type, int smart_match_count);

// Records the size of the query data for each request.
void RecordQuerySize(int query_size_in_bytes);

// Records the size of the document data for each request.
void RecordDocumentSize(int document_size_in_bytes);

// Records whether the parsing of the returned smart find result is successful.
void RecordParseResultStatus(EndpointType endpoint_type,
                             ParseResultStatus parse_result_status);

// Records the duration between the time when the user types a new character and
// when the first exact match result is painted on the screen.
void RecordExactMatchTotalTimeToFirstPaint(const base::TimeDelta& duration);

// Records the duration between the time when the user types a new character and
// when the first exact match result is painted on the screen for a given frame.
void RecordExactMatchTotalTimeToFirstPaintPerFrame(
    EndpointType endpoint_type,
    const base::TimeDelta& duration);

// Records the duration between the time when the user types a new character and
// when the first smart match result is painted on the screen.
void RecordSmartMatchTotalTimeToFirstPaint(const base::TimeDelta& duration);

// Records the duration between the time when the user types a new character and
// when the first smart match result is painted on the screen for a given frame.
void RecordSmartMatchTotalTimeToFirstPaintPerFrame(
    EndpointType endpoint_type,
    const base::TimeDelta& duration);

// Records the total time elapsed to paint all exact match results.
void RecordExactMatchTotalTimeToPaint(const base::TimeDelta& duration);

// Records the total time elapsed to paint all exact match results for a given
// frame.
void RecordExactMatchTotalTimeToPaintPerFrame(EndpointType endpoint_type,
                                              const base::TimeDelta& duration);

// Records the total time elapsed to paint all smart match results.
void RecordSmartMatchTotalTimeToPaint(const base::TimeDelta& duration);

// Records the total time elapsed to paint all smart match results for a given
// frame.
void RecordSmartMatchTotalTimeToPaintPerFrame(EndpointType endpoint_type,
                                              const base::TimeDelta& duration);

// Records the usage of the find feature. For simplicity, this histogram is
// recorded using boolean histogram by filling one bucket (true).
void RecordFindInPageUsage();

// Records the visibility time of the find bar from the time it opened until the
// time it closed.
void RecordFindBarTotalVisibilityDuration(const base::TimeDelta& duration);

// Records the find re-query. The re-query is a search term typed after some
// delay.
void RecordFindReformulation(bool is_reformulation);

// Records whenever the query results are 0.
void RecordNoResultsFound();

// Records the find re-formulation. The re-formulation is a search term typed
// after some delay that differs from the previous term.
void RecordFindReformulation();

// Records the number of smart match request sent to the turing service in a
// find session.
void RecordServiceCallsPerSessionCount(EndpointType endpoint_type,
                                       int service_calls_per_session_count);

// Records the cloud service network error, combining HTTP error code and
// Chromium network stack error code.
void RecordCloudServiceNetworkError(EndpointType endpoint_type,
                                    int network_error);

// Records the the state of various Edge only Find on Page toggles like Related
// matches, Match case, Match whole word, and Match diacritics when a Find on
// Page operation occurs.
void RecordFindOptionsTogglesUsage(EdgeFindTogglesState state);

// Records the number of times the button to expand and collapse the find
// options toggles is clicked. When `is_visible` is true, the button was clicked
// to show the find on page options toggles.
void RecordFindOptionsButtonClicked(bool is_visible);

// Records whether the toggles are expanded or collapsed when a new search is
// performed.
void RecordToggleVisibilityForNewFind(bool is_visible);

// Records whether the toggles are expanded or collapsed when searching for the
// next or previous result.
void RecordToggleVisibilityForFindNextPrevious(bool is_visible);

// Records whether the find matches cache is valid during find next/previous
// operations.
void RecordIsFindMatchesCacheValid(bool is_valid);

// Records whether a query in the queries input array to the FindTextsOnPage
// API was found on the page.
void RecordFindTextsQueryFound(bool found);

// Records the Find on page Sidebar state.
void RecordFindOnPageSidebarState(
    edge_find_on_page::mojom::ShorelineFindResultCollectionState state);

// Records Sidebar search runs on multiple processes that includes search
// in the renderer process and rendering contextual results on the Sidebar.
// The API will record search operation and Mojo timing from the browser
// entry from the Sidebar process to the browser process exit to the Sidebar.

// It does not include processing time on the Sidebar, which is also expensive
// for painting the results.
void RecordFindOnPageSidebarNextOrPrevSearchDuration(
    const base::TimeDelta& duration);
void RecordFindOnPageSidebarNewSearchDuration(const base::TimeDelta& duration);

// Records whenever the find on page sidebar is shown.
void RecordFindOnPageSidebarShown();

// Records whenever we switch from sidebar to flyout and viceversa.
void RecordSwitchFindInPageState(EdgeFindInPageSwitchState state);

// Records DOM mutation events that occur during a find session.
void RecordDOMMutationEvent();

// Records the interval between DOM mutations during a find session.
void RecordIntervalBetweenDOMMutation(
    const base::TimeDelta& interval_between_dom_mutation);

void RecordFindOnPageSidebarFCP(const base::TimeDelta& duration);

void RecordFindOnPageSidebarLCP(const base::TimeDelta& duration);

void RecordCopilotSuggestionShown();

void RecordCopilotSuggestionClicked();

// Record that we are blocking Commercial Copilot CtrlF suggestions because the
// user has the Work Tab License
void RecordCommercialSuggestionsBlockedForWorkTab();

void RecordCommercialSuggestionsLicenseCheckSucceeded(bool successful);

}  // namespace metrics
}  // namespace edge::find_in_page

#endif  // COMPONENTS_EDGE_SMART_FIND_ON_PAGE_EDGE_FIND_IN_PAGE_METRICS_H_
