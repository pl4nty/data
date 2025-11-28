// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "base/component_export.h"
#include "base/feature_list.h"
#include "base/metrics/field_trial_params.h"
#include "build/build_config.h"

#ifndef CHROME_BROWSER_EDGE_UI_BASE_FEATURES_H_
#define CHROME_BROWSER_EDGE_UI_BASE_FEATURES_H_

// Keep in alphabetical order to reduce chances of merge conflicts.

namespace features {

// If enabled, address bar/omnibox can be made readonly using
// |AddressBarEditingEnabled| policy.
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kAddressBarReadonly);
COMPONENT_EXPORT(UI_BASE_FEATURES) bool IsAddressBarReadonlyFeatureAllowed();


// If enabled, link preview will be generated when link is copied from within
// the page.
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kEdgeLinkPreviewInPage);
COMPONENT_EXPORT(UI_BASE_FEATURES) bool IsClipboardReadWriteErrorDetailsLogEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES) bool IsLinkPreviewInPageEnabled();

// If enabled, add an explicit entry point "Copy Link Preview" to right click
// context menu for both omnibox and in-page links.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeLinkPreviewExplicitEntryPoint);

COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeMarqueeSelectUseCustomCursor);
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kEdgeWebCapture);
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeCaptureSelectionInPDF);
COMPONENT_EXPORT(UI_BASE_FEATURES) bool IsAreaSelectionEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
bool IsMarqueeSelectCustomCursorEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
bool IsWebCaptureEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
bool IsCaptureSelectionInPDFEnabled();

// If enabled, excludes sidebar search features in PWA contexts.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kExcludeSidebarSearchInPwa);
COMPONENT_EXPORT(UI_BASE_FEATURES)
bool IsExcludeSidebarSearchInPwaEnabled();

// If enabled, Edge shortcuts are given an App id that is different from that
// used by Chrome, to prevent an Edge shortcut from being hidden in the Start
// Menu if a Chrome shortcut for the same page already exists.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kShortcutsUseDifferentAppId);

#if BUILDFLAG(IS_WIN)
// If enabled, Edge can send badge update to secondary tiles
// otherwise Edge can not send badge update to secondary tiles.
COMPONENT_EXPORT(UI_BASE_FEATURES)
bool IsBadgingEnabled();

COMPONENT_EXPORT(UI_BASE_FEATURES)
bool IsBadgeOnSecondaryTileEnabled();

COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEnableVoiceTypingContextMenu);
#endif  // BUILDFLAG(IS_WIN)

// If your feature flag is Edge branding specific or otherwise unique to Edge,
// use the following edge namespace. Otherwise, define your feature flag above.
// https://aka.ms/edgefx/ffwiki
namespace edge {

// Turns on completed controls
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kFluentControls);
COMPONENT_EXPORT(UI_BASE_FEATURES) bool IsControlsFluentStyleEnabled();

// If enabled, browser fullscreen will have ShyUI dropdown.
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kEnableShyUI);
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kSwipeToShyUi);

COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kAllowPictureInPicture);

// If enabled, shows a floating button overlaid on supported videos.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kShowPictureInPictureOverlay);

// Start using messages received from Blink instead of injected JS for PIP
// overlayfeature.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kPIPOverlayBlinkBackend);

// Enable PIP invocation using media session api.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kPictureInPictureMediaSession);

COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kSwitchToLastActiveTab);

// If enabled, showing the favorites bar on the NTP is a separate setting.
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kFavoritesBarNTP);

// If enabled, show feedback smile button on toolbar UI for stable channel.
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kFeedbackSmileButton);
COMPONENT_EXPORT(UI_BASE_FEATURES) bool IsFeedbackSmileButtonEnabled();

// If enabled, context menus will display and enable Generate Passwords
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kGeneratePassword);

// If enabled, focus ring will be visible when using keyboard and
// not visible when using mouse.
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kKeyboardFocusRing);

// If enabled, adds a sidebar search menu item to the context menu.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kSidebarSearchAfterSearchWebFor);
COMPONENT_EXPORT(UI_BASE_FEATURES)
bool IsSidebarSearchAfterSearchWebForEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kOpenSearchWebForInSidebar);
COMPONENT_EXPORT(UI_BASE_FEATURES)
bool IsOpenSearchWebForInSidebarEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)

// If enabled, adds a sidebar search for image menu item to the context menu.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kSidebarSearchForImageAfterSearchWebFor);
COMPONENT_EXPORT(UI_BASE_FEATURES)
bool IsSidebarSearchForImageAfterSearchWebForEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)

