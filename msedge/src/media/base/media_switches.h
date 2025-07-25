// Copyright 2012 The Chromium Authors
// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Defines all the "media" command-line switches.

#ifndef MEDIA_BASE_MEDIA_SWITCHES_H_
#define MEDIA_BASE_MEDIA_SWITCHES_H_

#include <string>

#include "base/feature_list.h"
#include "base/metrics/field_trial_params.h"
#include "build/build_config.h"
#include "media/base/media_export.h"
#include "media/gpu/buildflags.h"
#include "media/media_buildflags.h"
#include "ui/gl/angle_implementation.h"

#if BUILDFLAG(MICROSOFT_EDGE_BRANDING)
#include "extensions/buildflags/buildflags.h"
#endif  // BUILDFLAG(MICROSOFT_EDGE_BRANDING)

namespace base {
class CommandLine;
}

namespace switches {

MEDIA_EXPORT extern const char kAudioBufferSize[];

#if BUILDFLAG(ENABLE_PASSTHROUGH_AUDIO_CODECS)
MEDIA_EXPORT extern const char kAudioCodecsFromEDID[];
#endif  // BUILDFLAG(ENABLE_PASSTHROUGH_AUDIO_CODECS)

MEDIA_EXPORT extern const char kAutoplayPolicy[];

MEDIA_EXPORT extern const char kDisableAudioInput[];
MEDIA_EXPORT extern const char kDisableAudioOutput[];

MEDIA_EXPORT extern const char kFailAudioStreamCreation[];

MEDIA_EXPORT extern const char kVideoThreads[];

MEDIA_EXPORT extern const char kDisableBackgroundMediaSuspend[];

MEDIA_EXPORT extern const char kReportVp9AsAnUnsupportedMimeType[];

#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_FREEBSD) || \
    BUILDFLAG(IS_SOLARIS)
MEDIA_EXPORT extern const char kAlsaInputDevice[];
MEDIA_EXPORT extern const char kAlsaOutputDevice[];
#endif

#if BUILDFLAG(IS_WIN)
MEDIA_EXPORT extern const char kEnableExclusiveAudio[];
MEDIA_EXPORT extern const char kForceWaveAudio[];
MEDIA_EXPORT extern const char kTrySupportedChannelLayouts[];
MEDIA_EXPORT extern const char kWaveOutBuffers[];
#endif

#if BUILDFLAG(IS_FUCHSIA)
MEDIA_EXPORT extern const char kEnableProtectedVideoBuffers[];
MEDIA_EXPORT extern const char kForceProtectedVideoOutputBuffers[];
MEDIA_EXPORT extern const char kMinVideoDecoderOutputBufferSize[];
MEDIA_EXPORT extern const char kAudioCapturerWithEchoCancellation[];
#endif

MEDIA_EXPORT extern const char kFakeBackgroundBlurTogglePeriod[];

#if BUILDFLAG(USE_CRAS)
MEDIA_EXPORT extern const char kUseCras[];
MEDIA_EXPORT extern const char kSystemAecEnabled[];
#endif

MEDIA_EXPORT extern const char
    kUnsafelyAllowProtectedMediaIdentifierForDomain[];

MEDIA_EXPORT extern const char kAutoGrantCapturedSurfaceControlPrompt[];
MEDIA_EXPORT extern const char kUseFakeDeviceForMediaStream[];
MEDIA_EXPORT extern const char kUseFileForFakeVideoCapture[];
MEDIA_EXPORT extern const char kUseFileForFakeAudioCapture[];
MEDIA_EXPORT extern const char kUseFakeMjpegDecodeAccelerator[];
MEDIA_EXPORT extern const char kDisableAcceleratedMjpegDecode[];

MEDIA_EXPORT extern const char kMuteAudio[];

MEDIA_EXPORT extern const char kDisableRTCSmoothnessAlgorithm[];

MEDIA_EXPORT extern const char kForceVideoOverlays[];

MEDIA_EXPORT extern const char kMSEAudioBufferSizeLimitMb[];
MEDIA_EXPORT extern const char kMSEVideoBufferSizeLimitMb[];

MEDIA_EXPORT extern const char kClearKeyCdmPathForTesting[];
MEDIA_EXPORT extern const char kOverrideEnabledCdmInterfaceVersion[];
MEDIA_EXPORT extern const char kOverrideHardwareSecureCodecsForTesting[];
MEDIA_EXPORT extern const char kEnableLiveCaptionPrefForTesting[];

#if BUILDFLAG(IS_CHROMEOS)
MEDIA_EXPORT extern const char kAllowRAInDevMode[];
#endif  // BUILDFLAG(IS_CHROMEOS)

namespace autoplay {

MEDIA_EXPORT extern const char kDocumentUserActivationRequiredPolicy[];
MEDIA_EXPORT extern const char kNoUserGestureRequiredPolicy[];
MEDIA_EXPORT extern const char kUserGestureRequiredPolicy[];

}  // namespace autoplay

// TODO(crbug.com/414429305): Restrict this flag to USE_V4L2_CODEC.
#if BUILDFLAG(USE_LINUX_VIDEO_ACCELERATION)
MEDIA_EXPORT extern const char kHardwareVideoDecodeFrameRate[];
#endif

#if BUILDFLAG(USE_V4L2_CODEC)
MEDIA_EXPORT extern const char kEnablePrimaryNodeAccessForVkmsTesting[];
#endif

// NOTE: callers should always use the free functions in
// /media/cast/encoding/encoding_support.h instead of accessing these features
// directly.
//
// TODO(https://crbug.com/1453388): Guard Cast Sender flags with !IS_ANDROID.
//
// If enabled, completely disables use of H264 hardware encoding for Cast
// Streaming sessions. Takes precedence over
// kCastStreamingForceEnableHardwareH264.
MEDIA_EXPORT extern const char kCastStreamingForceDisableHardwareH264[];

// If enabled, allows use of H264 hardware encoding for Cast Streaming sessions,
// even on platforms where it is disabled due to performance and reliability
// issues. kCastStreamingForceDisableHardwareH264 must be disabled for this flag
// to take effect.
MEDIA_EXPORT extern const char kCastStreamingForceEnableHardwareH264[];

// If enabled, completely disables use of VP8 hardware encoding for Cast
// Streaming sessions. Takes precedence over
// kCastStreamingForceEnableHardwareVp8.
MEDIA_EXPORT extern const char kCastStreamingForceDisableHardwareVp8[];

// If enabled, allows use of VP8 hardware encoding for Cast Streaming sessions,
// even on platforms where it is disabled due to performance and reliability
// issues. kCastStreamingForceDisableHardwareVp8 must be disabled for this flag
// to take effect.
MEDIA_EXPORT extern const char kCastStreamingForceEnableHardwareVp8[];

// If enabled, completely disables use of VP9 hardware encoding for Cast
// Streaming sessions. Takes precedence over
// kCastStreamingForceEnableHardwareVp9.
MEDIA_EXPORT extern const char kCastStreamingForceDisableHardwareVp9[];

// If enabled, allows use of VP9 hardware encoding for Cast Streaming sessions,
// even on platforms where it is disabled due to performance and reliability
// issues. kCastStreamingForceDisableHardwareVp9 must be disabled for this flag
// to take effect.
MEDIA_EXPORT extern const char kCastStreamingForceEnableHardwareVp9[];

}  // namespace switches

