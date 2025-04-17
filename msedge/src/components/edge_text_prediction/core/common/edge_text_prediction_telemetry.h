// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_TEXT_PREDICTION_CORE_COMMON_EDGE_TEXT_PREDICTION_TELEMETRY_H_
#define COMPONENTS_EDGE_TEXT_PREDICTION_CORE_COMMON_EDGE_TEXT_PREDICTION_TELEMETRY_H_

#include <stddef.h>

#include "base/time/time.h"
#include "services/metrics/public/cpp/ukm_source_id.h"
#include "url/gurl.h"

namespace ukm {
class UkmRecorder;
}

namespace edge {
namespace text_prediction {

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with "Microsoft.TextPrediction.Editor.EditReasonEnum"
// in src/tools/metrics/histograms/edge_enums.xml.
enum class EditReason {
  kFromCommand = 0,
  kFromComposition = 1,
  kFromUserInput = 2,
  kMaxValue = kFromUserInput
};

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with
// "Microsoft.TextPrediction.TextPredictionError" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class TextPredictionError {
  kSuccessPredictionParsed = 0,
  kFailureUnableToParse = 1,
  kSuccessNoPrediction = 2,
  kFailureNoPredictionText = 3,
  kFailureURLRequestNoResponseInfo = 4,
  kFailureURLRequestNoResponseHeader = 5,
  kFailureURLRequestResponseNot200 = 6,
  kFailureURLRequestResponseBodyEmpty = 7,
  kMaxValue = kFailureURLRequestResponseBodyEmpty
};

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with "Microsoft.TextPrediction.TextPredictionLength"
// in src/tools/metrics/histograms/edge_enums.xml.
enum class TextPredictionLength {
  // Between [1, 10] characters of the text prediction length.
  kShort = 0,
  // Between [11, 15] characters of the text prediction length.
  kMedium = 1,
  // Greater-than 15 characters of the text prediction length.
  kLong = 2,
  kMaxValue = kLong
};

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with "Microsoft.TextPrediction.TextPredictionAcceptType"
// in src/tools/metrics/histograms/edge_enums.xml.
enum class TextPredictionAcceptType {
  kTab = 0,
  kArrowRight = 1,
  kMaxValue = kArrowRight
};

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused. Please keep in sync with
// "Microsoft.TextPrediction.TextPredictionDismissedType" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class TextPredictionDismissedType {
  // The Document has been removed. e.g., Browser/Tab closed, iframe removed.
  kDocumentRemoved = 0,
  // The Root Editable Element is no longer eligible for text prediction.
  // e.g., No longer editable, spellcheck="true"
  kNodeIneligible = 1,
  // The Root Editable Element has been removed from the document.
  kNodeRemoved = 2,
  // Focus has changed to be no longer valid for the existing text prediction.
  kFocusChanged = 3,
  // Selection has changed to be no longer valid. e.g., Mouse or Arrow Key moved
  // the caret to another location within the same editable field.
  kSelectionChanged = 4,
  // The text following the editing caret matches what has been predicted, so
  // the prediction has been dismissed.
  kSubsequentTextMatches = 5,
  kMaxValue = kSubsequentTextMatches
};

// The name of the histogram that keeps a count of the paste entry points.
extern const char kEditReasonHistogram[];

// The name of the histogram that reports end to end latency cost that the user
// has experienced, from when a keypress issues a text prediction request, to
// the first time it affects layout.
extern const char kLatencyEndToEnd[];

// The name of the histogram that reports latency cost from remote processing.
// This value is reported by the remote Turing service in the response header.
extern const char kLatencyFromRemoteProcessing[];

// The name of the histogram that keeps a count of the number of characters
// accepted by the user, excluding type-through characters.
extern const char kNumberOfCharactersAcceptedCount[];

// The name of the histogram that keeps a count of the number of characters
// the user either accepted or typed-through.
extern const char kNumberOfCharactersMatchedCount[];

