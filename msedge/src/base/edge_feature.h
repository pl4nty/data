// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef BASE_EDGE_FEATURE_H_
#define BASE_EDGE_FEATURE_H_

#include <cstddef>
#include <cstdint>
#include <string_view>
#include <type_traits>

#include "base/compiler_specific.h"
#include "base/feature.h"
#include "base/feature_internal.h"
#include "base/logging.h"
#include "base/memory/raw_ptr_exclusion.h"
#include "base/notreached.h"

namespace base {

// Specifies which Copilot app contexts an Edge Copilot feature (declared with
// BASE_COPILOT_FEATURE) is allowed to be enabled in. Checked by
// copilot::internal::IsCurrentProcessAllowedForAppType.
enum class CopilotAppType : uint8_t {
  // The feature does not apply to copilot.
  kNone = 0,
  // The feature applies to both the legacy consumer copilot app and the new
  // unified copilot app.
  kAll = 1,
  // The feature applies only to the legacy consumer copilot app (which will
  // eventually be deprecated).
  kLegacyConsumerOnly = 2,
  // The feature applies only to the new unified copilot app.
  kUnifiedOnly = 3,
};

enum class EdgeFeatureKind : uint8_t { kNormal, kRuntime, kFirstRun };

// Describes Edge behaviors, not whether a feature is currently enabled.
struct EdgeFeatureTraits {
  EdgeFeatureKind kind = EdgeFeatureKind::kNormal;
  CopilotAppType copilot_app_type = CopilotAppType::kNone;
  bool has_holdout = false;

  friend constexpr bool operator==(const EdgeFeatureTraits&,
                                   const EdgeFeatureTraits&) = default;
};

struct LOGICALLY_CONST EdgeRuntimeFeature;
struct LOGICALLY_CONST EdgeFirstRunFeature;
struct LOGICALLY_CONST EdgeCopilotFeature;
struct LOGICALLY_CONST EdgeFeatureWithHoldout;
struct LOGICALLY_CONST EdgeFirstRunFeatureWithHoldout;

namespace internal {

// ASCII "EDGE". Distinguishes a real `EdgeHeader` from unrelated bytes if a
// non-Edge wrapper happens to place its state at `EdgeFeature`'s state offset.
inline constexpr uint32_t kEdgeHeaderCookie = 0x45444745;

struct EdgeHeader {
  uint32_t cookie = kEdgeHeaderCookie;
  EdgeFeatureTraits traits{};
  uint8_t reserved = 0;
};
// `EdgeHeader` is embedded in every `EdgeFeature`, so growing it beyond 8 bytes
// increases the `.data` size of all Edge feature kinds—even those that do not
// use the new metadata.
//
// When adding new Edge feature metadata:
// 1. Small flags/enums: pack into `EdgeFeatureTraits` (using bitfields or
//    `reserved`) so `sizeof(EdgeHeader)` stays 8 bytes.
// 2. Larger payloads (e.g., pointers): do NOT grow `EdgeHeader` or
//    `EdgeFeature`. Instead, add a presence bit in `EdgeFeatureTraits` and
//    store the payload on an opt-in `EdgeFeature` subclass (see
//    `EdgeFeatureWithHoldoutBase` + `traits.has_holdout`).
static_assert(
    sizeof(EdgeHeader) == 8,
    "Keep EdgeHeader at 8 bytes; pack small traits into EdgeFeatureTraits or "
    "move larger payloads to an EdgeFeature subclass.");

class LOGICALLY_CONST EdgeFeatureWithHoldoutBase;

constexpr void ValidateEdgeFeatureKind(EdgeFeatureKind kind) {
  switch (kind) {
    case EdgeFeatureKind::kNormal:
    case EdgeFeatureKind::kRuntime:
    case EdgeFeatureKind::kFirstRun:
      return;
  }
  NOTREACHED();
}

constexpr void ValidateEdgeCopilotAppType(CopilotAppType copilot_app_type) {
  switch (copilot_app_type) {
    case CopilotAppType::kNone:
    case CopilotAppType::kAll:
    case CopilotAppType::kLegacyConsumerOnly:
    case CopilotAppType::kUnifiedOnly:
      return;
  }
  NOTREACHED();
}

constexpr void* TagEdgeFeatureStateStorage(FeatureState default_state,
                                           FeatureStateStorage& storage) {
  switch (default_state) {
    case FEATURE_DISABLED_BY_DEFAULT:
      return TagFeatureStateStorage<FEATURE_DISABLED_BY_DEFAULT>(storage);
    case FEATURE_ENABLED_BY_DEFAULT:
      return TagFeatureStateStorage<FEATURE_ENABLED_BY_DEFAULT>(storage);
    case FEATURE_DISABLED_FOR_COUNTRIES:
    case FEATURE_ENABLED_FOR_COUNTRIES:
      LOG(FATAL) << "Pass a country-specific default state if and only if you "
                    "are using FeatureWithCountryRestriction.";
  }
  NOTREACHED();
}

// Base class for Edge features that carry metadata.
//
// Memory layout on 64-bit (`tagged_state` points to the feature's state):
//
//   Regular `base::Feature` (16 B in .rdata)      External State (4 B in .data)
//   +0          +8                                +0
//   +-----------+--------------+                  +-------------+
//   | name (8B) | tagged_state |----------------->| word (4B)   |
//   +-----------+--------------+                  +-------------+
//
//   `internal::EdgeFeature` (32 B in .data)
//   +0          +8              +16                    +24           +28
//   +-----------+--------------+----------------------+-------------+-----+
//   | name (8B) | tagged_state | header_ (EdgeHeader) | edge_state_ | pad |
//   |           |              |  cookie: 'EDGE' (4B) |  word (4B)  | (4B)|
//   |           |              |  traits: 3B + 1B pad |             |     |
//   +-----------+--------------+----------------------+-------------+-----+
//                      |                                     ^
//                      +-------------------------------------+
//                           tagged_state -> edge_state_ (+24)
//
// Embedding `edge_state_` after `header_` makes `EdgeFeature` self-describing
// through a plain `const Feature&` without growing `base::Feature` or using
// RTTI / virtual dispatch: the fixed distance from `&feature` to `edge_state_`
// identifies an `EdgeFeature` and guarantees the `header_` bytes between them
// belong to the same allocation.
class LOGICALLY_CONST EdgeFeature : public Feature {
 public:
  EdgeFeature(const EdgeFeature&) = delete;
  EdgeFeature& operator=(const EdgeFeature&) = delete;

