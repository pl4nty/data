// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_PRISM_EXPLORER_COMMON_EDGE_PRISM_EXPLORER_UTILS_H_
#define COMPONENTS_EDGE_PRISM_EXPLORER_COMMON_EDGE_PRISM_EXPLORER_UTILS_H_

namespace user_prefs {
class PrefRegistrySyncable;
}

class GURL;
class PrefService;

namespace edge_prism_explorer {

extern const char kSettingPageUrl[];

// Register user preferences for prism explorer
void RegisterProfilePrefs(user_prefs::PrefRegistrySyncable* registry);

// If user is not part of the unshipping experiment, this will return the
// status of the base pref `kSmartExploreOnImageHover`. If the user is
// being targeted by the treatment branch of the experiment, then this
// function will only return `true` if the user manually re-enabled the
// settings toggle.
bool IsPrismHoverPreferenceEnabled(const PrefService& pref_service);

// Writes the canonical hover preference. Enabling in treatment also writes the
// device-local opt-in. Disabling writes the local opt-in as false in every arm;
// enabling in control leaves the local opt-in unchanged.
void SetPrismHoverPreferenceEnabled(PrefService& pref_service, bool enabled);

bool ShouldShowEdgePrismExplorer(const GURL& url);
}

#endif  // COMPONENTS_EDGE_PRISM_EXPLORER_COMMON_EDGE_PRISM_EXPLORER_UTILS_H_