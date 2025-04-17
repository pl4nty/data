// Copyright 2020 The Chromium Authors. All rights reserved.
// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef MEDIA_BASE_EDGE_SPEECH_TRANSLATION_CLIENT_H_
#define MEDIA_BASE_EDGE_SPEECH_TRANSLATION_CLIENT_H_

#include <memory>

#include "base/functional/callback.h"
#include "media/base/audio_buffer.h"
#include "media/base/media_export.h"
#include "media/mojo/mojom/edge_live_dubbing_types.mojom.h"

namespace media {

struct AudioRendererAlgorithmParameters;

// Edge specific speech translation client interface.
// This class has similar implementation as upstream class
// SpeechRecognitionClient. For any change in upstream for
// SpeechRecognitionClient, check if those changes are needed to be incorporated
// in this class or not.
class MEDIA_EXPORT EdgeSpeechTranslationClient {
 public:
  virtual ~EdgeSpeechTranslationClient() = default;

  virtual void SetMediaPlayerId(int player_id) = 0;

  using OnUpdateLiveDubbingStateCallback =
      base::RepeatingCallback<void(media::mojom::LiveDubbingState)>;
  virtual void SetOnUpdateLiveDubbingStateCallback(
      OnUpdateLiveDubbingStateCallback callback) = 0;

  // Returns true if the live dubbing is enabled.
  virtual bool IsLiveDubbingEnabled() = 0;

  // Returns true if the live dubbing is enabled and recognizer is available
  // i.e. bound.
  virtual bool IsLiveDubbingRecognitionAvailable() = 0;

  virtual void EndOfAudio() = 0;

  // Returns the params required for the live dubbing scenario.
  virtual std::optional<::media::AudioRendererAlgorithmParameters>
  GetAudioRendererAlgorithmParameters() = 0;

  virtual void SetAudioParameters(
      const media::AudioParameters& audio_params) = 0;

  virtual void AudioRendererGettingDestroyed() = 0;

  virtual void AddAudio(scoped_refptr<AudioBuffer> buffer) = 0;

  using OnReadyCallback = base::OnceCallback<void()>;
  virtual void SetOnReadyCallback(OnReadyCallback callback) = 0;
};

}  // namespace media

#endif  // MEDIA_BASE_EDGE_SPEECH_TRANSLATION_CLIENT_H_