// Fires when sidebar search menu is added to the context menu.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kSidebarSearchShownInContextMenu);

// Fires when sidebar search for image is added to the context menu.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kSidebarSearchForImageShownInContextMenu);

// Fires when sidebar search is opened.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kSidebarSearchOpened);

// Trigger fired when the pref kPhoenixRoundedFrameEnabled is disabled from LAF
// toggle on settings page.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kPhoenixRoundedFrameDisabledTrigger);

// Trigger flag for Mica.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kVisualRejuvMicaTrigger);

// If enabled, adds the reactive search view that's used by dictionary, sidebar
// search and other future search features.
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kReactiveSearch);
COMPONENT_EXPORT(UI_BASE_FEATURES) bool IsReactiveSearchEnabled();

// If enabled, show address bar in sidebar view.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kReactiveSearchWithAddressbar);
COMPONENT_EXPORT(UI_BASE_FEATURES) bool IsReactiveSearchAddressbarEnabled();

// If enabled, the "Try the new look and feel" toggle in
// edge://settings/appearance will be removed.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kRemoveTryNewLAFToggle);
COMPONENT_EXPORT(UI_BASE_FEATURES)
bool IsRemoveTryNewLAFToggleEnabled();

// Enum for kRemoveTryNewLAFToggle treatment configuration
enum class RemoveTryNewLAFToggleTreatment : int {
  kDefault = 0,      // Control: original behavior
  kFullPhoenix = 1,  // Treatment A: Remove toggle, force enables full Phoenix
  kPartialPhoenix = 2,  // Treatment B: Keep toggle visible, enable Phoenix UX
                        // except for web contents rounded corners
};

// Get the treatment configuration for kRemoveTryNewLAFToggle
COMPONENT_EXPORT(UI_BASE_FEATURES)
RemoveTryNewLAFToggleTreatment GetRemoveTryNewLAFToggleTreatment();

// Treatment A: Remove toggle completely and force-enable all Phoenix
// experiences
COMPONENT_EXPORT(UI_BASE_FEATURES)
bool IsFullPhoenixEnabledWithoutToggle();

// Treatment B: Keep toggle visible but not only web contents rounded corners
// will be gated by the toggle, all other Phoenix experiences will be enabled
// by default regardless of the toggle state.
COMPONENT_EXPORT(UI_BASE_FEATURES)
bool IsLimitedPhoenixEnabledWithToggle();

// If enabled, launch a new SERP backround tab to accompany any windows
// searches.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEnhancedWindowsSearchOpenTab);
COMPONENT_EXPORT(UI_BASE_FEATURES)
bool IsEnhancedWindowsSearchOpenTabEnabled(bool trigger_usage = false);

// If enabled, a new button will show as a new tool
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kContextCardPageInsights);

// Used to enable the Compose inline bubble.
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kEdgeComposeNext);
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeComposeInlineStartWriting);
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeComposeInlineMiniMenu);
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeComposeInlineNewUX);
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeComposeInlineMonotoneWithTooltip);
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeComposeInlineRewriteContextMenuEntry);
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeComposeInlineRewriteMouseSelectionEntry);
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeComposeInlineRewriteKeyboardSelectionEntry);
COMPONENT_EXPORT(UI_BASE_FEATURES)
bool IsEdgeComposeInlineMonotoneWithTooltipEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeComposeInlineTooltipAsDialog);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern int GetMinNumWordsForRewrite();
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeComposeInlineConsentUX);
// Checks if the main Compose flag kEdgeComposeNext is enabled before checking
// for a specific Compose feature flag. Doesn't trigger kEdgeComposeNext usage,
// only the feature to check.
COMPONENT_EXPORT(UI_BASE_FEATURES)
bool IsEdgeComposeInlineFeatureEnabled(const base::Feature& feature,
                                       bool trigger_usage_on_check = false);

// If enabled, spellcheck menus will be enabled
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kSpellCheck);

// If enabled, spellcheck menus will display language options
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kSpellCheckLanguageOptions);

#if BUILDFLAG(IS_APPLE)
// If enabled, touchbar Ring0 With only Search bar is shown for single tab case
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kTouchbarRing0WithSearch);
#endif

// Supports command line enabling of high contrast controls for PiP
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kHighContrastForPip);

// If enabled, will show the new PIP views.
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kEdgePipAdvanced);

// If enabled, domain actions for Enhanced Copy Paste will be parsed and applied
// to the relevant domains.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeShareEnhancedCopyPasteDomainActions);

