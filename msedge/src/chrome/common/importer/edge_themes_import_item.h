// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef CHROME_COMMON_IMPORTER_EDGE_THEMES_IMPORT_ITEM_H_
#define CHROME_COMMON_IMPORTER_EDGE_THEMES_IMPORT_ITEM_H_

#include "chrome/common/importer/extensions/edge_extension_import_item.h"
#include "ui/base/mojom/themes.mojom.h"

namespace importer {
constexpr inline int kDefaultThemePrefValue = -1;

// Constant theme ID used for imported color themes from Chrome.
// Color themes normally do not have a theme ID; this is assigned only
// for imported color themes.
constexpr inline char kImportedColorThemeId[] = "imported_chrome_color_theme";

// These values are logged to UMA. Entries should not be renumbered
// numeric values should never be reused. Please keep in sync with
// "Microsoft.ContinuousMigration.ThemesImportUndo.ThemesImportType" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class ThemesImportType {
  kNone = 0,
  kColorTheme = 1,
  kExtensionTheme = 2,
  kMaxValue = kExtensionTheme
};

struct ThemesImportItem {
  ThemesImportItem();
  ThemesImportItem(const ThemesImportItem& other);
  ThemesImportItem(ThemesImportItem&& other);
  ThemesImportItem& operator=(const ThemesImportItem& other);
  ThemesImportItem& operator=(ThemesImportItem&& other);
  ~ThemesImportItem();

  ThemesImportType theme_type = ThemesImportType::kNone;
  int user_color = kDefaultThemePrefValue;
  ui::mojom::BrowserColorVariant color_variant =
      ui::mojom::BrowserColorVariant::kTonalSpot;
  int color_scheme = kDefaultThemePrefValue;
  extensions_importer::ExtensionImportItem extension_import_item;
};
}  // namespace importer

#endif  // CHROME_COMMON_IMPORTER_EDGE_THEMES_IMPORT_ITEM_H_