  // Recognizes an `EdgeFeature` from a type-erased `const Feature&` in two
  // steps and returns its traits (or default traits for non-Edge features):
  // 1. Offset check: verifies `tagged_state` points to `edge_state_` at
  //    `kStateOffset`. `FeatureMacroHandshake` restricts `Feature` construction
  //    to `base` macros: regular `Feature`s place `const Feature` in a
  //    read-only section and `FeatureStateStorage` in a separate writable
  //    section (never at `+kStateOffset`), and `DynamicFeature`s embed state
  //    immediately after `Feature` (`+sizeof(Feature)`). Both fail this check
  //    with zero extra memory reads.
  // 2. Cookie check: once the offset check confirms `[&feature, &edge_state_]`
  //    lies within one wrapper allocation, reads the sandwiched `header_` at
  //    `kHeaderOffset` and checks `kEdgeHeaderCookie` to rule out non-Edge
  //    wrappers with a coincidental state offset.
  static EdgeFeatureTraits GetTraits(const Feature& feature,
                                     void* tagged_state) {
    // `EdgeFeature` is non-standard-layout (both `Feature` and `EdgeFeature`
    // declare non-static members). TODO(crbug.com/40285259): Remove this
    // `#pragma` once upstream also adds `-Wno-invalid-offsetof` to
    // `cflags_objcc` (`.mm` builds) in `build/config/compiler/BUILD.gn`.
#if defined(__clang__) || defined(__GNUC__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Winvalid-offsetof"
#endif
    static constexpr uintptr_t kHeaderOffset = offsetof(EdgeFeature, header_);
    static constexpr uintptr_t kStateOffset =
        offsetof(EdgeFeature, edge_state_);
#if defined(__clang__) || defined(__GNUC__)
#pragma GCC diagnostic pop
#endif

    // Ensures `header_` sits in the mapped memory between `Feature` and
    // `edge_state_` and keeps `kStateOffset` distinct from `DynamicFeature`.
    static_assert(
        kHeaderOffset == sizeof(Feature) &&
            kStateOffset == kHeaderOffset + sizeof(EdgeHeader),
        "EdgeFeature::header_ must sit immediately between Feature and "
        "edge_state_; do not reorder them.");

    // Ensures `&feature + kHeaderOffset` is validly aligned to dereference as
    // `const EdgeHeader*` on any `Feature`.
    static_assert(
        alignof(Feature) >= alignof(EdgeHeader) &&
            kHeaderOffset % alignof(EdgeHeader) == 0,
        "self + kHeaderOffset must be aligned for EdgeHeader on any Feature.");

    // `GetFeatureStateWord` returns `&FeatureStateStorage::word`; if fields are
    // ever added before `word`, include `offsetof(FeatureStateStorage, word)`
    // in `kStateOffset`.
    static_assert(
        offsetof(FeatureStateStorage, word) == 0,
        "Update kStateOffset to include offsetof(FeatureStateStorage, word).");

    const uintptr_t self = reinterpret_cast<uintptr_t>(&feature);
    const uintptr_t state_word =
        reinterpret_cast<uintptr_t>(GetFeatureStateWord(tagged_state));
    if (state_word != self + kStateOffset) {
      return EdgeFeatureTraits();
    }
    const auto* header =
        reinterpret_cast<const EdgeHeader*>(self + kHeaderOffset);
    return header->cookie == kEdgeHeaderCookie ? header->traits
                                               : EdgeFeatureTraits();
  }