namespace media {

// All features in alphabetical order. The features should be documented
// alongside the definition of their values in the .cc file.

#if !BUILDFLAG(IS_ANDROID)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kAudioDucking);
MEDIA_EXPORT extern const base::FeatureParam<int> kAudioDuckingAttenuation;
#endif  // !BUILDFLAG(IS_ANDROID)

#if BUILDFLAG(IS_WIN)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kAudioDuckingWin);
#endif  // BUILDFLAG(IS_WIN)

MEDIA_EXPORT BASE_DECLARE_FEATURE(kAudioFocusDuckFlash);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kAudioInputConfirmReadsViaShmem);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kAutoPictureInPictureForVideoPlayback);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kAutoplayDisableSettings);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kAVDColorSpaceChanges);

#if !BUILDFLAG(IS_ANDROID) && !BUILDFLAG(IS_CHROMEOS) && !BUILDFLAG(IS_FUCHSIA)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCameraMicEffects);
#endif  // !BUILDFLAG(IS_ANDROID) && !BUILDFLAG(IS_CHROMEOS) &&
        // !BUILDFLAG(IS_FUCHSIA)

// NOTE: callers should always use the free functions in
// /media/cast/encoding/encoding_support.h instead of accessing these features
// directly.
// TODO(https://crbug.com/1453388): Guard Cast Sender flags with !IS_ANDROID.
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCastStreamingAv1);
MEDIA_EXPORT BASE_DECLARE_FEATURE(
    kCastStreamingExponentialVideoBitrateAlgorithm);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCastStreamingHardwareHevc);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCastStreamingMediaVideoEncoder);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCastStreamingPerformanceOverlay);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCastStreamingVp8);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCastStreamingVp9);
