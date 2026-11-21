// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef UI_GFX_EDGE_VIDEO_PROCESSING_TYPES_H_
#define UI_GFX_EDGE_VIDEO_PROCESSING_TYPES_H_

#include <string>

namespace gfx {

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// LINT.IfChange(VideoProcessingType)
enum class VideoProcessingType {
  kDefault,
  kBicubic,
  kLanczos,
  kCAS,
  kFSR = 4,                      // Deprecated
  kmsSuperResolution,            // Deprecated
  kmsGraphicsDriverEnhancement,  // Deprecated
  kMaxValue = kmsGraphicsDriverEnhancement,
};
// LINT.ThenChange(//tools/metrics/histograms/edge_enums.xml:Microsoft.Media.MsVideoProcessingType)

enum class VideoProcessingSupportResult {
  kNone,
  kAll,
  kMaxValue = kAll,
};

inline VideoProcessingType StringToVideoProcessingType(std::string value) {
  if (value == "bicubic") {
    return gfx::VideoProcessingType::kBicubic;
  } else if (value == "lanczos") {
    return gfx::VideoProcessingType::kLanczos;
  } else if (value == "cas") {
    return gfx::VideoProcessingType::kCAS;
  } else if (value == "msSuperResolution") {
    return gfx::VideoProcessingType::kmsSuperResolution;
  } else if (value == "msGraphicsDriverEnhancement") {
    return gfx::VideoProcessingType::kmsGraphicsDriverEnhancement;
  }
  return gfx::VideoProcessingType::kDefault;
}

inline std::string VideoProcessingTypeToString(
    gfx::VideoProcessingType process_type) {
  switch (process_type) {
    case gfx::VideoProcessingType::kBicubic: {
      return "bicubic";
    }
    case gfx::VideoProcessingType::kLanczos: {
      return "lanczos";
    }
    case gfx::VideoProcessingType::kCAS: {
      return "cas";
    }
    case gfx::VideoProcessingType::kmsSuperResolution: {
      return "msSuperResolution";
    }
    case gfx::VideoProcessingType::kmsGraphicsDriverEnhancement: {
      return "msGraphicsDriverEnhancement";
    }
    default:
      return "default";
  }
}

}  // namespace gfx

#endif  // UI_GFX_EDGE_VIDEO_PROCESSING_TYPES_H_
