// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef BASE_EDGE_FEATURE_H_
#define BASE_EDGE_FEATURE_H_

#include <string_view>

#include "base/feature.h"

namespace base {

constexpr Feature::Feature(const char* name)
    : name(name), default_state(FEATURE_DISABLED_BY_DEFAULT) {}

constexpr Feature::Feature(const char* name,
                           FeatureState default_state,
                           bool runtime,
                           bool first_run,
                           CopilotAppType copilot_app_type,
                           const Feature* holdout,
                           internal::FeatureMacroHandshake)
    : name(name),
      default_state(default_state),
      runtime(runtime),
      first_run(first_run),
      copilot_app_type(copilot_app_type),
      holdout(holdout) {}

}  // namespace base

#define BASE_EDGE_FEATURE_INTERNAL_NAME(feature)        \
  []() {                                                \
    static_assert(#feature[0] == 'k');                  \
    return std::string_view(#feature).substr(1).data(); \
  }()

#define BASE_EDGE_FEATURE_INTERNAL_DEFINE(                                   \
    feature, name, default_state, runtime, first_run, copilot_type, holdout) \
  constinit const base::Feature feature(                                     \
      name, default_state, runtime, first_run, copilot_type, holdout,        \
      base::internal::FeatureMacroHandshake::kSecret)

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
  extern constinit const base::Feature feature

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
#define BASE_FEATURE_WITH_HOLDOUT(feature, default_state, holdout)      \
  BASE_EDGE_FEATURE_INTERNAL_DEFINE(                                    \
      feature, BASE_EDGE_FEATURE_INTERNAL_NAME(feature), default_state, \
      /*runtime=*/false, /*first_run=*/false,                           \
      /*copilot_type=*/base::CopilotAppType::kNone, holdout)

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
  extern constinit const base::Feature feature

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

#define BASE_COPILOT_FEATURE_INTERNAL_3_ARGS(feature, default_state,    \
                                             copilot_app_type)          \
  BASE_EDGE_FEATURE_INTERNAL_DEFINE(                                    \
      feature, BASE_EDGE_FEATURE_INTERNAL_NAME(feature), default_state, \
      /*runtime=*/false, /*first_run=*/false, copilot_app_type,         \
      /*holdout=*/nullptr)

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
  extern constinit const base::Feature feature

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
  BASE_EDGE_FEATURE_INTERNAL_DEFINE(                                       \
      feature, name, default_state, /*runtime=*/true, /*first_run=*/false, \
      /*copilot_type=*/base::CopilotAppType::kNone, /*holdout=*/nullptr)

#define BASE_RUNTIME_FEATURE_INTERNAL_2_ARGS(feature, default_state)    \
  BASE_EDGE_FEATURE_INTERNAL_DEFINE(                                    \
      feature, BASE_EDGE_FEATURE_INTERNAL_NAME(feature), default_state, \
      /*runtime=*/true, /*first_run=*/false,                            \
      /*copilot_type=*/base::CopilotAppType::kNone, /*holdout=*/nullptr)

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
  extern constinit const base::Feature feature

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
  BASE_EDGE_FEATURE_INTERNAL_DEFINE(                                         \
      feature, name, default_state, /*runtime=*/false, /*first_run=*/true,   \
      /*copilot_type=*/base::CopilotAppType::kNone, /*holdout=*/nullptr)

#define BASE_FIRST_RUN_FEATURE_INTERNAL_2_ARGS(feature, default_state)  \
  BASE_EDGE_FEATURE_INTERNAL_DEFINE(                                    \
      feature, BASE_EDGE_FEATURE_INTERNAL_NAME(feature), default_state, \
      /*runtime=*/false, /*first_run=*/true,                            \
      /*copilot_type=*/base::CopilotAppType::kNone, /*holdout=*/nullptr)

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
  extern constinit const base::Feature feature

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
#define BASE_FIRST_RUN_FEATURE_WITH_HOLDOUT(feature, default_state, holdout) \
  BASE_EDGE_FEATURE_INTERNAL_DEFINE(                                         \
      feature, BASE_EDGE_FEATURE_INTERNAL_NAME(feature), default_state,      \
      /*runtime=*/false, /*first_run=*/true,                                 \
      /*copilot_type=*/base::CopilotAppType::kNone, holdout)

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
  extern constinit const base::Feature feature

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
#define BASE_FEATURE_TRIGGER_INTERNAL_2_ARGS(feature, name) \
  BASE_FEATURE(feature, name, base::FEATURE_DISABLED_BY_DEFAULT)

#define BASE_FEATURE_TRIGGER_INTERNAL_1_ARGS(feature) \
  BASE_FEATURE(feature, base::FEATURE_DISABLED_BY_DEFAULT)

#define GET_BASE_FEATURE_TRIGGER_MACRO(_1, _2, NAME, ...) NAME
#define BASE_FEATURE_TRIGGER(...)                        \
  GET_BASE_FEATURE_TRIGGER_MACRO(                        \
      __VA_ARGS__, BASE_FEATURE_TRIGGER_INTERNAL_2_ARGS, \
      BASE_FEATURE_TRIGGER_INTERNAL_1_ARGS)(__VA_ARGS__)

#endif  // BASE_EDGE_FEATURE_H_
