// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef UI_GFX_MOJOM_EDGE_VIDEO_PROCESSING_TYPE_MOJOM_TRAITS_H_
#define UI_GFX_MOJOM_EDGE_VIDEO_PROCESSING_TYPE_MOJOM_TRAITS_H_

#include "base/notreached.h"
#include "mojo/public/cpp/bindings/enum_traits.h"
#include "ui/gfx/edge_video_processing_types.h"
#include "ui/gfx/mojom/edge_video_processing_type.mojom-shared.h"

namespace mojo {

template <>
struct EnumTraits<gfx::mojom::VideoProcessingType, gfx::VideoProcessingType> {
  static gfx::mojom::VideoProcessingType ToMojom(
      gfx::VideoProcessingType input) {
    switch (input) {
      case gfx::VideoProcessingType::kDefault:
        return gfx::mojom::VideoProcessingType::kDefault;
      case gfx::VideoProcessingType::kBicubic:
        return gfx::mojom::VideoProcessingType::kBicubic;
      case gfx::VideoProcessingType::kLanczos:
        return gfx::mojom::VideoProcessingType::kLanczos;
      case gfx::VideoProcessingType::kCAS:
        return gfx::mojom::VideoProcessingType::kCAS;
      case gfx::VideoProcessingType::kFSR:
        return gfx::mojom::VideoProcessingType::kFSR;
      case gfx::VideoProcessingType::kmsSuperResolution:
        return gfx::mojom::VideoProcessingType::kmsSuperResolution;
      case gfx::VideoProcessingType::kmsGraphicsDriverEnhancement:
        return gfx::mojom::VideoProcessingType::kmsGraphicsDriverEnhancement;
    }
    NOTREACHED();
  }

  static gfx::VideoProcessingType FromMojom(
      gfx::mojom::VideoProcessingType input) {
    switch (input) {
      case gfx::mojom::VideoProcessingType::kDefault:
        return gfx::VideoProcessingType::kDefault;
      case gfx::mojom::VideoProcessingType::kBicubic:
        return gfx::VideoProcessingType::kBicubic;
      case gfx::mojom::VideoProcessingType::kLanczos:
        return gfx::VideoProcessingType::kLanczos;
      case gfx::mojom::VideoProcessingType::kCAS:
        return gfx::VideoProcessingType::kCAS;
      case gfx::mojom::VideoProcessingType::kFSR:
        return gfx::VideoProcessingType::kFSR;
      case gfx::mojom::VideoProcessingType::kmsSuperResolution:
        return gfx::VideoProcessingType::kmsSuperResolution;
      case gfx::mojom::VideoProcessingType::kmsGraphicsDriverEnhancement:
        return gfx::VideoProcessingType::kmsGraphicsDriverEnhancement;
    }
    NOTREACHED();
  }
};

}  // namespace mojo

#endif  // UI_GFX_MOJOM_EDGE_VIDEO_PROCESSING_TYPE_MOJOM_TRAITS_H_