#if BUILDFLAG(IS_MAC)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCastStreamingMacHardwareH264);
#endif
#if BUILDFLAG(IS_WIN)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCastStreamingWinHardwareH264);
#endif
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCdmHostVerification);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kContextMenuCopyVideoFrame);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kContextMenuSaveVideoFrameAs);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kContextMenuSearchForVideoFrame);
#if BUILDFLAG(CHROME_WIDE_ECHO_CANCELLATION)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kChromeWideEchoCancellation);
#endif  // BUILDFLAG(CHROME_WIDE_ECHO_CANCELLATION)

#if BUILDFLAG(SYSTEM_LOOPBACK_AS_AEC_REFERENCE)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kSystemLoopbackAsAecReference);
MEDIA_EXPORT extern const base::FeatureParam<bool>
    kSystemLoopbackAsAecReferenceForcedOn;
MEDIA_EXPORT extern const base::FeatureParam<int> kAddedProcessingDelayMs;
MEDIA_EXPORT extern const base::FeatureParam<int> kAecDelayNumFilters;
#endif  // BUILDFLAG(SYSTEM_LOOPBACK_AS_AEC_REFERENCE)

#if (BUILDFLAG(IS_MAC) || BUILDFLAG(IS_WIN))
MEDIA_EXPORT BASE_DECLARE_FEATURE(kEnforceSystemEchoCancellation);
MEDIA_EXPORT extern const base::FeatureParam<bool>
    kEnforceSystemEchoCancellationAllowAgcInTandem;
MEDIA_EXPORT extern const base::FeatureParam<bool>
    kEnforceSystemEchoCancellationAllowNsInTandem;
#endif
#if BUILDFLAG(IS_CHROMEOS)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCrOSSystemAEC);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCrOSSystemAECDeactivatedGroups);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCrOSEnforceSystemAecNsAgc);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCrOSEnforceSystemAecNs);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCrOSEnforceSystemAecAgc);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCrOSEnforceSystemAec);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCrOSDspBasedAecDeactivatedGroups);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCrOSDspBasedNsDeactivatedGroups);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCrOSDspBasedAgcDeactivatedGroups);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCrOSDspBasedAecAllowed);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCrOSDspBasedNsAllowed);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCrOSDspBasedAgcAllowed);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kIgnoreUiGains);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kShowForceRespectUiGainsToggle);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCrOSSystemVoiceIsolationOption);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kAudioFlexibleLoopbackForSystemLoopback);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCrOSEnforceMonoAudioCapture);
#endif
MEDIA_EXPORT BASE_DECLARE_FEATURE(kD3D11VideoDecoderUseSharedHandle);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kDedicatedMediaServiceThread);
// Edge start
MEDIA_EXPORT BASE_DECLARE_FEATURE(kEdgeLiveCaption);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kEdgeLiveCaptionMultiLanguage);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kEdgeLiveCaptionSettingsTrigger);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kDisplayAudioUseLocalAudioSource);
// Edge end
MEDIA_EXPORT BASE_DECLARE_FEATURE(kDeferAudioFocusUntilAudible);
#if !BUILDFLAG(IS_ANDROID)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kDocumentPictureInPictureNavigation);
#endif  // !BUILDFLAG(IS_ANDROID)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kDocumentPictureInPictureAnimateResize);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kDocumentPictureInPictureCapture);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kEnableTabMuting);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kExternalClearKeyForTesting);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kFailUrlProvisionFetcherForTesting);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kFallbackAfterDecodeError);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kFeatureManagementLiveTranslateCrOS);
#if !BUILDFLAG(IS_ANDROID)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kFileDialogsBlockPictureInPicture);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kFileDialogsTuckPictureInPicture);
#endif  // !BUILDFLAG(IS_ANDROID)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kGetDisplayMediaConfersActivation);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kGlobalMediaControls);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kGlobalMediaControlsAutoDismiss);
#if !BUILDFLAG(IS_CHROMEOS)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kGlobalMediaControlsUpdatedUI);
#endif  // !BUILDFLAG(IS_CHROMEOS)
#if !BUILDFLAG(IS_ANDROID)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaRemotingWithoutFullscreen);
#endif
MEDIA_EXPORT BASE_DECLARE_FEATURE(kGlobalMediaControlsPictureInPicture);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kGlobalMediaControlsSeamlessTransfer);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kHardwareMediaKeyHandling);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kHardwareSecureDecryption);
MEDIA_EXPORT extern const base::FeatureParam<bool>
    kHardwareSecureDecryptionForceSupportClearLead;