 private:
  friend struct base::EdgeRuntimeFeature;
  friend struct base::EdgeFirstRunFeature;
  friend struct base::EdgeCopilotFeature;
  friend class EdgeFeatureWithHoldoutBase;

  constexpr EdgeFeature(const char* feature_name,
                        FeatureState feature_default_state,
                        EdgeFeatureTraits traits,
                        FeatureMacroHandshake handshake)
      : Feature(feature_name,
                TagEdgeFeatureStateStorage(feature_default_state, edge_state_),
                handshake),
        header_{.cookie = kEdgeHeaderCookie, .traits = traits},
        edge_state_{
            MakeFeatureStateCacheInitialValue(/*is_runtime_mutable=*/false)} {
    ValidateEdgeFeatureKind(traits.kind);
    ValidateEdgeCopilotAppType(traits.copilot_app_type);
  }

  // Do not reorder: `GetTraits` relies on `header_` preceding `edge_state_`.
  const EdgeHeader header_;
  mutable FeatureStateStorage edge_state_;
};

// Opt-in `EdgeFeature` extension for features that carry a `holdout_` pointer.
// Keeping pointer-sized metadata on a subclass (gated by `traits.has_holdout`)
// rather than in `EdgeHeader` / `EdgeFeature` avoids inflating `EdgeFeature`
// instances that do not use holdouts.
//
// Memory layout on 64-bit (40 B in .data):
//   +0              +16            +24           +28   +32
//   +---------------+--------------+-------------+-----+-------------------+
//   | Feature (16B) | header_ (8B) | edge_state_ | pad | holdout_ (8B ptr) |
//   +---------------+--------------+-------------+-----+-------------------+
class LOGICALLY_CONST EdgeFeatureWithHoldoutBase : public EdgeFeature {
 public:
  constexpr const Feature* holdout() const { return holdout_; }

 private:
  friend struct base::EdgeFeatureWithHoldout;
  friend struct base::EdgeFirstRunFeatureWithHoldout;

  constexpr EdgeFeatureWithHoldoutBase(const char* feature_name,
                                       FeatureState feature_default_state,
                                       EdgeFeatureKind kind,
                                       const Feature* holdout_feature,
                                       FeatureMacroHandshake handshake)
      : EdgeFeature(feature_name,
                    feature_default_state,
                    {.kind = kind, .has_holdout = holdout_feature != nullptr},
                    handshake),
        holdout_(holdout_feature) {}

