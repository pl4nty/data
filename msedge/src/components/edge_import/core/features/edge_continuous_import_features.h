// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_IMPORT_CORE_FEATURES_EDGE_CONTINUOUS_IMPORT_FEATURES_H_
#define COMPONENTS_EDGE_IMPORT_CORE_FEATURES_EDGE_CONTINUOUS_IMPORT_FEATURES_H_

#include "base/component_export.h"
#include "base/feature_list.h"
#include "base/metrics/field_trial_params.h"

namespace features {
namespace edge_continuous_import {

// Indicates if recommendation engine should be started
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
bool ShouldComputeRecommendations();

// Holdback group trigerring / check for features that need to be a part of
// holdback experiment. This API should be used only for CI activation
// experiments.
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
bool IsContinuousMigrationGroupFeatureEnabled(
    const base::Feature& feature,
    bool trigger_usage_on_check = false);

COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
void TriggerUsageIfContinuousMigrationGroupEnabled(
    const base::Feature& feature);

// Holdout API to check both holdouts
// (kEdgeContinuousMigrationEngagementExperience and
// kEdgeContinuousMigrationExperience) for CI Engagement Experience.
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
bool IsContinuousMigrationEngagementExperienceEnabled(
    const base::Feature& feature,
    bool trigger_usage_on_check = false);

COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
void TriggerUsageIfContinuousMigrationEngagementExperienceEnabled(
    const base::Feature& feature);

COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
bool IsBrowsingMixEnabled(bool trigger_flag);

COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kEdgeContinuousExtensionsImport);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kEdgeContinuousHistoryImport);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kEdgeContinuousAutoFillImport);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kEdgeContinuousPaymentsImport);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kEdgeContinuousFavortiesImport);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kEdgeContinuousCookiesImport);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kEdgeContinuousPasswordImport);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kEdgeContinuousMigrationLogging);
// shopping campaign
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kEnableTargetingForContinuousImportWithShopping);

COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kEdgeContinuousMigrationLongRunningSession);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kEdgeContinuousMigrationOpenTabsContinuousImport);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
extern const char kParamNameCIOpenTabsThersholdCount[];

COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kEnableAdvanceCIConsentMessage);

// Undo CI - Delete imported data
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousImportUndoCI);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousImportUndoHistory);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousImportUndoHistoryCorrection);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousImportUndoAutoFill);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousImportUndoPayments);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousImportUndoFavorties);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousImportUndoCookies);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousImportUndoPasswords);

COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kEdgeContinuousImportWindowsRecommendations);

// CI - Hold Back Group which will be controlled via ECS. By default
// it's enabled for all users.
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kEdgeContinuousMigrationExperience);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kEdgeContinuousMigrationUser);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kNewlyConsentedCIUser);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kCookieImportStartedWritingToDB);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kCookieImportStarted);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kCookieImportBeforeMergingToDB);

// Flag to stop import for cookies to test user impact for reverse Experiment.
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kStopChromeCookieImportForReverseExperiment);

// CI Engagement - Holdback group which will be controlled via ECS. By default
// it's enabled for all users
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kEdgeContinuousMigrationEngagementExperience);

COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousMigrationConsentInSCOOBE);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FIRST_RUN_FEATURE(kContinuousMigrationConsentInOOBE);
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kEdgeBrowsingMix);

// Flag to upload Imported History URLs to One Ds
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousMigrationUploadImportedHistory);

COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
extern const base::FeatureParam<int> kImportedHistoryUploadEventBatchSize;

COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
extern const base::FeatureParam<int> kImportedHistoryUrlsMaxFetchLimit;

COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kUseBatchProcessorForImportedHistoryUpload);

COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousMigrationUploadImportedHistoryForCUV);

// Flag to enable autolaunch of browser on startup
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kVisibleCIAutoLaunchOnStartup);

// Flag to enable autolaunch on unlock.
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kVisibleCIAutoLaunchOnUnlock);

// Browser usage threshold in which auto launch should be activated.
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
extern const base::FeatureParam<int> kAutoLaunchActivationThreshold;

// Flag to enable cookie import logic v3 for continuous imports.
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousMigrationCookieMergeLogicV3);

// Prong1 URL activation enables CI helping personalize prong1. Imported_MUID is
// required for it. This feature flag enabled both, Imported_MUID and prong1 URL
// activation
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kEdgeContinuousImportProng1UrlActivation);

// Flag to enable new bookmarks logic for chrome imports.
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousMigrationBookmarksMergeLogicV2);

// Flag to share MUID, ANID and ClientId to One Ds
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousMigrationUploadIds);

// Flag to generate top media site list using global static list and store it
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousMigrationGenerateTopMediaListWithGlobalList);

// Triggers on profile load if chrome is installed
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kChromeInstalled);
// Triggers on profile load if chrome is installed and Edge is primary browser
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kChromeInstalledandEdgePB);

COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kImportEndedAfterAdvanceToCIConversion);

// Triggers on profile load for advance consented users.
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kTriggerAdvanceConsentUser);

// Uploading diagnostic data for browser network usage.
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousImportUploadBrowserNetworkUsage);

// Trigger for Import Ended event.
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kImportEnded);

// Extra diagnostic for CI
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousImportExtraDiagnostic);

// Should import open tabs for AAD user
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousImportShouldDenyImportTabsForAADUsers);

// Should AutoLaunch for AAD user
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kDenyAutoLaunchForAADUsers);

// Cleaning up all the advance consent and marking them false.
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kAdvanceConsentForcefulCleanup);

COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kCISettingsToggleRow);

COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kHandleCIActivatedOnRemote);

// Trigger to know if existing user is chrome heavy user.
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kChromeHeavyUser);

// Trigger to know if quick links avaialbe for boosting media sites
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kQuickLinksAvailable);

//  Trigger to know if continuous migration history import ended
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kContinuousMigrationHistoryImportEnded);

// Trigger to know if chrome PB user with active CI
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kTriggerChromePBUserWithActiveCI);

// Trigger to know if chrome PB user with active CI on a visible window launch
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kTriggerVisibleLaunchForChromePBUserWithActiveCI);

// Trigger to know if chrome PB user with active CI and imported search terms
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kTriggerChromePBAndCIUserWithImportedSearchTerms);

// Trigger to know if omnibox interaction happened for chrome PB user with
// imported search terms
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(
    kTriggerOmniboxInteractionForChromePBUserWithImportedSearchTerms);

// Feature to insert keyword search terms from Imported history urls
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE_TRIGGER(kContinuousImportInsertKeywordSearchTerms);

// Feature to generate keyword search terms from Imported history urls
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousImportGenerateKeywordSearchTerms);

// Feature to observe visible browser launch for CI
COMPONENT_EXPORT(EDGE_IMPORT_FEATURES)
BASE_DECLARE_FEATURE(kContinuousImportVisibleBrowserObserver);
}  // namespace edge_continuous_import
}  // namespace features

#endif  // COMPONENTS_EDGE_IMPORT_CORE_FEATURES_EDGE_CONTINUOUS_IMPORT_FEATURES_H_
