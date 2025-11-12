// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_TRUST_COMMON_FEATURES_H_
#define COMPONENTS_EDGE_TRUST_COMMON_FEATURES_H_

#include "base/component_export.h"
#include "base/feature_list.h"
#include "base/metrics/field_trial_params.h"
#include "components/edge_trust/tracking_protection/options.h"

namespace features {
namespace edge {

COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kAdSelectionAPI);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsAdSelectionApiEnabled();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kEnhancedTrackingPreventionEnabled);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsEnhancedTrackingPreventionEnabled();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kAdEcosystemImpactAnalysis);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsAdEcosystemImpactAnalysisEnabled();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kTrackingPreventionEngagementMitigation);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool UseTrackingPreventionEngagementMitigation();
// Blocked trackers page under tracking prevention settings
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kBlockedTrackerStatsEnabled);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsBlockedTrackerStatsEnabled();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kPrivacyCommitmentHeaderEnabled);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsPrivacyCommitmentHeaderEnabled();
COMPONENT_EXPORT(EDGE_TRUST_COMMON) BASE_DECLARE_FEATURE(kLoadStatistics);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kEdgeExperimentalTrackingPreventionFeatures);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kLoadStatisticsUiUpdate);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kSecureIP);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsSecureIPEnabled();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kSecureIPAllUsers);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kSecureIPBandwidthTelemetry);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsSecureIPBandwidthTelemetryEnabled();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
// Size is in MB.
BASE_DECLARE_FEATURE(kMaximumAllowedDatabaseSizeInLoadStatistics);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsLoadStatisticsEnabled();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsLoadStatisticsUiUpdateEnabled();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kLoadStatisticsLowPriLogging);

COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kStreamlineInPrivateTPWhenPartitioned);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsStreamlineInPrivateTPWhenPartitionedEnabled();

// Transparent Advertising Program flags.
COMPONENT_EXPORT(EDGE_TRUST_COMMON) BASE_DECLARE_FEATURE(kTransparentAds);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsTransparentAdsEnabled();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kAllTransparentMetadata);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool ShouldShowAllTransparentMetadata();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kTransparentAdsInPageInfo);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsTransparentAdsInPageInfoEnabled();

// Edge VPN Service.
COMPONENT_EXPORT(EDGE_TRUST_COMMON) BASE_DECLARE_FEATURE(kEmbeddedVpnUI);
COMPONENT_EXPORT(EDGE_TRUST_COMMON) BASE_DECLARE_FEATURE(kVpnModes);
COMPONENT_EXPORT(EDGE_TRUST_COMMON) BASE_DECLARE_FEATURE(kVpnService);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kDisableVPNForBuiltInProfilesInTest);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kDisableVpn);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool AreVpnModesEnabled();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsEmbeddedVpnUIEnabled();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kEnableVpnAllSites);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsVpnAllSitesEnabled();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kVpnPreview);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsVpnPreview();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern int GetVpnExperimentVersion();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern std::string GetUnsupportedRegions();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsVpnFeatureEnabled();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern int GetVpnBandwidthInGB();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern int GetVpnMaxUnengagedHoursNoFre();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern int GetVpnMaxUnengagedHoursAfterFre();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern int GetVpnBandwidthSyncIntervalInMinutes();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool VpnWiFiCampaignEligible();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool VpnNewTabCampaignEligible();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool VpnUnsecureSiteChromePBCampaignEligible();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool VpnUnsecureSiteAllCampaignEligible();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool VpnChromePBCampaignEligible();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool VpnGlobalPrefEnabled();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool VpnSkipFRE();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsVpnNurFCampaignEligible();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kEdgeVpnDiscoverability);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE_TRIGGER(kEdgeVpnPublicWifiTrigger);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE_TRIGGER(kEdgeVpnUnsecureSiteChromePBTrigger);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE_TRIGGER(kEdgeVpnUnsecureSiteAllTrigger);

COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kEdgeEnableVpnForWebRTC);

// AI tracker classification feature flags. |kAIClassificationEnabled| will be
// used to see if we should classify trackers at all using AI.
// |kAIClassificationEnforcementEnabled| will be used to determine if we should
// perform enforcements on any trackers found using AI.
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kAIClassificationEnabled);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsAIClassificationEnabled();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kAIClassificationEnforcementEnabled);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsAIClassificationEnforcementEnabled();

// Helpers to get resulting TrackingProtection BlockSets based on defined
// constants or an overridden field trial.
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern tracking_prevention::BlockSet GetDefaultResourceBlockSet();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern tracking_prevention::BlockSet GetDefaultStorageBlockSet();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern tracking_prevention::BlockSet GetIncreasedResourceBlockSet();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern tracking_prevention::BlockSet GetIncreasedStorageBlockSet();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern tracking_prevention::BlockSet GetReducedResourceBlockSet();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern tracking_prevention::BlockSet GetReducedStorageBlockSet();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern tracking_prevention::BlockSet GetOffBlockSet();

// Helpers to get resulting TrackingProtection EngagementSets based on defined
// constants or an overridden field trial.
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern tracking_prevention::EngagementSet GetDefaultEngagementSet();
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern tracking_prevention::EngagementSet GetOffEnagementSet();

// TPCD downstream features
COMPONENT_EXPORT(EDGE_TRUST_COMMON) BASE_DECLARE_FEATURE(kEdgeTpcdMetadata);

// This will be triggered when the VPN UI is available.
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE_TRIGGER(kEdgeVpnUIAvailableTrigger);

// When flag is enabled, allows an ad selection/privacy notice to be shown in
// the Edge What's New Page.
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
BASE_DECLARE_FEATURE(kEdgeUpdatePrivacyNoticeExperiment);
COMPONENT_EXPORT(EDGE_TRUST_COMMON)
extern bool IsEdgeUpdatePrivacyNoticeExperimentEnabled();

}  // namespace edge
}  // namespace features
#endif  // COMPONENTS_EDGE_TRUST_COMMON_FEATURES_H_