  RAW_PTR_EXCLUSION const Feature* const holdout_;
};

// Edge features are passed to `FeatureList` as `const Feature&` and inspected
// without RTTI or virtual dispatch (`EdgeFeature::GetTraits` uses fixed byte
// offsets from `&feature`, and `GetEdgeFeatureHoldout` downcasts when
// `traits.has_holdout` is set).
//
// Consequently, macro-instantiated leaf types must be zero-overhead wrappers
// around `EdgeFeature` (or `EdgeFeatureWithHoldoutBase`):
// - No leaf member fields (invisible through `const Feature&`; see `EdgeHeader`
//   above for how to add new metadata).
// - No virtual methods or stricter alignment (would shift `&feature` within the
//   derived object and break offset math).
// - Non-copyable and trivially destructible (`constinit` globals identified by
//   address with no exit-time destructors).
template <typename T>
inline constexpr bool kIsValidEdgeMacroFeatureType =
    std::is_base_of_v<EdgeFeature, T> &&
    sizeof(T) == (std::is_base_of_v<EdgeFeatureWithHoldoutBase, T>
                      ? sizeof(EdgeFeatureWithHoldoutBase)
                      : sizeof(EdgeFeature)) &&
    alignof(T) == alignof(Feature) && !std::is_polymorphic_v<T> &&
    std::is_trivially_destructible_v<T> && !std::is_copy_constructible_v<T>;

template <typename T>
constexpr FeatureMacroHandshake MakeEdgeMacroHandshake() {
  static_assert(kIsValidEdgeMacroFeatureType<T>,
                "Invalid EdgeFeature type; see kIsValidEdgeMacroFeatureType.");
  return FeatureMacroHandshake::kSecret;
}

}  // namespace internal

inline EdgeFeatureTraits GetEdgeFeatureTraits(const Feature& feature) {
  return internal::EdgeFeature::GetTraits(feature, feature.tagged_state);
}

inline bool HasEdgeFeatureMetadata(const Feature& feature) {
  return GetEdgeFeatureTraits(feature) != EdgeFeatureTraits();
}

inline bool IsEdgeFeatureOfKind(const Feature& feature, EdgeFeatureKind kind) {
  return GetEdgeFeatureTraits(feature).kind == kind;
}

inline bool IsCopilotFeature(const Feature& feature) {
  return GetEdgeFeatureTraits(feature).copilot_app_type !=
         CopilotAppType::kNone;
}

// Safe to downcast when `has_holdout` is true: `GetEdgeFeatureTraits` verifies
// `EdgeFeature::GetTraits`, and within `EdgeFeature`'s private-constructor
// hierarchy only `EdgeFeatureWithHoldoutBase` ever sets
// `traits.has_holdout = true`.
inline const Feature* GetEdgeFeatureHoldout(const Feature& feature) {
  if (!GetEdgeFeatureTraits(feature).has_holdout) {
    return nullptr;
  }
  return static_cast<const internal::EdgeFeatureWithHoldoutBase&>(feature)
      .holdout();
}

// Feature subclasses encode Edge variants so mismatches between declarations
// and definitions are caught at compile time. All categories remain usable
// through const Feature& or const Feature*. Declare and define
// category-specific features with the matching macros below.
//
// - EdgeRuntimeFeature: runtime trials without caching feature state.
// - EdgeFirstRunFeature: first-run session trial handling.
// - EdgeCopilotFeature: features restricted to selected Copilot app processes.
// - EdgeFeatureWithHoldout: ordinary features gated by a group holdout.
// - EdgeFirstRunFeatureWithHoldout: first-run features with a group holdout.
// - EdgeTriggerFeature: experiment trigger recording; disabled by default.
//
// Prefer Feature for general use; reserve these types for category-specific
// feature declarations and definitions.
struct LOGICALLY_CONST EdgeRuntimeFeature final : internal::EdgeFeature {
  constexpr EdgeRuntimeFeature(const char* feature_name,
                               FeatureState feature_default_state,
                               internal::FeatureMacroHandshake handshake)
      : EdgeFeature(feature_name,
                    feature_default_state,
                    {.kind = EdgeFeatureKind::kRuntime},
                    handshake) {}
};

struct LOGICALLY_CONST EdgeFirstRunFeature final : internal::EdgeFeature {
  constexpr EdgeFirstRunFeature(const char* feature_name,
                                FeatureState feature_default_state,
                                internal::FeatureMacroHandshake handshake)
      : EdgeFeature(feature_name,
                    feature_default_state,
                    {.kind = EdgeFeatureKind::kFirstRun},
                    handshake) {}
};

struct LOGICALLY_CONST EdgeCopilotFeature final : internal::EdgeFeature {
  constexpr EdgeCopilotFeature(const char* feature_name,
                               FeatureState feature_default_state,
                               CopilotAppType feature_copilot_app_type,
                               internal::FeatureMacroHandshake handshake)
      : EdgeFeature(feature_name,
                    feature_default_state,
                    {.copilot_app_type = feature_copilot_app_type},
                    handshake) {
    if (feature_copilot_app_type == CopilotAppType::kNone) {
      LOG(FATAL) << "BASE_COPILOT_FEATURE requires a non-kNone CopilotAppType.";
    }
  }
};

struct LOGICALLY_CONST EdgeFeatureWithHoldout final
    : internal::EdgeFeatureWithHoldoutBase {
  constexpr EdgeFeatureWithHoldout(const char* feature_name,
                                   FeatureState feature_default_state,
                                   const Feature* holdout_feature,
                                   internal::FeatureMacroHandshake handshake)
      : EdgeFeatureWithHoldoutBase(feature_name,
                                   feature_default_state,
                                   EdgeFeatureKind::kNormal,
                                   holdout_feature,
                                   handshake) {}
};

struct LOGICALLY_CONST EdgeFirstRunFeatureWithHoldout final
    : internal::EdgeFeatureWithHoldoutBase {
  constexpr EdgeFirstRunFeatureWithHoldout(
      const char* feature_name,
      FeatureState feature_default_state,
      const Feature* holdout_feature,
      internal::FeatureMacroHandshake handshake)
      : EdgeFeatureWithHoldoutBase(feature_name,
                                   feature_default_state,
                                   EdgeFeatureKind::kFirstRun,
                                   holdout_feature,
                                   handshake) {}
};

struct LOGICALLY_CONST EdgeTriggerFeature final : Feature {
  constexpr EdgeTriggerFeature(const char* feature_name,
                               void* feature_tagged_state,
                               internal::FeatureMacroHandshake handshake)
      : Feature(feature_name, feature_tagged_state, handshake) {}
};

// Makes name-based feature construction explicit when no suitable static
// feature definition exists, such as for runtime-supplied names or test
// descriptors.
//
// Models a plain `Feature` (no Edge metadata) so dynamic features stay
// pay-per-play. If dynamic construction with Edge metadata is needed in the
// future, introduce a separate `DynamicEdgeFeature` (inheriting from
// `internal::EdgeFeature`, or `internal::EdgeFeatureWithHoldoutBase` if a
// holdout is required) rather than adding metadata to `DynamicFeature`.
//
// Memory layout on 64-bit (24 B):
//   +0          +8              +16          +20
//   +-----------+--------------+------------+-----+
//   | name (8B) | tagged_state | state_(4B) | pad |
//   +-----------+--------------+------------+-----+
//                      |             ^
//                      +-------------+
//                 tagged_state -> state_ (+16)
class DynamicFeature final : public Feature {
 public:
  // The name must remain valid and unchanged for the lifetime of this
  // feature. Same as with base::Feature.
  explicit constexpr DynamicFeature(
      const char* feature_name,
      FeatureState feature_default_state = FEATURE_DISABLED_BY_DEFAULT)
      : Feature(
            feature_name,
            internal::TagEdgeFeatureStateStorage(feature_default_state, state_),
            internal::FeatureMacroHandshake::kSecret),
        state_{internal::MakeFeatureStateCacheInitialValue(
            /*is_runtime_mutable=*/false)} {}

