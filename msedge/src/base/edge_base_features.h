// Copyright (c) 2019 The Chromium Authors. All rights reserved.
// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "base/base_export.h"
#include "base/feature_list.h"
#include "base/metrics/field_trial_params.h"
#include "build/build_config.h"

#ifndef BASE_EDGE_BASE_FEATURES_H_
#define BASE_EDGE_BASE_FEATURES_H_

namespace base {
namespace features {

BASE_EXPORT BASE_DECLARE_FEATURE(kClickOnceAndDirectInvoke);

BASE_EXPORT BASE_DECLARE_FEATURE(kDataProtection);

#if BUILDFLAG(IS_WIN)
BASE_EXPORT BASE_DECLARE_FEATURE(kEdgeDisableETWEvents);

BASE_EXPORT BASE_DECLARE_FEATURE(kEdgeExtendedETWEvents);

BASE_EXPORT BASE_DECLARE_FEATURE(kEdgeWebViewAppLifeCycleWorkaround);

BASE_EXPORT BASE_DECLARE_FEATURE(kStackSamplingProfiler);
#endif  // BUILDFLAG(IS_WIN)

BASE_EXPORT BASE_DECLARE_FEATURE(kEnableEdgeStartupTelemetryDebugMode);

BASE_EXPORT BASE_DECLARE_FEATURE(kEdgeProfileID);

BASE_EXPORT BASE_DECLARE_FEATURE(kEdgeProfileIDUpload);

// If Enabled, will fake that system is in lockdown mode
BASE_EXPORT BASE_DECLARE_FEATURE(kEmulateLockdownMode);

BASE_EXPORT BASE_DECLARE_FEATURE(kEmulateWindowsHolographicSku);

BASE_EXPORT BASE_DECLARE_FEATURE(kEmulateWindowsTeamSku);

BASE_EXPORT BASE_DECLARE_FEATURE(kEmulateWindowsXboxSku);

BASE_EXPORT BASE_DECLARE_FEATURE(kEmulateWindowsServerSku);

// If enabled, it forces the collection of histogram inventory data.
BASE_EXPORT BASE_DECLARE_FEATURE(kForceEnableHistogramInventoryDataCollection);

BASE_EXPORT BASE_DECLARE_FEATURE(kEndpointDlp);
BASE_EXPORT BASE_DECLARE_FEATURE(kEndpointDlpCopyPrintSaveAs);
BASE_EXPORT BASE_DECLARE_FEATURE(kEndpointDlpTestBlock);
BASE_EXPORT BASE_DECLARE_FEATURE(kEndpointDlpTestWarn);

// Test only: used to override the platform test disable status.
BASE_EXPORT BASE_DECLARE_FEATURE(kOverridePlatformTestDisable);

// Test only: used to identify when tests are executing in the perf lab.
BASE_EXPORT BASE_DECLARE_FEATURE(kRunningPerfLabTest);

// If enabled, additional UI elements will scale in high DPI environments.
BASE_EXPORT BASE_DECLARE_FEATURE(kUIScalingHighDPI);

BASE_EXPORT BASE_DECLARE_FEATURE(kWipShareContract);

#if BUILDFLAG(IS_WIN)
// If enabled, will only call PeekMessage in the Windows MessagePumpForUI
// implementation if there are messages to process to prevent the thread
// from being marked as spinning.
BASE_EXPORT BASE_DECLARE_FEATURE(kAvoidPeekMessageSpin);

// Emit ETW event on long task in the StackHangETWEmitter class.
BASE_EXPORT BASE_DECLARE_FEATURE(kEnableStackHangEtwEmitter);
#endif // BUILDFLAG(IS_WIN)

// This feature enables the "focus parent tab and close current tab" behavior
// upon back navigation on windows homepage (Microsoft Start) article pages.
// It works in concert only with the windows homepage application which executes
// javascript to perform the necessary navigation and history manipulations
// which are then intercepted by the navigation throttle. The term "windows" or
// "Win" here does NOT imply any restriction to just the windows platform.
BASE_EXPORT BASE_DECLARE_FEATURE(kWinHPNewTabBackButtonFocusAndClose);

// If enabled, specific Windows homepage (Microsoft Start) urls can bypass
// navigation controller functionality that would otherwise hide history
// manipulations from back/forward button UI. The term "windows" or "Win" here
// does NOT imply any restriction to just the windows platform.
BASE_EXPORT BASE_DECLARE_FEATURE(kWinHPBypassSkipOnBackForwardUI);

// If enabled, overrides and short-circuits the minimum hardware requirements
// checks for all features which use the MeetsMinimumHardwareRequirements()
// method.
BASE_EXPORT BASE_DECLARE_FEATURE(kMeetsMinimumHardwareRequirementsOverride);
BASE_EXPORT extern const char
    kMeetsMinimumHardwareRequirementsOverrideParamName[];
BASE_EXPORT extern const base::FeatureParam<bool>
    kMeetsMinimumHardwareRequirementsOverrideParam;

// If enabled, will dump collections of all histograms to VLOG(1) in release
// builds.
BASE_EXPORT BASE_DECLARE_FEATURE(kLogHistogramsOnShutdown);

// CorePlatformServices (CPS) is a concept in the EU's Digital Markets Act.
// Depending on whether a platform is considered a CPS, certain policies will
// apply for EU users.
BASE_EXPORT BASE_DECLARE_FEATURE(kEdgeCpsConfig);
BASE_EXPORT extern const char kEdgeCpsConfigParamName[];
BASE_EXPORT extern const base::FeatureParam<int> kEdgeCpsConfigParam;

// This feature flag gates whether kEdgeCpsConfig can be overwritten by cmd
// flags for testing. This should never be enabled in Stable builds.
BASE_EXPORT BASE_DECLARE_FEATURE(kEdgeAllowDmaOverride);

// If enabled, MessagePumpForUI::WaitForWork will sleep when
// waking instead of calling MsgWaitForMultipleObjectsEx with flags = 0.
BASE_EXPORT BASE_DECLARE_FEATURE(kMitigateAttachedInputSpinBySleeping);

#if BUILDFLAG(IS_ANDROID)
// If enabled, reduces thread stack size on Android to save memory
BASE_EXPORT BASE_DECLARE_FEATURE(kEdgeEnabledSmallerThreadStackSize);
#endif  // BUILDFLAG(IS_ANDROID)

}  // namespace features
}  // namespace base

#endif  // BASE_EDGE_BASE_FEATURES_H_