MEDIA_EXPORT BASE_DECLARE_FEATURE(kHardwareSecureDecryptionExperiment);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kHardwareSecureDecryptionFallback);
MEDIA_EXPORT extern const base::FeatureParam<bool>
    kHardwareSecureDecryptionFallbackPerSite;
MEDIA_EXPORT extern const base::FeatureParam<int>
    kHardwareSecureDecryptionFallbackMinDisablingDays;
MEDIA_EXPORT extern const base::FeatureParam<int>
    kHardwareSecureDecryptionFallbackMaxDisablingDays;
MEDIA_EXPORT extern const base::FeatureParam<bool>
    kHardwareSecureDecryptionFallbackOnHardwareContextReset;
MEDIA_EXPORT BASE_DECLARE_FEATURE(kHardwareSecureDecryptionAv1);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kInternalMediaSession);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kOnDeviceWebSpeech);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kLiveCaption);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kLiveCaptionAutomaticLanguageDownload);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kLiveCaptionRightClick);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kLiveCaptionLogFlickerRate);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kLiveCaptionMultiLanguage);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kLiveCaptionExperimentalLanguages);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kLiveCaptionUseGreedyTextStabilizer);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kLiveCaptionUseWaitK);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kLiveCaptionWebAudio);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kLiveTranslate);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kLogSodaLoadFailures);
#if BUILDFLAG(IS_MAC)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMacCatapLoopbackAudioForCast);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMacCatapLoopbackAudioForScreenShare);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kUseSCContentSharingPicker);
#endif  // BUILDFLAG(IS_MAC)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaCapabilitiesQueryGpuFactories);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaCapabilitiesWithParameters);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaCastOverlayButton);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaEngagementBypassAutoplayPolicies);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaEngagementHTTPSOnly);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaFoundationCdm);

#if BUILDFLAG(IS_WIN)
MEDIA_EXPORT extern const base::FeatureParam<std::string>
    kMediaFoundationClearKeyCdmPathForTesting;
#endif  // BUILDFLAG(IS_WIN)

MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaLearningExperiment);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaLearningFramework);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaLearningSmoothnessExperiment);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaOptimizer);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaPowerExperiment);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMemoryPressureBasedSourceBufferGC);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMultiBufferNeverDefer);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kOverlayFullscreenVideo);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kPauseBackgroundMutedAudio);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kPauseBackgroundTimer);
#if !BUILDFLAG(IS_ANDROID)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kPictureInPictureOcclusionTracking);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kPictureInPictureShowWindowAnimation);
#endif  // !BUILDFLAG(IS_ANDROID)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kPlatformAudioEncoder);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kEnableRtcpReporting);
#if BUILDFLAG(ENABLE_PLATFORM_HEVC)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kPlatformHEVCDecoderSupport);
#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_APPLE) || BUILDFLAG(IS_ANDROID)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kPlatformHEVCEncoderSupport);
#endif  // BUILDFLAG(IS_WIN) || BUILDFLAG(IS_APPLE) || BUILDFLAG(IS_ANDROID)
#endif  // BUILDFLAG(ENABLE_PLATFORM_HEVC)
#if BUILDFLAG(ENABLE_HEVC_PARSER_AND_HW_DECODER)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaRecorderHEVCSupport);
#endif  // BUILDFLAG(ENABLE_HEVC_PARSER_AND_HW_DECODER)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kPlaybackSpeedButton);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kPreloadMediaEngagementData);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kPreloadMetadataSuspend);
#if BUILDFLAG(IS_LINUX)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kPulseaudioLoopbackForCast);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kPulseaudioLoopbackForScreenShare);
#endif  // BUILDFLAG(IS_LINUX)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kRecordMediaEngagementScores);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kRecordWebAudioEngagement);
#if BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_LINUX)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kReduceHardwareVideoDecoderBuffers);
#endif  // BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_LINUX)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kResumeBackgroundVideo);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kRevokeMediaSourceObjectURLOnAttach);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kShareThisTabInsteadButtonGetDisplayMedia);
MEDIA_EXPORT BASE_DECLARE_FEATURE(
    kShareThisTabInsteadButtonGetDisplayMediaAudio);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kSpeakerChangeDetection);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kSpecCompliantCanPlayThrough);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kSuspendMediaForFrozenFrames);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kSuspendMutedAudio);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kUnifiedAutoplay);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kUseAndroidOverlayForSecureOnly);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kUseFakeDeviceForMediaStream);
#if BUILDFLAG(IS_LINUX)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kAcceleratedVideoDecodeLinux);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kAcceleratedVideoDecodeLinuxGL);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kAcceleratedVideoEncodeLinux);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kVaapiIgnoreDriverChecks);
#endif  // BUILDFLAG(IS_LINUX)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kVaapiOnNvidiaGPUs);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kVaapiLowPowerEncoderGen9x);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kVaapiVideoMinResolutionForPerformance);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kGlobalVaapiLock);
#if defined(ARCH_CPU_X86_FAMILY) && BUILDFLAG(IS_CHROMEOS)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kVaapiH264SWBitrateController);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kVaapiAV1TemporalLayerHWEncoding);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kVaapiVp9SModeHWEncoding);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kVSyncMjpegDecoding);
#endif  // defined(ARCH_CPU_X86_FAMILY) && BUILDFLAG(IS_CHROMEOS)
#if BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_LINUX)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kV4L2H264TemporalLayerHWEncoding);
#endif  // BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_LINUX)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kVideoBlitColorAccuracy);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kVideoPictureInPictureControlsUpdate2024);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kCastVideoEncoderFrameDrop);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kWebCodecsVideoEncoderFrameDrop);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kWebRTCHardwareVideoEncoderFrameDrop);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kWebRTCColorAccuracy);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kWebrtcMediaCapabilitiesParameters);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kWidevinePersistentLicenseSupport);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kResolutionBasedDecoderPriority);

#if BUILDFLAG(IS_ANDROID)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kAllowNonSecureOverlays);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kAutoPictureInPictureAndroid);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaCodecBlockModel);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaCodecCodedSizeGuessing);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaCodecElideEOS);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaControlsExpandGesture);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaDrmPersistentLicense);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaDrmPreprovisioning);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaDrmPreprovisioningAtStartup);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaDrmGetStatusForPolicy);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaDrmQueryInSeparateProcess);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kRequestSystemAudioFocus);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kUseAudioLatencyFromHAL);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kUseSecurityLevelWhenCheckingMediaDrmVersion);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kAllowMediaCodecSoftwareDecoder);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kUseAudioManagerMaxChannelLayout);
#endif  // BUILDFLAG(IS_ANDROID)

#if BUILDFLAG(ENABLE_HLS_DEMUXER)
// This feature enables chrome's built-in HLS parser and demuxer instead of
// Android's MediaPlayer based implementation. When this feature is enabled,
// the media-player based HLS player will NOT be used. This will roll out first
// on android, but will eventually land in desktop chrome as well.
MEDIA_EXPORT BASE_DECLARE_FEATURE(kBuiltInHlsPlayer);
#endif  // BUILDFLAG(ENABLE_HLS_DEMUXER)

