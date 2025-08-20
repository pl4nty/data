// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef MEDIA_BASE_EDGE_MEDIA_FEATURES_H_
#define MEDIA_BASE_EDGE_MEDIA_FEATURES_H_

#include "base/component_export.h"
#include "base/feature_list.h"
#include "base/metrics/field_trial_params.h"
#include "components/webrtc_internals/buildflags/buildflags.h"
#include "edge_embedded_browser/buildflags/buildflags.h"
#include "media/media_buildflags.h"
#include "third_party/widevine/cdm/buildflags.h"

namespace media {

namespace features {

namespace edge {

// Please maintain alphabetical order:
// Features with no associated build flag should go in the top section. Maintain
// the no-build flag section alphabetized by feature name.
// Other features are ordered alphabetically by build flag and then by feature
// name within the corresponding flag section.

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kAutoplayAllowListUI);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kAutoplayBlockListUI);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kAutoplayUserSettingBlockOption);

#if BUILDFLAG(EDGE_ENABLE_CDM_OVERRIDE_WIN_10)
// Permission to override the Cdm string per domain policies
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES) BASE_DECLARE_FEATURE(kCdmOverrideWin10);
#endif  // BUILDFLAG(EDGE_ENABLE_CDM_OVERRIDE_WIN_10)

#if BUILDFLAG(EDGE_ENABLE_MF_AC3_EAC3_DECODING)
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kDecodeAc3Eac3UsingMF);
#endif  // BUILDFLAG(EDGE_ENABLE_MF_AC3_EAC3_DECODING)

#if BUILDFLAG(IS_WIN)
// Upstream removed kD3D11VideoDecoder and uses D3D11VideoDecoder by default.
// Edge uses VdaVideoDecoder (which uses DXVAVideoDecodeAccelerator in Windows)
// by default. This flag is needed to use D3D11VideoDecoder for testing.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kEdgeD3D11VideoDecoder);

// Upstream had removed kDXVAVideoDecoding. Edge still needs it for HEVC.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kEdgeDXVAVideoDecoding);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kExtraCodecsForEdgeDXVAVideoDecoding);

// D3D11 and DXVAVDA (for HEVC & AV1) hybrid video decoding.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kEdgeD3D11VdaHybridVideoDecoding);

// Not using build flag because upstream uses kMediaFoundationAV1Decoding
// without build flag. We use kDecodeAV1UsingMediaFoundation to ensure Edge can
// override kMediaFoundationAV1Decoding.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kDecodeAV1UsingMediaFoundation);
#endif  // BUILDFLAG(IS_WIN)

// Support dynamic metadata in HEVC video streams.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kEdgeDynamicMetadataInHevc);

#if BUILDFLAG(EDGE_ENABLE_MF_HEVC_DECODING)
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES) BASE_DECLARE_FEATURE(kDecodeHevcUsingMF);
#endif  // BUILDFLAG(EDGE_ENABLE_MF_HEVC_DECODING)

#if BUILDFLAG(EDGE_ENABLE_SMTC_SUPPORT_FOR_PWA)
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES) BASE_DECLARE_FEATURE(kSmtcSupportForPwa);
#endif  // BUILDFLAG(EDGE_ENABLE_SMTC_SUPPORT_FOR_PWA)

#if BUILDFLAG(IS_WIN)
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kEdgeUseAACExtraData);
#endif  // BUILDFLAG(IS_WIN)

#if BUILDFLAG(ENABLE_MEDIA_FOUNDATION_CDM)
// Cache the result from `IMFExtendedDRMTypeSupport::IsTypeSupportedEx()`.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kCacheMediaFoundatonCapabilityQuery);

// Erase the cached entries from
// `IMFExtendedDRMTypeSupport::IsTypeSupportedEx()` if needed.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kEraseCachedMediaFoundatonCapabilityQuery);

// The window position offset parameter for
// `kEraseCachedMediaFoundatonCapabilityQuery`.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
extern const base::FeatureParam<int>
    kEraseCachedMediaFoundatonCapabilityQueryOffsetPos;

// Expire the cached result for HWDRM playback error fallabck (fallback to use
// SWDRM).
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kExpireMediaFoundationHwdrmFallbackResult);

// The expire period parameter for `kExpireMediaFoundationHwdrmFallbackResult`.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
extern const base::FeatureParam<int>
    kMediaFoundationHwdrmFallbackResultExpirePeriod;

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kDecodeDolbyVisionUsingMF);
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
bool AllowMFDolbyVisionDecoding();

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kDisablePlayReadyHardwareDrm);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kDisablePlayReadyHardwareDrm25668132);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES) BASE_DECLARE_FEATURE(kIdlOverride);

// Use whitelisted domains for idl override instead of the regular
// |kIdlOverride| feature enabled path.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kWhitelistedIdlOverride);

// Support for CBCS encryption scheme for PlayReady
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kPlayReadyCbcsEncryptionScheme);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kPlayReadyDcompWorkaround);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kPlayReadyHardwareDrmWorkaround);

#if BUILDFLAG(EDGE_ENABLE_MF_AAC_DECODING)
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES) BASE_DECLARE_FEATURE(kDecodeAacUsingMF);
#endif  // BUILDFLAG(EDGE_ENABLE_MF_AAC_DECODING)

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES) BASE_DECLARE_FEATURE(kPlayReadyWin10);

// Let PlayReady CDM store path lie under the per user profile path.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kUserProfileBasedPlayReadyCdmStorePath);

// Displays MF Rendering Capabilities on edge://gpu.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kMediaFoundationCapabilities);
#endif  // BUILDFLAG(ENABLE_MEDIA_FOUNDATION_CDM)

