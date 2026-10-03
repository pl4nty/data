// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef MEDIA_BASE_EDGE_MEDIA_SWITCHES_H_
#define MEDIA_BASE_EDGE_MEDIA_SWITCHES_H_

#include "base/feature_list.h"
#include "media/base/media_export.h"

namespace media {

MEDIA_EXPORT BASE_DECLARE_FEATURE(kEdgeLiveCaption);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kEdgeLiveCaptionMultiLanguage);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kEdgeLiveCaptionSettingsTrigger);
MEDIA_EXPORT BASE_DECLARE_FEATURE(kMediaFoundationCdm);

}  // namespace media

#endif  // MEDIA_BASE_EDGE_MEDIA_SWITCHES_H_
