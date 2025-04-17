// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_TRUST_AD_TRANSPARENCY_OPTIONS_H_
#define COMPONENTS_EDGE_TRUST_AD_TRANSPARENCY_OPTIONS_H_

#include <string>
#include <vector>

#include "url/gurl.h"

namespace edge_trust {

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with "Microsoft.TransparentAdvertisers.MetadataStatus" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class AdsMetadataStatus {
  kSuccess = 0,
  kInvalidMetadata = 1,
  kMissingPlatform = 2,
  kIncorrectPlatformType = 3,
  kMissingCategory = 4,
  kIncorrectCategoryType = 5,
  kMissingAds = 6,
  kIncorrectAdsType = 7,
  kMissingIdType = 8,
  kInvalidIdType = 9,
  kMissingId = 10,
  kInvalidId = 11,
  kMissingName = 12,
  kInvalidName = 13,
  kMissingGeoLocation = 14,
  kInvalidGeoLocation = 15,
  kMissingRemarketing = 16,
  kInvalidRemarketing = 17,
  kMissingUserCharacteristics = 18,
  kInvalidUserCharacteristics = 19,
  kMissingUserInterests = 20,
  kInvalidUserInterests = 21,
  kMissingContextual = 22,
  kInvalidContextual = 23,
  kMissingDevice = 24,
  kInvalidDevice = 25,
  kMissingLookalike = 26,
  kInvalidLookalike = 27,
  kMissingOther = 28,
  kInvalidOther = 29,
  kInvalidAd = 30,
  kMaxValue = kInvalidAd,
};

enum class AdvertisingIdType {
  GOOGLE = 0,
  IAB = 1,
  kMaxValue = IAB,
};

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with "Microsoft.TransparentAdvertisers.Geolocation" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class GeoLocation {
  NOT_DISCLOSED = 0,
  NOT_USED = 1,
  APPROXIMATE = 2,
  PRECISE = 3,
  UNKNOWN_TYPE = 4,
  kMaxValue = UNKNOWN_TYPE,
};

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with "Microsoft.TransparentAdvertisers.RemarketingType"
// in src/tools/metrics/histograms/edge_enums.xml.
enum class RemarketingType {
  NOT_DISCLOSED = 0,
  NOT_USED = 1,
  THIRD_PARTY = 2,
  WEBSITE_VISIT = 3,
  UNKNOWN_TYPE = 4,
  kMaxValue = UNKNOWN_TYPE,
};

enum class UserCharacteristics {
  NOT_USED = 0,
  GENDER = 1,
  AGE_GROUP = 2,
  UNKNOWN_TYPE = 3,
  JOB = 4,
  INDUSTRY = 5,
  INCOME = 6,
  LIFE_STAGE = 7,
  kMaxValue = LIFE_STAGE,
};

// These values are persisted to logs. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with "Microsoft.TransparentAdvertisers.Lookalike" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class Lookalike {
  NOT_DISCLOSED = 0,
  NOT_USED = 1,
  SIMILAR_AUDIENCE = 2,
  ID_MATCH = 3,
  kMaxValue = ID_MATCH,
};

enum class AdType {
  BANNER = 0,
  VIDEO = 1,
  AUDIO = 2,
  NATIVE = 3,
  OTHER = 4,
  kMaxValue = OTHER,
};

struct AdvertisingId {
  AdvertisingIdType type = AdvertisingIdType::GOOGLE;
  std::string id;
  std::string name;
};
bool operator==(const AdvertisingId& x, const AdvertisingId& y);

struct AdCategory {
  AdCategory();
  AdCategory(const AdCategory& other);
  ~AdCategory();

  GeoLocation geo_location = GeoLocation::NOT_DISCLOSED;
  RemarketingType remarketing_type = RemarketingType::NOT_DISCLOSED;
  std::vector<UserCharacteristics> user_characteristics;
  bool user_interests = false;
  bool contextual = false;
  bool device = false;
  Lookalike lookalike = Lookalike::NOT_DISCLOSED;
  bool other = false;
};

struct AdData {
  AdData();
  AdData(const AdData& other);
  ~AdData();

  std::string id;
  GURL advertiser_domain;
  std::string advertiser_name;
  AdType type = AdType::OTHER;
};
bool operator==(const AdData& x, const AdData& y);

struct AdsMetadata {
  AdsMetadata();
  AdsMetadata(const AdsMetadata& other);
  ~AdsMetadata();

  // All AdvertisingId's involved in providing the ad, typically the SSP that
  // performed the auction.
  std::vector<AdvertisingId> ad_tech_providers;
  // The category information associated with the bidding and sale process of
  // the ad auction.
  AdCategory sale_category;

  // The end party that showed the ad, typically the winning DSP.
  AdvertisingId advertising_platform;
  // The category information associated with the |advertising_platform|.
  AdCategory targeting_category;

  // All ads associated with this |advertising_platform|.
  std::vector<AdData> ads;

  AdsMetadataStatus status = AdsMetadataStatus::kSuccess;

  bool is_valid() const { return status == AdsMetadataStatus::kSuccess; }
  void AddAdIfValid(AdData ad);
  void AddProviderIfValid(AdvertisingId ad_tech_provider);
};
bool operator==(const AdsMetadata& x, const AdsMetadata& y);

}  // namespace edge_trust

namespace {
// Use the same HashCombine method that Mojo and other parts of Chromium use for
// consistency.
size_t HashCombine(size_t hash1, size_t hash2) {
  // Based on proposal in:
  // http://www.open-std.org/JTC1/SC22/WG21/docs/papers/2005/n1756.pdf
  return hash1 ^ (hash2 + (hash1 << 6) + (hash1 >> 2));
}
}  // namespace

namespace std {
template <>
struct hash<edge_trust::AdsMetadata> {
  std::size_t operator()(
      const edge_trust::AdsMetadata& metadata) const noexcept {
    // Our AdsMetadata is keyed off of our advertising platform so each field
    // should make up the hash for a given element.
    return HashCombine(
        HashCombine(
            std::hash<std::string>()(metadata.advertising_platform.id),
            std::hash<std::string>()(metadata.advertising_platform.name)),
        std::hash<int>()(static_cast<int>(metadata.advertising_platform.type)));
  }
};
}  // namespace std

#endif  // COMPONENTS_EDGE_TRUST_AD_TRANSPARENCY_OPTIONS_H_