#if BUILDFLAG(EDGE_ENABLE_MEDIA_FOUNDATION_OVERRIDE)
// Permission to override the use of Media Foundation engine per domain action.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kMediaFoundationOverride);

// Allows disabling the Media Foundation Domain Override checks which are
// executed in Media Factory. These checks require outbound mojo calls to the
// browser process which must be handled by browser main, however some tests
// will block on browser main if they are attempting to do a prerender. This
// results in a deadlock which will timeout the tests. This flag is introduced
// to allow the set of impacted tests to explicitly disable these checks so the
// tests may execute as intended.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kMediaFoundationDomainOverrideDisabledForTest);
#endif  // BUILDFLAG(EDGE_ENABLE_MEDIA_FOUNDATION_OVERRIDE)

#if BUILDFLAG(IS_WIN)
// If enabled, fallback to use `Media Foundation For Clear` for the playback of
// HEVC/AV1 encoded video.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kCodecFallbackUsingMFClear);

// If enabled, silently install Microsoft.AV1VideoExtension from Microsoft
// Store if possible.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kMicrosoftAV1VideoExtension);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kMediaFoundationClearKeyTest);

// For feature check of kMediaFoundationHwH264Encoding at runtime,
// please use IsMediaFoundationHwH264EncodingEnabled() instead.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kMediaFoundationHwH264Encoding);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
bool IsMediaFoundationHwH264EncodingEnabled();

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kMediaFoundationClearAV1Support);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kMediaFoundationClearBatteryExclusiveStart);
#endif  // BUILDFLAG(IS_WIN)

#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC)
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kVideoSuperResolutionUI);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
bool IsVideoSuperResolutionUIEnabled();

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
extern const base::FeatureParam<int> kVideoSuperResolutionMaxResolution;

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kVideoSuperResolutionOverlayButton);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
extern const base::FeatureParam<bool> kVideoSuperResolutionAllowOnBattery;
#endif  // BUILDFLAG(IS_WIN) || BUILDFLAG(IS_MAC)

#if BUILDFLAG(EDGE_ENABLE_VIDEO_ELEMENT_IMG_CONTENTS)
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kVideoElementImgContents);
#endif  // BUILDFLAG(EDGE_ENABLE_VIDEO_ELEMENT_IMG_CONTENTS)

#if BUILDFLAG(ENABLE_WIDEVINE)
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES) BASE_DECLARE_FEATURE(kWidevinePlatform);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
extern bool IsWidevinePlatformEnabled();
#endif  // BUILDFLAG(ENABLE_WIDEVINE)

// If enabled, loads the Media Internals Services extension into the browser
// Used for media diagnostics log. Feature flag can be used as a kill switch if
// media log is crashing the feedback dialog.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kMediaInternalsServices);

#if BUILDFLAG(ENABLE_WEBRTC_INTERNALS)
// If enabled, load the Webrtc internals extension for getting Webrtc logs
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES) BASE_DECLARE_FEATURE(kWebrtcInternals);
#endif  // BUILDFLAG(ENABLE_WEBRTC_INTERNALS)

#if BUILDFLAG(ENABLE_EMBEDDED_BROWSER_WEBVIEW)
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kWebView2TextureStream);
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kWebView2NoTabForScreenShare);
#endif

#if BUILDFLAG(IS_ANDROID)
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kEdgeMobileBackgroundPlay);
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
extern const base::FeatureParam<bool> kBackgroundPlayDefaultOn;
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
bool ShouldEnableBackgroundPlayInSettings();
#endif

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES) bool IsEdgeWebView2TextureStreamEnabled();
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
bool IsEdgeWebView2NoTabForScreenShareEnabled();

#if BUILDFLAG(EDGE_ENABLE_LIVE_DUBBING)
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
bool IsTranslateVideoEnabled();

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kSkipLiveTranslateForAds);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kTranslateVideoCaption);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kTranslateVideo);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
bool IsPerLanguageSTModelEnabled();

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kTranslateVideoPerLanguageSTModel);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kEdgeSupportTranslateAttributeForVideo);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kTranslateVideoTrackCPUUsage);

// This feature flag is used to enable the video translation feature for power
// user. For our experiment, power users are those whose browser is set to a
// non-English language or have added any languages to their always translate
// list.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kTranslateVideoPowerUser);

// This feature flag is used to enable the video translation feature for
// non-power user.
COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kTranslateVideoNonPowerUser);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kTranslateVideoEnglishToChinese);

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
extern const base::FeatureParam<int> kTranslateVideoSamplingIntervalForCPUUsage;

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
extern const base::FeatureParam<int>
    kTranslateVideoConfigAudioBufferMinCapacity;

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
extern const base::FeatureParam<int>
    kTranslateVideoConfigAudioBufferMaxCapacity;

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
extern const base::FeatureParam<bool> kTranslateVideoConfigEnableLogging;

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
extern const base::FeatureParam<std::string> kTranslateVideoPassKey;

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
extern const base::FeatureParam<std::string> kTranslateVideoDomain;

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
extern const base::FeatureParam<int> kTranslateVideoMemoryThreshold;

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
extern const base::FeatureParam<int> kTranslateVideoCoresThreshold;

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
extern const base::FeatureParam<int> kTranslateVideoMinAvailableMemoryThreshold;

COMPONENT_EXPORT(EDGE_MEDIA_FEATURES)
BASE_DECLARE_FEATURE(kTranslateVideoCoachmark);
#endif  // BUILDFLAG(EDGE_ENABLE_LIVE_DUBBING)

}  // namespace edge

}  // namespace features

}  // namespace media

#endif  // MEDIA_BASE_EDGE_MEDIA_FEATURES_H_