// The name of the histogram that keeps a count of the number of characters
// received from the remote Turing service.
extern const char kNumberOfCharactersReceivedCount[];

// The name of the histogram that keeps a count of the number of characters
// rendered for a text prediction, logged only the first time the prediction
// is presented to the user.
extern const char kNumberOfCharactersRenderedCount[];

// The name of the histogram that keeps a count of the number of times a text
// prediction is accepted, categorized by the length of the prediction.
extern const char kNumberOfPredictionsAcceptedLength[];

// The name of the histogram that keeps a count of the number of times a text
// prediction is dismissed after being presented to the user, categorized by
// the reason the prediction was dismissed.
extern const char kNumberOfPredictionsDismissedAfterLayout[];

// The name of the histogram that keeps a count of the number of times a text
// prediction is dismissed before being presented to the user, categorized by
// the reason the prediction was dismissed.
extern const char kNumberOfPredictionsDismissedBeforeLayout[];

// The name of the histogram that keeps a count of the number of Turing service
// requests that have been discarded before being presented to the user.
extern const char kNumberOfPredictionsNotRendered[];

// The name of the histogram that keeps a count of the number of times a text
// prediction is accepted, categorized by the method of acceptance.
extern const char kNumberOfPredictionsAcceptedType[];

// The name of the histogram that keeps a count of the number of times a text
// prediction is rejected, categorized by the length of the prediction.
extern const char kNumberOfPredictionsRejectedLength[];

// The name of the histogram that keeps a count of the number of Turing service
// requests that have been presented to the user.
extern const char kNumberOfPredictionsRenderedLength[];

// The name of the histogram that keeps a count of the number of times a text
// prediction has been typed through completely, categorized by the length of
// the prediction.
extern const char kNumberOfPredictionsTypedThroughLength[];

// The number of unaccepted predictions before a prediction was accepted.
extern const char kNumberOfUnacceptedPredictionsBeforeAcceptCount[];

// The number of unaccepted predictions  before a prediction was dismissed.
extern const char kNumberOfUnacceptedPredictionsBeforeDismissedCount[];

// The name of the histogram that keeps a count of the number of Turing service
// requests that returned with results.
extern const char kRequestReceivedCount[];

// The name of the histogram that tracks the response code of Turing service
// requests receieved.
extern const char kResponseCodeReceived[];

// The name of the histogram that keeps a count of the number of Turing service
// requests made.
extern const char kNumberOfRequestsSent[];

// The name of the histogram that tracks whether or not the primary language the
// user has set is supported, recorded each time a text prediction request would
// have been issued.
extern const char kPrimaryLanguageSupportedAtRequestTime[];

// The name of the histogram that tracks the text prediction request size.
extern const char kRequestSizeInBytes[];

// The name of the histogram that tracks the text prediction response size.
extern const char kResponseSizeInBytes[];

// The name of the histogram that tracks the amount of time taken to extract
// the previously-typed text sent to the prediction service.
extern const char kContentExtractionTime[];

// The name of the histogram that tracks the parsing status from the response
// returned by the Turing service during Text Prediction along with any error
// information about the response.
extern const char kResponseStatus[];

// Log |reason| to |kEditReasonHistogram|.
void LogEditReason(EditReason reason);

// Log whether or not the primary language is supported at this time.
void LogPrimaryLanguageSupported(bool supported);

TextPredictionLength ToTextPredictionLength(size_t length);

class TextPredictionTelemetry {
 public:
  // Log when a text prediction has been accepted by the user and inserted.
  static void LogTextPredictionAccepted(const std::string& locale,
                                        ukm::SourceId source_id,
                                        ukm::UkmRecorder* ukm_recorder,
                                        TextPredictionAcceptType accept_type,
                                        size_t normalized_length,
                                        size_t accepted_length,
                                        size_t prior_unaccepted_predictions);

