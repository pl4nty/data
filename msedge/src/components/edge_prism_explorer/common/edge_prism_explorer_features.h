// Copyright (C) Microsoft Corporation. All rights reserved.

#ifndef COMPONENTS_EDGE_PRISM_EXPLORER_COMMON_EDGE_PRISM_EXPLORER_FEATURES_H_
#define COMPONENTS_EDGE_PRISM_EXPLORER_COMMON_EDGE_PRISM_EXPLORER_FEATURES_H_

#include "base/component_export.h"
#include "base/feature_list.h"
#include "base/metrics/field_trial_params.h"

namespace edge_prism_explorer {
namespace features {

// Enables the on-hover and context menu entry points for Bing insights on
// images.
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kEdgePrismExplorer);

// TODO(task.ms/56284167): Move this feature flag to separate file.
// Enables the video overlay feature.
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kPrismVideoOverlayLookup);
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
extern bool IsPrismVideoOverlayLookupEnabled();

// Enables the on-hover and context menu entry points for Bing insights on
// images by opening the "search in sidebar" pane.
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kOnHoverSearchInSidebar);
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
extern bool IsOnHoverSearchInSidebarEnabled();

COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kEnableImageHoverMenu);
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
extern bool IsImageHoverMenuEnabled();

COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kHoverOverImage);

COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kAutoHideImageHoverMenu);

// Disables checking urls for the Prism Explorer on hover buttons
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kEnablePrismExplorerOnHoverForAllUrls);

COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kEnablePrismExplorerAutoPosition);

// Disables checking urls for the Prism Explorer on hover buttons
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kDisableExplorerIframeCSP);

// If enabled domain actions for the Prism Explorer will be parsed and applied
// to the relevant domain
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kPrismExplorerDomainActions);
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
extern bool ArePrismExplorerDomainActionsEnabled();

// Enables the Prism 3 button.
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kEnablePrismExplorerThreeButtonsUI);
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
extern bool ShouldEnablePrismExplorerThreeButtonsUI();

// Enables save control in Prism 3 button.
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kEnablePrismSaveControl);
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
extern bool IsPrismSaveControlEnabled();

// Show visual search as first icon in 3 buttons.
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kVisualSeachFirstIcon);
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
extern bool ShowVisualSeachAsFirstIcon();

// New setting for smart explore
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kEnablePrismExplorerNewSettings);
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
extern bool IsPrismExplorerNewSettingsEnabled();

// Configure minumum image size to invoke prism button
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kSetMinImageSize);
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
extern bool IsEnabledSetMinImageSize();

// Do not close flyout when deactivate for inspecting use.
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kKeepFlyoutForInspect);
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
extern bool ShouldKeepFlyoutForInspect();

// Configure save control url for development.
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kSetSaveControlURL);
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
extern bool ShouldSetSaveControlURL();

// If enabled, triggering exclusion bloom filter will be applied to the relevant
// domain/host.
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kPrismExplorerTriggeringExclusionList);
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
extern bool IsPrismExplorerTriggeringExclusionListEnabled();

// If enabled, prism explorer uses image tree to find the image element under
// given point.
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kPrismExplorerUseImageTree);

// If enabled, prism explorer uses penetrating hit test to find the image
// element under given point.
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kPrismExplorerUseImageHitTest);

// If enabled, prism explorer uses caching for image lookup.
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kPrismExplorerImageLookupCaching);

// If enabled, mouse move events are passed to PrismExplorerOnHoverController on
// hover event. By default the hover delay is 200ms and can be configured using
// the param to this feature. If disabled, mouse move events are immediately
// passed to PrismExplorerOnHoverController.
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kPrismExplorerUseMouseHover);
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
extern const base::FeatureParam<int> kPrismExplorerMouseHoverDelay;

COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kPrismImageLookupTrigger);

COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kPrismImageOverlayLookupTrigger);

// If enabled, re-use the cache created while lookup for prism button
// positioning.
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kPrismReuseLookupCacheInPositioning);

COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kContextMenuSendImageToCopilot);

COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kHoverButtonSendImageToCopilot);

COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
BASE_DECLARE_FEATURE(kHoverButtonSendImageToCopilotIconType);
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
extern bool IsHoverButtonSendImageToCopilotIconTypeEnabled();
COMPONENT_EXPORT(EDGE_PRISM_EXPLORER_FEATURES)
extern int GetSendImageToCopilotIconType();

}  // namespace features
}  // namespace edge_prism_explorer

#endif  // COMPONENTS_EDGE_PRISM_EXPLORER_COMMON_EDGE_PRISM_EXPLORER_FEATURES_H_