// Controls the share feature entry point on context menu.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeShareOnContextMenu);

// If enabled, educational UI about the possible URL paste formats will be shown
// at an appropriate time.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeSharePastePrefsAwarenessUI);

// If enabled, copying the URL of a tab from the omnibox will lead to additional
// representations being written to the clipboard. These representations are
// available for pasting through the "Paste as" menu.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeSharePrimaryEnhancedCopyPaste);

// If enabled, copying URLs that don't match an existing tab will also lead to
// additional representations being written to the clipboard. To get extra info
// about such URLs, e.g. the title of the page they point to, an invisible tab
// will have to be created and the target URL navigated to.
//
// Secondary ECP is commonly referred to as in-page ECP, because these URLs tend
// to be found inside a web-page.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeShareSecondaryEnhancedCopyPaste);

// Controls the default state of windows share launch
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kWindowsShare);

// Controls the default state of windows share launch across all windows
// versions
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kShareCoherence);

COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kToolbarMoreMenuButtonsEnabled);

// Enable quick search mini menu in website.
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kWebOOUI);
// Enable quick search mini menu in childe frame.
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kWebOOUIInChildFrame);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsWebOOUIInChildFrameEnabled();

// If enabled, the panels refresh rate boosts up 2x (on VRR capable displays
// that have a supporting driver).
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kRefreshRateBoostOnScroll);
COMPONENT_EXPORT(UI_BASE_FEATURES) extern bool RefreshRateBoostOnScroll();

// kRefreshRateBoostOnScroll should only be enabled on Windows 11 and newer
// versions (since it depends on certain new OS APIs). However, since our lab
// VMs are still Windows 10 based, the feature will be untestable. To avoid
// this, we add another (temp) flag that will enable all codepaths for test (see
// RefreshRateBoostOnScroll()). This flag will never be exposed via about:flags
// or used in any CFR and should be deleted when lab VMs move to Windows 11.
// Tracked via (ADO: 37711317).
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kRefreshRateBoostOnScrollOverride);

// Enables Touch Mode settings and sets TouchUiController to auto by default.
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kTouchMode);
COMPONENT_EXPORT(UI_BASE_FEATURES) extern bool IsTouchModeEnabled();

enum class VisualRejuvControlsConfig {
  kDefault = 0,
  kForceOff = 1,
  kForceOn = 2,
};

// If enabled, exposes destabilizing refactors in UI infrastructure needed for
// integration with performance driven gating.
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kVisualRejuv);
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kVisualRejuvControls);
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kVisualRejuvMenuFontSize);
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kVisualRejuvVerticalTabs);
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kVisualRejuvRounding);
// If activated, infobar will not split SidePane and toolbar. It will stay above
// content. Also removes the separator line between sidebar and toolbar.
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kVisualRejuvSidePane);
COMPONENT_EXPORT(UI_BASE_FEATURES) BASE_DECLARE_FEATURE(kVisualRejuvMica);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsVisualRejuvMicaEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kVisualRejuvMicaInShoreline);
COMPONENT_EXPORT(UI_BASE_FEATURES) extern bool IsVisualRejuvEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern VisualRejuvControlsConfig GetVisualRejuvControlsConfig();
COMPONENT_EXPORT(UI_BASE_FEATURES) extern bool IsVisualRejuvMaterialsEnabled();

#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsCentralizedPhoenixTokenPipelineEnabled();
#endif  // BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)

COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kSemanticNonColorTokenCentralized);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsCentralizedPhoenixNonColorTokenPipelineEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern const base::FeatureParam<bool> kSemanticNonColorTokensForP2Surfaces;
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsSemanticNonColorTokensForP2SurfacesEnabled();

// Enum for MAI design system theme configuration
enum class SemanticTheme : int {
  kPhoenix = 0,         // MAI phoenix design system (default)
  kCompactNeutral = 1,  // MAI compact-neutral design system
  kCompactThemed = 2,   // MAI compact-themed design system
  kDefault = 3,         // MAI default design system
};
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kMaiDesignSystem);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsMAIDesignSystemEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
SemanticTheme GetMaiDesignSystemTheme();
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsMAIPhoenixDesignSystemEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsMAICompactNeutralDesignSystemEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsMAICompactThemedDesignSystemEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsMAIDefaultDesignSystemEnabled();

// This is a helper util which gates the infra for runtime token injection in
// html templates used in WebUI.
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsWebUIRunTimeTokenInjectionEnabled();

COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsVisualRejuvMenuFontSizeEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsVisualRejuvVerticalTabsEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsVisualRejuvSidePaneEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsVisualRejuvShowSettingsEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsVisualRejuvMicaInShorelineEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsVisualRejuvMicaEnabledInCentralContainer();

COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kMacFrostedGlassVisualEffect);
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kMacFrostedGlassVisualEffectTrigger);
// if enabled, frosted glass visual effect will be shown in Edge Mac Window.
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsMacFrostedGlassVisualEffectEnabled();
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern const base::FeatureParam<int> kMacFrostedGlassVisualEffectDelayMs;
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern int GetMacFrostedGlassVisualEffectDelayMs();

COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kMacFrostedGlassVisualEffectHorizontalTab);
// if enabled, frosted glass visual effect will be applied for horizontal tab.
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsMacFrostedGlassVisualEffectHorizontalTabEnabled();

COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kMacFrostedGlassVisualEffectHubAppTower);
// if enabled, frosted glass visual effect will be applied for hub app tower.
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsMacFrostedGlassVisualEffectHubAppTowerEnabled();

COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kMacFrostedGlassVisualEffectBookmarkBar);
// if enabled, frosted glass visual effect will be applied for bookmark bar.
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsMacFrostedGlassVisualEffectBookmarkBarEnabled();

// If enabled, the ring 0 icons will look minimal and more compact.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kVisualRefreshRingZeroIcons);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsVisualRefreshRingZeroIconsEnabled(bool trigger_usage = false);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern const base::FeatureParam<bool> kFavBarVisualRefreshEnabledParam;
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsFavBarVisualRefreshEnabled();

// Visual Refresh Ring Zero Triggers
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kFavBarVisualRefreshTrigger);
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kVisualRefreshRingZeroNormalModeTrigger);

// Toolbar Button Count Triggers
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kToolbarButtonCountLE6);
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kToolbarButtonCountGT6LE9);
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kToolbarButtonCountGT9LE13);
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kToolbarButtonCountGT13);

// Boolean value to check if user is seeing Touch UI on the screen, will be
// updated by TouchUiController.
extern bool is_touch_ui_;
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern void SetTouchModeEnabled(bool is_touch_ui);

// Look and feel feature holdout feature group.
BASE_DECLARE_FIRST_RUN_FEATURE(kFeatureGroupLookAndFeelHoldout);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsEnabledFeatureGroupLookAndFeelHoldout(
    const base::Feature& feature,
    bool trigger_usage_on_check = false);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern void TriggerUsageFeatureGroupLookAndFeelHoldout(
    const base::Feature& feature);

// Revisitation feature holdout feature group.
BASE_DECLARE_FIRST_RUN_FEATURE(kFeatureGroupRevisitationHoldout);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsEnabledFeatureGroupRevisitationHoldout(
    const base::Feature& feature,
    bool trigger_usage_on_check = false);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern void TriggerUsageFeatureGroupRevisitationHoldout(
    const base::Feature& feature);

// EdgeMT Holdout Feature Flags and Triggers.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FIRST_RUN_FEATURE(kFeatureGroupEdgeMTHoldout);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsEnabledFeatureGroupEdgeMTHoldout(
    const base::Feature& feature,
    bool trigger_usage_on_check = false);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern void TriggerUsageFeatureGroupEdgeMTHoldout(const base::Feature& feature);

// Refreshed Equal holdout which will be controlled via CT. By default
// it's enabled for all users
#if BUILDFLAG(IS_WIN)
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FIRST_RUN_FEATURE(kEdgeEqualRefreshedExperience);
COMPONENT_EXPORT(UI_BASE_FEATURES)
bool IsRefreshedLightningExperienceEnabled(const base::Feature& feature,
                                           bool trigger_usage_on_check = false);
COMPONENT_EXPORT(UI_BASE_FEATURES)
void TriggerUsageIfRefreshedLightningExperienceEnabled(
    const base::Feature& feature);
#endif  // BUILDFLAG(IS_WIN)

// EdgeENPDyn Holdout Feature Flags and Triggers.
BASE_DECLARE_FIRST_RUN_FEATURE(kFeatureGroupEdgeENPDynHoldout);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsEnabledFeatureGroupEdgeENPDynHoldout(
    const base::Feature& feature,
    bool trigger_usage_on_check = false);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern void TriggerUsageFeatureGroupEdgeENPDynHoldout(
    const base::Feature& feature);

COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kAppLayerForCentralContainer);