#if BUILDFLAG(USE_LINUX_VIDEO_ACCELERATION)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kChromeOSHWVBREncoding);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kLimitConcurrentDecoderInstances);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kUSeSequencedTaskRunnerForVEA);
#if defined(ARCH_CPU_ARM_FAMILY)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kUseGLForScaling);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kPreferGLImageProcessor);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kPreferSoftwareMT21);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kEnableProtectedVulkanDetiling);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kEnableArmHwdrm10bitOverlays);
#if BUILDFLAG(USE_CHROMEOS_PROTECTED_MEDIA)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kEnableArmHwdrm);
#endif  // BUILDFLAG(USE_CHROMEOS_PROTECTED_MEDIA)
#endif  // defined(ARCH_CPU_ARM_FAMILY)
#endif  // BUILDFLAG(USE_LINUX_VIDEO_ACCELERATION)

#if BUILDFLAG(IS_WIN)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kDirectShowGetPhotoState);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kIncludeIRCamerasInDeviceEnumeration);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaFoundationVideoCapture);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaFoundationUseSoftwareRateCtrl);

// For feature check of kMediaFoundationD3D11VideoCapture at runtime,
// please use IsMediaFoundationD3D11VideoCaptureEnabled() instead.
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaFoundationD3D11VideoCapture);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaFoundationD3D11VideoCaptureZeroCopy);

MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaFoundationClearPlayback);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kAllowMediaFoundationFrameServerMode);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kD3D11Vp9kSVCHWDecoding);

// Strategy affecting how Media Foundation Renderer determines its rendering
// mode when used with clear video media. This strategy does not impact
// protected media which must always use Direct Composition mode.
enum class MediaFoundationClearRenderingStrategy {
  // The renderer will operate in Direct Composition mode (e.g. windowless
  // swapchain).
  kDirectComposition,
  // The renderer will operate in Frame Server mode.
  kFrameServer,
  // The renderer is allowed to switch between Direct Composition & Frame Server
  // mode at its discretion.
  kDynamic,
};

// Under this feature, a given MediaFoundationClearRenderingStrategy param is
// used by the Media Foundation Renderer for Clear content scenarios.
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaFoundationClearRendering);
MEDIA_EXPORT extern const base::FeatureParam<
    MediaFoundationClearRenderingStrategy>
    kMediaFoundationClearRenderingStrategyParam;

// Enables the batch audio/video buffers reading for media playback.
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaFoundationBatchRead);

// Specify the batch read count between client renderer and remote renderer,
// default value is 1.
MEDIA_EXPORT extern const base::FeatureParam<int> kBatchReadCount;

#endif  // BUILDFLAG(IS_WIN)

#if BUILDFLAG(ENABLE_PLATFORM_ENCRYPTED_DOLBY_VISION)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kPlatformEncryptedDolbyVision);
MEDIA_EXPORT BASE_DECLARE_FEATURE(
    kAllowClearDolbyVisionInMseWhenPlatformEncryptedDvEnabled);
#endif

#if BUILDFLAG(IS_CHROMEOS)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kBackgroundListening);
#endif  // BUILDFLAG(IS_CHROMEOS)

#if BUILDFLAG(ALLOW_OOP_VIDEO_DECODER)
// Note: please use IsOutOfProcessVideoDecodingEnabled() to determine if OOP-VD
// is enabled instead of directly checking this feature flag. The reason is that
// that function may perform checks beyond the feature flag.
MEDIA_EXPORT BASE_DECLARE_FEATURE(kUseOutOfProcessVideoDecoding);
#endif  // BUILDFLAG(ALLOW_OOP_VIDEO_DECODER)

#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kUseOutOfProcessVideoEncoding);
#endif  // BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS)

MEDIA_EXPORT BASE_DECLARE_FEATURE(kUseSequencedTaskRunnerForMediaService);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kUseSequencedTaskRunnerForMojoVEAProvider);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kUseTaskRunnerForMojoVEAService);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kUseTaskRunnerForMojoAudioDecoderService);

