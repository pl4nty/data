// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef BASE_THREADING_EDGE_THREAD_RESTRICTIONS_FRIENDS_H_
#define BASE_THREADING_EDGE_THREAD_RESTRICTIONS_FRIENDS_H_

#include "base/auto_reset.h"
#include "base/base_export.h"
#include "base/compiler_specific.h"
#include "base/dcheck_is_on.h"
#include "base/gtest_prod_util.h"
#include "base/location.h"
#include "base/time/time.h"
#include "build/branding_buildflags.h"
#include "build/build_config.h"
#include "third_party/speech_sdk/support/buildflags.h"

#if BUILDFLAG(IS_WIN)
#include "base/win/windows_types.h"
#endif

#if DCHECK_IS_ON()
#include "base/debug/stack_trace.h"
#include "third_party/abseil-cpp/absl/types/optional.h"
#endif

// This file contains the forward declaration of Edge specific classes and
// functions that are allowed to override threading restrictions through a
// friend declaration.

// First declare in alphabetical order the classes that do not belong to any
// namespace. Use different parragraphs for build-specific cases.

struct AllowBlockingInDelayHookWrapper;
class EdgeCookieTimeOutHelper;
class MitigationManager;
class OneAuthEdgeAuthenticationManager;
class OneAuthEdgeAuthenticationManagerIOS;
class OneAuthEdgeScopedAllowBlocking;
class OneAuthProxy;
class Profile;
class PwaIdentityProxy;
class ScopedAllowBlockingForLegacySmartScreenImport;
class StartupBrowserCreator;
struct StartupProfileInfo;
class WebEngineContentBrowserClient;

#if BUILDFLAG(IS_WIN)
class DevToolsWdpConnectionFactoryImpl;
#endif  // BUILDFLAG(IS_WIN)

// Second, declare in alphabetical order the classes that belong to namespaces.
// Use different parragraphs for build-specific cases.

namespace base {
class FilePath;
}  // namespace base

namespace crashpad {
bool GetMSADeviceTicket(base::TimeDelta, std::string*);
}

namespace dlp::DefaultUtils {
bool GetIsWipManagedUser();
}

namespace dlp::mdatp {
bool IsMdatpEnabled();
}

namespace edge::fre {
class FreUntrustedDataSource;
}

namespace edge::kiosk {
class Manager;
}

namespace edge::learning_tools {
class ScopedAllowBlockingForLearningTools;
}

namespace edge::mac::touchbar {
class ScopedAllowBlockingForTouchbar;
}

namespace edge_policy {
class EdgePolicyUIHandler;
}

namespace edge::tenant_restrictions::trv2::win {
class ScopedAllowLoad;
}

namespace edge_utils {
Profile* GetFallbackLaunchProfile(Profile*, const std::vector<Profile*>&);
StartupProfileInfo GetLastActiveProfileOrInitialProfileInfo();
bool IsProfileMarkedForDeletionOrNotExistent(base::FilePath);
}  // namespace edge_utils

namespace edge::wns {
class PushPortableClientTimer;
}

#if BUILDFLAG(IS_WIN)
namespace edge_feedback::system_logs {
class EdgeInternalLogSource;
}
#endif  // BUILDFLAG(IS_WIN)

namespace edge_trust {
class LoadStatisticsDatabase;
}

namespace embedded_browser {
class EmbeddedBrowserPrintManager;
}

namespace entity_extraction {
class EntityExtractionService;
}

namespace ios {
class ScopedAllowBlockingForIOSMainController;
}

namespace io_thread {
class IOSIOThread;
}

namespace nacl::nonsfi {
class PluginMainDelegate;
}

namespace oneauth_abi {
void ScopeAllowedLoadOneAuthLibrary();
}

namespace printing {
class PrintingContextWCOS;
class PrintingContextSystemDialogWCOS;
}  // namespace printing

namespace remoting::protocol {
class ScopedAllowSyncPrimitivesForWebRtcDataStreamAdapter;
}

namespace sessions {
class EdgeSessionRestoreLog;
}

namespace syncer {
// Replacing upstream |syncer::SyncServerConnectionManager| which does
// blocking operation on |syncer::HttpBridge| on a worker thread.
class EdgeCloudMessagingConnectionManager;
class ModelSafeWorker;
}

namespace telemetry_client {
class TelemetryModuleLoader;
}

namespace tracking_prevention {
class TrackingChecker;
}

namespace update_client {
class OneDSPingSender;
}

namespace value_store {
class LeveldbValueStore;
}

namespace views {
class HWNDMessageHandler;
}

namespace wdag::internals {
class ScopedAllowBlockingForDllLoad;
}

#if BUILDFLAG(IS_ANDROID)
namespace edge_android_webview {
class AwFormDatabaseService;
class CookieManager;
class ScopedAllowInitGLBindings;
}  // namespace edge_android_webview
#endif  // BUILDFLAG(IS_ANDROID)

#if BUILDFLAG(IS_WIN)
namespace base::win {
extern BASE_EXPORT base::Time CurrentModuleCreationTime();
}

namespace base::win::internal {
class GetLockdownModeHelper;
}

namespace dom_distiller {
class SuperResolutionIcon;
}

namespace embedded_browser {
base::FilePath GetCodeIntegrityFailureFile();
}

namespace extensions {
class EdgeFeedbackPrivateStopMediaFoundationTracingCaptureFunction;
}

namespace media {
class DXVAVideoDecodeAccelerator;
}
#endif  // BUILDFLAG(IS_WIN)

#if BUILDFLAG(SPEECH_RECOGNITION_AVAILABLE)
namespace speech {
class SpeechSdkWrapper;
}
#endif  // BUILDFLAG(SPEECH_RECOGNITION_AVAILABLE)

#endif  // BASE_THREADING_EDGE_THREAD_RESTRICTIONS_FRIENDS_H_