  DynamicFeature(const DynamicFeature&) = delete;
  DynamicFeature& operator=(const DynamicFeature&) = delete;
  DynamicFeature(DynamicFeature&&) = delete;
  DynamicFeature& operator=(DynamicFeature&&) = delete;

 private:
  mutable internal::FeatureStateStorage state_;
};

}  // namespace base

#define BASE_EDGE_FEATURE_INTERNAL_NAME(feature)        \
  []() {                                                \
    static_assert(#feature[0] == 'k');                  \
    return std::string_view(#feature).substr(1).data(); \
  }()

// Unlike `BASE_FEATURE` and `BASE_FEATURE_TRIGGER` (which store mutable state
// in a separate `static` variable and place the immutable `Feature` descriptor
// in `BASE_FEATURE_SECTION`), `BASE_EDGE_FEATURE_INTERNAL_DEFINE` defines
// `EdgeFeature` subclasses that embed `mutable edge_state_` directly inside the
// object. It therefore omits `BASE_FEATURE_SECTION`, which on ELF maps to
// `.data.rel.ro..cr_features` (remapped read-only after startup relocations)
// and would fault when `FeatureList` writes the cached state at runtime.
#define BASE_EDGE_FEATURE_INTERNAL_DEFINE(Type, feature, name, default_state, \
                                          ...)                                \
  constinit const base::Type feature(                                         \
      name, default_state __VA_OPT__(, ) __VA_ARGS__,                         \
      base::internal::MakeEdgeMacroHandshake<base::Type>())

// The same as `BASE_DECLARE_FEATURE()` but such feature is also declared to be
// part of a feature group holdout.
//
// Being part of a feature group holdout impacts the state of the feature as
// returned by the IsEnabled() in the following way
//   - The feature state will be returned as 'false' and no triggers will get
//     recorded if the holdout flag is being overriden while the feature is not
//     yet enabled in code.
//   - The feature state will be returned as 'false' if the holdout flag state
//     is false.
//
// Provides a forward declaration for `kFeature` in a header file, e.g.
//
//   BASE_DECLARE_FEATURE_WITH_HOLDOUT(kMyFeature);
//
// If the feature needs to be marked as exported, i.e. it is referenced by
// multiple components, then write:
//
//   COMPONENT_EXPORT(MY_COMPONENT)
//   BASE_DECLARE_FEATURE_WITH_HOLDOUT(kMyFeature);
#define BASE_DECLARE_FEATURE_WITH_HOLDOUT(feature) \
  extern constinit const base::EdgeFeatureWithHoldout feature

// Provides a definition for a feature whose name is derived from the C++
// identifier.
//
//   BASE_FEATURE_WITH_HOLDOUT(kMyFeature, base::FEATURE_DISABLED_BY_DEFAULT,
//                             &kHoldoutFeature);
//
// This is equivalent to:
//
//   BASE_FEATURE_WITH_HOLDOUT(kMyFeature, "MyFeature",
//                   base::FEATURE_DISABLED_BY_DEFAULT, &kHoldoutFeature);
//
// Features should *not* be defined in header files; do not use this macro in
// header files.
#define BASE_FEATURE_WITH_HOLDOUT(feature, default_state, holdout)            \
  BASE_EDGE_FEATURE_INTERNAL_DEFINE(EdgeFeatureWithHoldout, feature,          \
                                    BASE_EDGE_FEATURE_INTERNAL_NAME(feature), \
                                    default_state, holdout)

// The same as `BASE_DECLARE_FEATURE()` but such feature is only applicable to
// copilot app and can only be enabled or triggered on copilot app.
//
// Provides a forward declaration for `kFeature` in a header file, e.g.
//
//   BASE_DECLARE_COPILOT_FEATURE(kMyFeature);
//
// If the feature needs to be marked as exported, i.e. it is referenced by
// multiple components, then write:
//
//   COMPONENT_EXPORT(MY_COMPONENT) BASE_DECLARE_COPILOT_FEATURE(kMyFeature);
#define BASE_DECLARE_COPILOT_FEATURE(feature) \
  extern constinit const base::EdgeCopilotFeature feature

// Provides a definition for a copilot feature whose name is derived from the
// C++ identifier.
//
// This macro can be used in two ways:
//
// 1. With two arguments, the feature applies to all copilot apps (both the
//    legacy consumer app and the new unified copilot app):
//
//      BASE_COPILOT_FEATURE(kMyFeature, base::FEATURE_DISABLED_BY_DEFAULT);
//
// 2. With three arguments, to specify which copilot app(s) the feature applies
//    to via a `base::CopilotAppType` enum value:
//
//      BASE_COPILOT_FEATURE(kMyFeature, base::FEATURE_DISABLED_BY_DEFAULT,
//                           base::CopilotAppType::kLegacyConsumerOnly);
//
//    Valid values for the third argument:
//      - base::CopilotAppType::kAll (default if omitted)
//      - base::CopilotAppType::kLegacyConsumerOnly
//      - base::CopilotAppType::kUnifiedOnly
//
// Features should *not* be defined in header files; do not use this macro in
// header files.
#define BASE_COPILOT_FEATURE(...)                        \
  BASE_COPILOT_FEATURE_INTERNAL_GET_MACRO(               \
      __VA_ARGS__, BASE_COPILOT_FEATURE_INTERNAL_3_ARGS, \
      BASE_COPILOT_FEATURE_INTERNAL_2_ARGS)(__VA_ARGS__)

#define BASE_COPILOT_FEATURE_INTERNAL_GET_MACRO(_1, _2, _3, NAME, ...) NAME

#define BASE_COPILOT_FEATURE_INTERNAL_2_ARGS(feature, default_state) \
  BASE_COPILOT_FEATURE_INTERNAL_3_ARGS(feature, default_state,       \
                                       base::CopilotAppType::kAll)

#define BASE_COPILOT_FEATURE_INTERNAL_3_ARGS(feature, default_state,          \
                                             copilot_app_type)                \
  BASE_EDGE_FEATURE_INTERNAL_DEFINE(EdgeCopilotFeature, feature,              \
                                    BASE_EDGE_FEATURE_INTERNAL_NAME(feature), \
                                    default_state, copilot_app_type)