#if BUILDFLAG(IS_FUCHSIA)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kFuchsiaMediacodecVideoEncoder);
#endif  // BUILDFLAG(IS_FUCHSIA)

MEDIA_EXPORT BASE_DECLARE_FEATURE(kVideoDecodeBatching);

MEDIA_EXPORT BASE_DECLARE_FEATURE(
    kClearPipCachedBoundsWhenPermissionPromptVisible);

MEDIA_EXPORT BASE_DECLARE_FEATURE(kUseWindowBoundsForPip);

MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaLogToConsole);

MEDIA_EXPORT BASE_DECLARE_FEATURE(kLibvpxUseChromeThreads);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kLibaomUseChromeThreads);

#if BUILDFLAG(IS_WIN)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kD3D12VideoDecoder);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kD3D12VideoEncodeAccelerator);

MEDIA_EXPORT extern const base::FeatureParam<double> kAudioOffloadBufferTimeMs;
MEDIA_EXPORT BASE_DECLARE_FEATURE(kAudioOffload);
#endif  // BUILDFLAG(IS_WIN)

#if BUILDFLAG(IS_WIN) && defined(ARCH_CPU_ARM64)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaFoundationAcceleratedEncodeOnArm64);
#endif

#if BUILDFLAG(IS_WIN)
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaFoundationD3DVideoProcessing);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaFoundationSharedImageEncode);
#endif

MEDIA_EXPORT BASE_DECLARE_FEATURE(kRenderMutedAudio);

// Enable experimental headless captions.
MEDIA_EXPORT BASE_DECLARE_FEATURE(kHeadlessLiveCaption);

// Based on a |command_line| and the current platform, returns the effective
// autoplay policy. In other words, it will take into account the default policy
// if none is specified via the command line and options passed for testing.
// Returns one of the possible autoplay policy switches from the
// switches::autoplay namespace.
MEDIA_EXPORT std::string GetEffectiveAutoplayPolicy(
    const base::CommandLine& command_line);

MEDIA_EXPORT bool IsChromeWideEchoCancellationEnabled();

// Returns true if loopback-based AEC can be used for audio input streams that
// are configured to do so.
MEDIA_EXPORT bool IsSystemLoopbackAsAecReferenceEnabled();
// Returns true if loopback-based AEC is enabled and its usage is forced, which
// means that loopback-based AEC will be used instead of chrome-wide AEC.
MEDIA_EXPORT bool IsSystemLoopbackAsAecReferenceForcedOn();
#if BUILDFLAG(SYSTEM_LOOPBACK_AS_AEC_REFERENCE)
MEDIA_EXPORT base::TimeDelta GetAecAddedDelay();
MEDIA_EXPORT int GetAecDelayNumFilters();
#endif
MEDIA_EXPORT bool IsSystemEchoCancellationEnforced();
MEDIA_EXPORT bool IsSystemEchoCancellationEnforcedAndAllowAgcInTandem();
MEDIA_EXPORT bool IsSystemEchoCancellationEnforcedAndAllowNsInTandem();
MEDIA_EXPORT bool IsDedicatedMediaServiceThreadEnabled(
    gl::ANGLEImplementation impl);
MEDIA_EXPORT bool IsHardwareSecureDecryptionEnabled();
MEDIA_EXPORT bool IsLiveTranslateEnabled();
MEDIA_EXPORT bool IsVideoCaptureAcceleratedJpegDecodingEnabled();

#if BUILDFLAG(IS_WIN)
MEDIA_EXPORT bool IsMediaFoundationD3D11VideoCaptureEnabled();
#endif

#if BUILDFLAG(ALLOW_OOP_VIDEO_DECODER)
MEDIA_EXPORT bool IsOutOfProcessVideoDecodingEnabled();
#endif  // BUILDFLAG(ALLOW_OOP_VIDEO_DECODER)

// Return bitmask of audio formats supported by EDID.
MEDIA_EXPORT uint32_t GetPassthroughAudioFormats();

}  // namespace media

#endif  // MEDIA_BASE_MEDIA_SWITCHES_H_
