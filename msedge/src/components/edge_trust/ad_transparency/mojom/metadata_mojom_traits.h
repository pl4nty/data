// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_TRUST_AD_TRANSPARENCY_MOJOM_METADATA_MOJOM_TRAITS_H_
#define COMPONENTS_EDGE_TRUST_AD_TRANSPARENCY_MOJOM_METADATA_MOJOM_TRAITS_H_

#include "components/edge_trust/ad_transparency/ads_metadata.h"

#include "components/edge_trust/ad_transparency/mojom/ad_transparency.mojom-shared.h"
#include "mojo/public/cpp/bindings/enum_traits.h"
#include "mojo/public/cpp/bindings/struct_traits.h"

namespace mojo {
template <>
struct COMPONENT_EXPORT(TRAITS)
    StructTraits<edge_trust::mojom::AdvertisingIdDataView,
                 edge_trust::AdvertisingId> {
  static const edge_trust::AdvertisingIdType& type(
      const edge_trust::AdvertisingId& data) {
    return data.type;
  }

  static const std::string& id(const edge_trust::AdvertisingId& data) {
    return data.id;
  }

  static const std::string& name(const edge_trust::AdvertisingId& data) {
    return data.name;
  }

  static bool Read(edge_trust::mojom::AdvertisingIdDataView,
                   edge_trust::AdvertisingId* out);
};

template <>
struct COMPONENT_EXPORT(TRAITS)
    StructTraits<edge_trust::mojom::AdCategoryDataView,
                 edge_trust::AdCategory> {
  static const edge_trust::GeoLocation& geo_location(
      const edge_trust::AdCategory& data) {
    return data.geo_location;
  }

  static const edge_trust::RemarketingType& remarketing_type(
      const edge_trust::AdCategory& data) {
    return data.remarketing_type;
  }

  static const std::vector<edge_trust::UserCharacteristics>&
  user_characteristics(const edge_trust::AdCategory& data) {
    return data.user_characteristics;
  }

  static bool user_interests(const edge_trust::AdCategory& data) {
    return data.user_interests;
  }

  static bool contextual(const edge_trust::AdCategory& data) {
    return data.contextual;
  }

  static bool device(const edge_trust::AdCategory& data) { return data.device; }

  static const edge_trust::Lookalike& lookalike(
      const edge_trust::AdCategory& data) {
    return data.lookalike;
  }

  static bool other(const edge_trust::AdCategory& data) { return data.other; }

  static bool Read(edge_trust::mojom::AdCategoryDataView,
                   edge_trust::AdCategory* out);
};

template <>
struct COMPONENT_EXPORT(TRAITS)
    StructTraits<edge_trust::mojom::AdDataDataView, edge_trust::AdData> {
  static const std::string& id(const edge_trust::AdData& data) {
    return data.id;
  }

  static const GURL& advertiser_domain(const edge_trust::AdData& data) {
    return data.advertiser_domain;
  }

  static const std::string& advertiser_name(const edge_trust::AdData& data) {
    return data.advertiser_name;
  }

  static const edge_trust::AdType& type(const edge_trust::AdData& data) {
    return data.type;
  }

  static bool Read(edge_trust::mojom::AdDataDataView, edge_trust::AdData* out);
};

template <>
struct COMPONENT_EXPORT(TRAITS)
    StructTraits<edge_trust::mojom::AdsMetadataDataView,
                 edge_trust::AdsMetadata> {
  static const std::vector<edge_trust::AdvertisingId>& ad_tech_providers(
      const edge_trust::AdsMetadata& data) {
    return data.ad_tech_providers;
  }

  static const edge_trust::AdCategory& sale_category(
      const edge_trust::AdsMetadata& data) {
    return data.sale_category;
  }

  static const edge_trust::AdvertisingId& advertising_platform(
      const edge_trust::AdsMetadata& data) {
    return data.advertising_platform;
  }

  static const edge_trust::AdCategory& targeting_category(
      const edge_trust::AdsMetadata& data) {
    return data.targeting_category;
  }

  static const std::vector<edge_trust::AdData>& ads(
      const edge_trust::AdsMetadata& data) {
    return data.ads;
  }

  static const edge_trust::AdsMetadataStatus& status(
      const edge_trust::AdsMetadata& data) {
    return data.status;
  }

  static bool Read(edge_trust::mojom::AdsMetadataDataView,
                   edge_trust::AdsMetadata* out);
};

// Enum type conversions below here.
template <>
struct COMPONENT_EXPORT(TRAITS) EnumTraits<edge_trust::mojom::AdsMetadataStatus,
                                           edge_trust::AdsMetadataStatus> {
  static edge_trust::mojom::AdsMetadataStatus ToMojom(
      edge_trust::AdsMetadataStatus input);
  static bool FromMojom(edge_trust::mojom::AdsMetadataStatus input,
                        edge_trust::AdsMetadataStatus* output);
};

template <>
struct COMPONENT_EXPORT(TRAITS) EnumTraits<edge_trust::mojom::AdvertisingIdType,
                                           edge_trust::AdvertisingIdType> {
  static edge_trust::mojom::AdvertisingIdType ToMojom(
      edge_trust::AdvertisingIdType input);
  static bool FromMojom(edge_trust::mojom::AdvertisingIdType input,
                        edge_trust::AdvertisingIdType* output);
};

template <>
struct COMPONENT_EXPORT(TRAITS)
    EnumTraits<edge_trust::mojom::GeoLocation, edge_trust::GeoLocation> {
  static edge_trust::mojom::GeoLocation ToMojom(edge_trust::GeoLocation input);
  static bool FromMojom(edge_trust::mojom::GeoLocation input,
                        edge_trust::GeoLocation* output);
};

template <>
struct COMPONENT_EXPORT(TRAITS) EnumTraits<edge_trust::mojom::RemarketingType,
                                           edge_trust::RemarketingType> {
  static edge_trust::mojom::RemarketingType ToMojom(
      edge_trust::RemarketingType input);
  static bool FromMojom(edge_trust::mojom::RemarketingType input,
                        edge_trust::RemarketingType* output);
};

template <>
struct COMPONENT_EXPORT(TRAITS)
    EnumTraits<edge_trust::mojom::UserCharacteristics,
               edge_trust::UserCharacteristics> {
  static edge_trust::mojom::UserCharacteristics ToMojom(
      edge_trust::UserCharacteristics input);
  static bool FromMojom(edge_trust::mojom::UserCharacteristics input,
                        edge_trust::UserCharacteristics* output);
};

template <>
struct COMPONENT_EXPORT(TRAITS)
    EnumTraits<edge_trust::mojom::Lookalike, edge_trust::Lookalike> {
  static edge_trust::mojom::Lookalike ToMojom(edge_trust::Lookalike input);
  static bool FromMojom(edge_trust::mojom::Lookalike input,
                        edge_trust::Lookalike* output);
};

template <>
struct COMPONENT_EXPORT(TRAITS)
    EnumTraits<edge_trust::mojom::AdType, edge_trust::AdType> {
  static edge_trust::mojom::AdType ToMojom(edge_trust::AdType input);
  static bool FromMojom(edge_trust::mojom::AdType input,
                        edge_trust::AdType* output);
};

}  // namespace mojo

#endif  // COMPONENTS_EDGE_TRUST_AD_TRANSPARENCY_MOJOM_METADATA_MOJOM_TRAITS_H_