// The only difference in behavior of runtime features vs features is that
// runtime features will not cache the state of the feature on the first
// IsEnabled() call. Not caching the state makes the IsEnabled() call more
// expensive, so only features that can change their state without browser
// restart and are expected to participate in a runtime trials should be
// declared as runtime features.

// Provides a forward declaration for `kFeature` in a header file, e.g.
//
//   BASE_DECLARE_RUNTIME_FEATURE(kMyFeature);
//
// If the feature needs to be marked as exported, i.e. it is referenced by
// multiple components, then write:
//
//   COMPONENT_EXPORT(MY_COMPONENT) BASE_DECLARE_RUNTIME_FEATURE(kMyFeature);
#define BASE_DECLARE_RUNTIME_FEATURE(feature) \
  extern constinit const base::EdgeRuntimeFeature feature

// Provides a definition for `kFeature` with `name` and `default_state`, e.g.
//
// This macro can be used in two ways:
//
// 1. With two arguments, to define a feature whose name is derived from the C++
//    identifier. This form is preferred, as it avoids repeating the feature
//    name and helps prevent typos.
//
//      BASE_RUNTIME_FEATURE(kMyFeature, base::FEATURE_DISABLED_BY_DEFAULT);
//
//    This is equivalent to:
//
//      BASE_RUNTIME_FEATURE(kMyFeature, "MyFeature",
//                   base::FEATURE_DISABLED_BY_DEFAULT);
//
// Features should *not* be defined in header files; do not use this macro in
// header files.
#define BASE_RUNTIME_FEATURE_INTERNAL_3_ARGS(feature, name, default_state) \
  BASE_EDGE_FEATURE_INTERNAL_DEFINE(EdgeRuntimeFeature, feature, name,     \
                                    default_state)