  // Characters matched is the sum of type-through and accepted characters,
  // therefore accepting a prediction should report the normalized length.
  // This should be logged when:
  // 1) The user accepts a text prediction.
  // 2) The user completes a type-through.
  // 3) The user rejects a prediction explicitly by pressing the Escape key.
  // 4) The user rejects a prediction implicitly by diverging from the
  // prediction.
  static void LogTextPredictionCharactersMatched(const std::string& locale,
                                                 size_t matched_length);

  // Log when a text prediction has been dismissed in a way that can't be
  // interpreted as the user actively rejecting the prediction.
  // For example, the containing document being shutdown, the root editable
  // element losing eligibility to host text predictions, or changes in either
  // selection or element focus that prevents text prediction from displaying.
  static void LogTextPredictionDismissed(const std::string& locale,
                                         ukm::SourceId source_id,
                                         ukm::UkmRecorder* ukm_recorder,
                                         bool has_attached_layout_at_least_once,
                                         TextPredictionDismissedType reason,
                                         size_t prior_unaccepted_predictions);

  // Log when a text prediction has completed successfully, the first time it
  // has an effect on Layout.
  static void LogTextPredictionLatency(const std::string& locale,
                                       const base::TimeDelta& local,
                                       const base::TimeDelta& remote);

  // Log when a text prediction has been discarded before being presented to the
  // user at least once.
  static void LogTextPredictionNotRendered(const std::string& locale);

  // Log when a text prediction has been discarded by the user, either when the
  // user types something that deviates from the prediction or if they
  // explicitly dismiss the prediction with the Escape key.
  static void LogTextPredictionRejected(const std::string& locale,
                                        ukm::SourceId source_id,
                                        ukm::UkmRecorder* ukm_recorder,
                                        size_t normalized_length);

  // Log when a text prediction has been rendered at least once.
  static void LogTextPredictionRendered(const std::string& locale,
                                        ukm::SourceId source_id,
                                        ukm::UkmRecorder* ukm_recorder,
                                        size_t normalized_length);

  // Log when a text prediction request that was sent to the Turing service
  // returned with results.
  static void LogTextPredictionRequestReceived(const std::string& locale,
                                               TextPredictionError error_code,
                                               size_t received_length);

  // Log when a text prediction request that was sent to the Turing service
  // returned with response code.
  static void LogTextPredictionRequestResponseCode(int response_code);

  // Log when a text prediction request was sent to the Turing service.
  static void LogTextPredictionRequestSent(const std::string& locale,
                                           bool request_sent);

  // Log when a text prediction has been typed-through completely by the user.
  // i.e., The user has typed the same content as the prediction.
  static void LogTextPredictionTypedThrough(const std::string& locale,
                                            ukm::SourceId source_id,
                                            ukm::UkmRecorder* ukm_recorder,
                                            size_t normalized_length);

  static void LogTextPredictionTypingSessionEnded(
      const std::string& locale,
      size_t prior_unaccepted_predictions);

  // Log whether text prediction is enabled for an editable, user-focused
  // element by checking for relevant attributes (e.g. 'textprediction',
  // 'autocorrect', 'spellcheck').
  static void LogIsTextPredictionEnabled(ukm::UkmRecorder* ukm_recorder,
                                         const GURL& url,
                                         bool is_enabled);

  // Logs the parsing status from the response returned by the Turing service
  // during Text Prediction along with any error information about the response.
  static void LogTextPredictionResponseStatus(TextPredictionError error_code);

  // Convert the system locale string to Edge accept lanauge code. This is for
  // test only.
  static const char* ToMicrosoftLocaleVariantForTest(
      const std::string& locale_string);
};

}  // namespace text_prediction
}  // namespace edge
#endif  // COMPONENTS_EDGE_TEXT_PREDICTION_CORE_COMMON_EDGE_TEXT_PREDICTION_TELEMETRY_H_
