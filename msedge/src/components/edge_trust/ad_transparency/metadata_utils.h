// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_TRUST_AD_TRANSPARENCY_METADATA_H_
#define COMPONENTS_EDGE_TRUST_AD_TRANSPARENCY_METADATA_H_

#include <string>
#include <unordered_set>

#include "base/values.h"
#include "components/edge_trust/ad_transparency/ads_metadata.h"
#include "third_party/abseil-cpp/absl/types/optional.h"

namespace edge_trust {

using ParsingLoggingMethod =
    std::function<void(const std::string&, bool is_warning)>;

AdsMetadata ParseAdsMetadata(
    std::string json_metadata,
    std::optional<ParsingLoggingMethod> logger = std::nullopt);

AdsMetadataStatus ParseAdTechProviders(
    const base::Value* atps_data,
    std::vector<AdvertisingId>& ad_tech_providers);
AdsMetadataStatus ParseAdvertisingId(const base::Value* platform_data,
                                     AdvertisingId& platform);
AdsMetadataStatus ParseAdCategory(const base::Value* category_data,
                                  AdCategory& category);
AdsMetadataStatus ParseAds(const base::Value* ads_data,
                           std::vector<AdData>& ads,
                           std::optional<ParsingLoggingMethod> logger);

AdCategory MergeAdCategories(const AdCategory& category1,
                             const AdCategory& category2);
GeoLocation MergeGeolocationValues(GeoLocation existing_value,
                                   GeoLocation new_value);
RemarketingType MergeRemarketingValues(RemarketingType existing_value,
                                       RemarketingType new_value);
std::vector<UserCharacteristics> MergeUserCharacteristicsValues(
    std::vector<UserCharacteristics> existing_value,
    std::vector<UserCharacteristics> new_value);
bool MergeUserInterestsValues(bool existing_value, bool new_value);
bool MergeContextualValues(bool existing_value, bool new_value);
Lookalike MergeLookalikeValues(Lookalike existing_value, Lookalike new_value);
bool MergeOtherValues(bool existing_value, bool new_value);

// Takes in a list of AdsMetadata and lossy filters it into a base::Value list
// structure that can be used in Web UIs
[[nodiscard]] bool ParseAndFilterAdsMetadataIntoValueForWebUI(
    const std::unordered_set<AdsMetadata>& ads_metadata,
    base::Value::List* list);

[[nodiscard]] bool ParseAndFormatAdDataIntoValue(
    const std::vector<AdData>& ads_data,
    base::Value::List* list);

[[nodiscard]] bool ParseAndFormatAdTargetingIntoValue(
    const AdCategory& ad_metadata,
    base::Value::List* list);

// Serialize the AdCategory struct into a base::Value for storage.
base::Value AdCategoryToValue(const AdCategory& ad_category);
AdCategory AdCategoryFromValue(base::Value* dict);

}  // namespace edge_trust
#endif  // COMPONENTS_EDGE_TRUST_AD_TRANSPARENCY_METADATA_H_