#define BASE_RUNTIME_FEATURE_INTERNAL_2_ARGS(feature, default_state) \
  BASE_RUNTIME_FEATURE_INTERNAL_3_ARGS(                              \
      feature, BASE_EDGE_FEATURE_INTERNAL_NAME(feature), default_state)

#define BASE_RUNTIME_FEATURE(...)                        \
  BASE_FEATURE_INTERNAL_GET_FEATURE_MACRO(               \
      __VA_ARGS__, BASE_RUNTIME_FEATURE_INTERNAL_3_ARGS, \
      BASE_RUNTIME_FEATURE_INTERNAL_2_ARGS)(__VA_ARGS__)

// The first run features are non-runtime features, which are expected to
// participate in the first run session trials. The trials for the first run
// session are delivered and applied to clients at runtime in the beginning of
// the first run session. To cover the case when the feature is checked before
// the trials are delivered and applied, such features
//   - Quarantee to always return the same state for the duration of the first
//     run session. Note, this is also true for |BASE_FEATURE| as both features
//     cache the state of the feature on the first IsEnabled() API call.
//   - Ensure triggering the feature with IsEnabled(true) or TriggerUsage() will
//     only get recorded if the feature state was first checked with IsEnabled()
//     after first run trials were delivered and applied on first run session.
//   - Record such cases in a histogram to identify how successful first run
//     trials are in overriding the feature "on time".
// Alternatively, if your feature state can always be checked after first run
// trials are delivered and applied on the first run session, you can subsribe
// for the |OnFirstRunInitialized| event notification by registering as a
// |FeatureListObserver|. This way your feature can be declared as
// |BASE_FEATURE|.
// On non-first run sessions, the |BASE_FIRST_RUN_FEATURE| behave just as
// |BASE_FEATURE|.
//
// Provides a forward declaration for `kFeature` in a header file, e.g.
//
//   BASE_DECLARE_FIRST_RUN_FEATURE(kMyFeature);
//
// If the feature needs to be marked as exported, i.e. it is referenced by
// multiple components, then write:
//
//   COMPONENT_EXPORT(MY_COMPONENT) BASE_DECLARE_FIRST_RUN_FEATURE(kMyFeature);
#define BASE_DECLARE_FIRST_RUN_FEATURE(feature) \
  extern constinit const base::EdgeFirstRunFeature feature

// Provides a definition for `kFeature` with `name` and `default_state`, e.g.
//
// This macro can be used in two ways:
//
// 1. With two arguments, to define a feature whose name is derived from the C++
//    identifier. This form is preferred, as it avoids repeating the feature
//    name and helps prevent typos.
//
//      BASE_FIRST_RUN_FEATURE(kMyFeature, base::FEATURE_DISABLED_BY_DEFAULT);
//
//    This is equivalent to:
//
//      BASE_FIRST_RUN_FEATURE(kMyFeature, "MyFeature",
//                             base::FEATURE_DISABLED_BY_DEFAULT);
//
// 2. With three arguments, to explicitly specify the C++ identifier and the
//    name of the feature. This form should be used only if the feature needs
//    to have a C++ identifier that does not match the feature name, which
//    should be rare.
//
//      BASE_FIRST_RUN_FEATURE(kMyFeature, "MyFeatureName",
//                             base::FEATURE_DISABLED_BY_DEFAULT);
//
// Features should *not* be defined in header files; do not use this macro in
// header files.
#define BASE_FIRST_RUN_FEATURE_INTERNAL_3_ARGS(feature, name, default_state) \
  BASE_EDGE_FEATURE_INTERNAL_DEFINE(EdgeFirstRunFeature, feature, name,      \
                                    default_state)

#define BASE_FIRST_RUN_FEATURE_INTERNAL_2_ARGS(feature, default_state) \
  BASE_FIRST_RUN_FEATURE_INTERNAL_3_ARGS(                              \
      feature, BASE_EDGE_FEATURE_INTERNAL_NAME(feature), default_state)

#define BASE_FIRST_RUN_FEATURE(...)                        \
  BASE_FEATURE_INTERNAL_GET_FEATURE_MACRO(                 \
      __VA_ARGS__, BASE_FIRST_RUN_FEATURE_INTERNAL_3_ARGS, \
      BASE_FIRST_RUN_FEATURE_INTERNAL_2_ARGS)(__VA_ARGS__)

