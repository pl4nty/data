// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_PRISM_EXPLORER_COMMON_EDGE_PRISM_EXPLORER_UTILS_H_
#define COMPONENTS_EDGE_PRISM_EXPLORER_COMMON_EDGE_PRISM_EXPLORER_UTILS_H_

namespace user_prefs {
class PrefRegistrySyncable;
}

class GURL;

namespace edge_prism_explorer {

extern const char kSettingPageUrl[];

// Register user preferences for prism explorer
void RegisterProfilePrefs(user_prefs::PrefRegistrySyncable* registry);

bool ShouldShowEdgePrismExplorer(const GURL& url);
}

#endif  // COMPONENTS_EDGE_PRISM_EXPLORER_COMMON_EDGE_PRISM_EXPLORER_UTILS_H_