COMPONENT_EXPORT(UI_BASE_FEATURES)
extern int GetRoundedCornerRadius();

COMPONENT_EXPORT(UI_BASE_FEATURES)
extern int GetRoundedCornerRadiusForMacOS26();

COMPONENT_EXPORT(UI_BASE_FEATURES)
extern int GetMarginForPhoenix();

// if enabled, mica will be shown in Edge Window for Classic Tab Shape.
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsVisualRejuvMicaEnabledForConnectedTabs();

// If enabled, the Phoenix Design for Vertical Container will be changed
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kContainerizeVerticalTabContainer);

// If enabled, the Phoenix Design for DevTools Container will be Shown.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kContainerizeDevToolsContainer);

// If enabled, containerization changes for Favbar
// will be applied
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kFavBarContainerization);

// Master feature flag for all phoenix features.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kPhoenixShowContainersInEdge);


#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)
// Master feature flag for phoenix token centralization.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kPhoenixTokenCentralized);
#endif  // BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)

// If activated, Rewards will automatically be pinned to toolbar
// if user clicks Microsoft Rewards via More Menu dropdown
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeRewardsMoreMenuAutoPinToolbar);

enum class PhoenixFrameConnTabsColor : int {
  kDefault = 0,
  kBlueTintA = 1,
  kBlueTintB = 2
};

COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kPhoenixEdgeFrameConnTabsColor);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern PhoenixFrameConnTabsColor GetPhoenixFrameConnTabsColor();

COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kSystemCaptionStyleReadFromRegistry);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsSystemCaptionStyleReadFromRegistryEnabled();

// fires when edge://settings/appearance is clicked on.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kSettingsAppearanceTrigger);

// Fires when the Themes section is rendered in the Settings page.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kSettingsAppearanceThemesPageTrigger);

// Fires when a user has a theme color applied (user color or autogenerated
// theme color).
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kColorThemeAppliedTrigger);

COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kVisualRejuvConnectedTabs);

COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kVisualRejuvMicaForConnectedTabs);

COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FIRST_RUN_FEATURE(kVisualRefreshKumo);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsEdgeVisualRefreshKumoEnabled(bool trigger_usage = false);

#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kSemanticColorTokens);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsEdgeSemanticColorTokenEnabled(bool trigger_usage = false);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsEdgeSemanticOrPhoenixColorTokenEnabled(
    bool trigger_usage = false);
#endif  // BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)

COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsEdgeAIThemeUndoEnabled(bool trigger_usage = false);

COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeWebUIWebVitals);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsEdgeWebUIWebVitalsEnabled();

// If enabled, user will have access to copy/paste for types other than text
// in a WebView2 instance in a UWP app.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeEnableWebView2UWPCopyPaste);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsEdgeWebView2UWPCopyPasteEnabled();

// If enabled, webview ignore parent size and allow fixed bounds
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeFixedBoundsForWebView);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsEdgeFixedBoundsForWebViewEnabled();

#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)

COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeR1ColorThemes);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsEdgeR1ColorThemesEnabled();
#endif // BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC) || BUILDFLAG(IS_LINUX)

// If enabled, Edge DLP features will have access to the private clipboard.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgePrivateClipboard);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsEdgePrivateClipboardFeatureAvailable();

// If enabled, the profile flyout dialog will use the V2 version.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeProfileFlyoutV2Enable);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsEdgeProfileFlyoutV2Enable(bool trigger_usage = false);

#if BUILDFLAG(IS_MAC)
// If enabled, will adjust the position and padding of toolbar buttons.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeToolbarButtonUIPolish);
#endif  // BUILDFLAG(IS_MAC)
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsEdgeToolbarButtonUIPolishEnabled();

// If enabled, the browser frame refresh in CoPilot Mode will be applied.
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kVisualRejuvFrameViewsForCoPilot);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsEdgeVisualRejuvFrameViewsForCoPilotModeEnabled();

// If enabled, will use ThemeService-based dark mode detection (current
// approach). If disabled, will use direct preference reading (legacy approach).
COMPONENT_EXPORT(UI_BASE_FEATURES)
BASE_DECLARE_FEATURE(kEdgeThemeServiceDarkMode);
COMPONENT_EXPORT(UI_BASE_FEATURES)
extern bool IsEdgeThemeServiceDarkModeEnabled(bool trigger_usage = false);

}  // namespace edge
}  // namespace features

#endif  // CHROME_BROWSER_EDGE_UI_BASE_FEATURES_H_
