// Copyright (C) Microsoft Corporation. All rights reserved.

#ifndef COMPONENTS_EDGE_PRISM_EXPLORER_COMMON_EDGE_PRISM_EXPLORER_METRICS_H_
#define COMPONENTS_EDGE_PRISM_EXPLORER_COMMON_EDGE_PRISM_EXPLORER_METRICS_H_

#include "base/time/time.h"

namespace edge_prism_explorer {
namespace metrics {

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with "Microsoft.PrismExplorerOnHover.RendererEvents"
// in src/tools/metrics/histograms/edge_enums.xml.
// Entries with **Overlay** suffix are related to image having overlay.
enum class PrismExplorerOnHoverRendererEvents {
  kHoverButton = 0,
  kHoverEligibleImage = 1,
  kDomainActionsFetchedAsync = 2,
  kHTMLImageElementUpdateScheduled = 3,
  kNoBrowserInterfaceBroker = 4,
  kHoverButtonClicked = 5,
  kHoverEligibleImageInSubIFrame = 6,
  kHoverEligibleImageOverlay = 7,
  kHoverEligibleImageInSubIFrameOverlay = 8,
  kHoverButtonClickedOverlay = 9,
  kImageLookup = 10,
  kImageLookupOverlay = 11,
  kMaxValue = kImageLookupOverlay,
};

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with
// "Microsoft.PrismThreeButtonLayout.UsageEvents" in
// src/tools/metrics/histograms/edge_enums.xml.
// Entries with **Overlay** suffix are related to image having overlay.
enum class PrismThreeButtonLayoutUsageEvents {
  kShowPrismButton = 0,
  kSaveControlEngagement = 1,
  kVisualSearchFlyoutAbandonment = 2,
  kSmartExploreDisable = 3,
  kVisualSearchIconHover = 4,
  kSmartExploreDisableAlways = 5,
  kOpenSettingPage = 6,
  kSendFeedback = 7,
  kVisualSearchClickTwoButton = 8,
  kSettingClick = 9,
  kSaveControlLoadFail = 10,
  kVisualSearchLoadFail = 11,
  kVisualSearchClickThreeButton = 12,
  kSaveControlHover = 13,
  kVisualSearchClickTwoButtonOverlay = 14,
  kVisualSearchClickThreeButtonOverlay = 15,
  kMaxValue = kVisualSearchClickThreeButtonOverlay,
};

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with
// "Microsoft.PrismSmartExplorer.SaveControlFlyoutEvents" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class PrismSaveControlFlyoutEvents {
  kSaveItem = 0,
  kDeleteItem,
  kCreateCollection,
  kClickLinkToOpenCollection,
  kSavedInCollectionsCount,
  kUserCollectionsCount,
  kUnableToSave,
  kMaxValue = kUnableToSave,
};

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with
// "Microsoft.PrismSmartExplorerFeedback.FeedbackEvents" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class PrismSmartExplorerFeedbackEvents {
  kLikeIt = 0,
  kFeaturesNotUseful = 1,
  kDoesNotShowUpConsistently = 2,
  kTookTooLongToLoad = 3,
  kTooIntrusive = 4,
  kNothingHappensWhenClickButtons = 5,
  kOther = 6,
  kMaxValue = kOther,
};

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with
// "Microsoft.PrismSmartExplorerFeedback.FeedbackEvents" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class ImageAskCopilotAction {
  kContextMenuCopilotIconClick = 0,
  kContextMenuVisualSearchIconClick = 1,
  kHoverMenuCopilotIconClick = 2,
  kHoverMenuVisualSearchIconClick = 3,
  kMaxValue = kHoverMenuVisualSearchIconClick,
};

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with
// "Microsoft.RenderViewContextMenuItem" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class AskCopilotImageAction {
  kContextMenuWithVisualSearchNotDirectSend = 0,
  kContextMenuWithoutVisualSearchNotDirectSend = 1,
  kContextMenuWithVisualSearchDirectSend = 2,
  kContextMenuWithoutVisualSearchDirectSend = 3,
  kMaxValue = kContextMenuWithoutVisualSearchDirectSend,
};

// Please keep in sync with
// "Microsoft.PrismExplorer.CleanupEligible.Reason" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class CleanupEligibleReason {
  kNoUsageGT28d = 0,
  kUsedVisualSearch28dAgo = 1,
  kUsedSaveControl28dAgo = 2,
  kUsedEditImage28dAgo = 3,
  kUsedMagnifyImage28dAgo = 4,
  kUserExplicitlyDislike = 5,
  kMaxValue = kUserExplicitlyDislike,
};

// Please keep in sync with
// "Microsoft.PrismExplorer.CleanupNotEligible.Reason" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class CleanupNotEligibleReason {
  kNoUsageButLE28d = 0,
  kUsedVisualSearch = 1,
  kUsedSaveControl = 2,
  kUsedEditImage = 3,
  kUsedMagnifyImage = 4,
  kUserExplicitlyEnable = 5,
  kMaxValue = kUserExplicitlyEnable,
};

// Please keep in sync with
// "Microsoft.PrismExplorer.CleanupImpact.Type" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class CleanupImpactType {
  kNone = 0,  // Not used, to align with suppressed_action default value 0
  kVisualSearch = 1,
  kSaveControl = 2,
  kEditImage = 3,
  kMagnifyImage = 4,
  kMaxValue = kMagnifyImage,
};

// Please keep in sync with
// "Microsoft.PrismExplorer.CleanupAutoHide.Result" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class CleanupAutoHideResult {
  kSyncHide = 0,     // Auto hide on another device and state synced to this
  kNoUsageHide = 1,  // Auto hide when no usage > 28d
  kDislikeHide = 2,  // Auto hide when user explicitly dislike
  kNotRun = 3,       // Not run auto hide
  kMaxValue = kNotRun,
};

void RecordPrismExplorerOnHoverRendererEvent(
    PrismExplorerOnHoverRendererEvents event);

void RecordPrismThreeButtonLayoutUsageEvents(
    PrismThreeButtonLayoutUsageEvents event);

void RecordPrismExplorerFeedbackEvents(PrismSmartExplorerFeedbackEvents event);

void RecordSaveControlFlyoutEvents(PrismSaveControlFlyoutEvents event);

void RecordSaveControlShowFlyoutDuration(base::TimeDelta delta);

void RecordSaveControlFlyoutCreateTime(base::TimeDelta delta);

void RecordSaveControlIframeLoadTime(base::TimeDelta delta);

void RecordSaveControlFlyoutStartRenderingTime(base::TimeDelta delta);

void RecordImageAckCopilotAction(ImageAskCopilotAction action);

void RecordAskCopilotImageAction(AskCopilotImageAction action);

void RecordCleanupEligibleReason(CleanupEligibleReason reason);

void RecordCleanupNotEligibleReason(CleanupNotEligibleReason reason);

void RecordCleanupImpactType(CleanupImpactType type);

void RecordCleanupAutoHideResult(CleanupAutoHideResult result);

} // namespace metrics
} // namespace edge_prism_explorer

#endif  // COMPONENTS_EDGE_PRISM_EXPLORER_COMMON_EDGE_PRISM_EXPLORER_METRICS_H_