// The same as `BASE_DECLARE_FIRST_RUN_FEATURE()` but behind a feature group
// holdout.
//
// Being part of a feature group holdout impacts the state of the feature as
// returned by the IsEnabled() in the following way
//   - The feature state will be returned as 'false' and no triggers will get
//     recorded if the holdout flag is being overriden while the feature is not
//     yet enabled in code.
//   - The feature state will be returned as 'false' if the holdout flag state
//     is false.
//
// Provides a forward declaration for `kFeature` in a header file, e.g.
//
//   BASE_DECLARE_FIRST_RUN_FEATURE_WITH_HOLDOUT(kMyFeature);
//
// If the feature needs to be marked as exported, i.e. it is referenced by
// multiple components, then write:
//
//   COMPONENT_EXPORT(MY_COMPONENT)
//   BASE_DECLARE_FIRST_RUN_FEATURE_WITH_HOLDOUT(kMyFeature);
#define BASE_DECLARE_FIRST_RUN_FEATURE_WITH_HOLDOUT(feature) \
  extern constinit const base::EdgeFirstRunFeatureWithHoldout feature

// Provides a definition for a feature whose name is derived from the C++
// identifier.
//
//   BASE_FIRST_RUN_FEATURE_WITH_HOLDOUT(kMyFeature,
//      base::FEATURE_DISABLED_BY_DEFAULT, &kHoldoutFeature);
//
// This is equivalent to:
//
//   BASE_FIRST_RUN_FEATURE_WITH_HOLDOUT(kMyFeature, "MyFeature",
//                                       base::FEATURE_DISABLED_BY_DEFAULT,
//                                       &kHoldoutFeature);
//
// Features should *not* be defined in header files; do not use this macro in
// header files.
#define BASE_FIRST_RUN_FEATURE_WITH_HOLDOUT(feature, default_state, holdout)  \
  BASE_EDGE_FEATURE_INTERNAL_DEFINE(EdgeFirstRunFeatureWithHoldout, feature,  \
                                    BASE_EDGE_FEATURE_INTERNAL_NAME(feature), \
                                    default_state, holdout)

// Recommended macros for declaring and defining features triggers.
//
// Generally, feature trigger should be the feature flag itself, but for cases
// where there are multiple or no feature flags associated with an experiment,
// you can use feature trigger to create a feature flag solely for recording
// trigger events.
//
// The only difference between feature triggers vs features is that feature
// trigger default state is always DISABLED_BY_DEFAULT.
//
// Provides a forward declaration for `kFeature` feature trigger in a header
// file, e.g.
//
//   BASE_DECLARE_FEATURE_TRIGGER(kMyFeature);
//
// If the feature trigger needs to be marked as exported, i.e. it is referenced
// by multiple components, then write:
//
//   COMPONENT_EXPORT(MY_COMPONENT) BASE_DECLARE_FEATURE_TRIGGER(kMyFeature);
#define BASE_DECLARE_FEATURE_TRIGGER(feature) \
  extern constinit const base::EdgeTriggerFeature feature

// Provides a definition for `kFeature` feature trigger with `name`, e.g.
//
// This macro can be used in two ways:
//
// 1. With one argument, to define a feature whose name is derived from the C++
//    identifier. This form is preferred, as it avoids repeating the feature
//    name and helps prevent typos.
//
//      BASE_FEATURE_TRIGGER(kMyFeature);
//
//    This is equivalent to:
//
//      BASE_FEATURE_TRIGGER(kMyFeature, "MyFeature");
//
// 2. With two arguments, to explicitly specify the C++ identifier and the
//    name of the feature. This form should be used only if the feature needs
//    to have a C++ identifier that does not match the feature name, which
//    should be rare.
//
//      BASE_FEATURE_TRIGGER(kMyFeature, "MyFeatureName");
//
// Features triggers should *not* be defined in header files; do not use this
// macro in header files.
#define BASE_FEATURE_TRIGGER_INTERNAL_2_ARGS(feature, name)                 \
  BASE_FEATURE_SECTION constinit const base::EdgeTriggerFeature feature(    \
      name,                                                                 \
      BASE_FEATURE_INTERNAL_STATE(false, base::FEATURE_DISABLED_BY_DEFAULT, \
                                  !base::IsCountrySpecificFeatureState),    \
      base::internal::FeatureMacroHandshake::kSecret)

#define BASE_FEATURE_TRIGGER_INTERNAL_1_ARGS(feature) \
  BASE_FEATURE_TRIGGER_INTERNAL_2_ARGS(               \
      feature, BASE_EDGE_FEATURE_INTERNAL_NAME(feature))

#define GET_BASE_FEATURE_TRIGGER_MACRO(_1, _2, NAME, ...) NAME
#define BASE_FEATURE_TRIGGER(...)                        \
  GET_BASE_FEATURE_TRIGGER_MACRO(                        \
      __VA_ARGS__, BASE_FEATURE_TRIGGER_INTERNAL_2_ARGS, \
      BASE_FEATURE_TRIGGER_INTERNAL_1_ARGS)(__VA_ARGS__)

#endif  // BASE_EDGE_FEATURE_H_
