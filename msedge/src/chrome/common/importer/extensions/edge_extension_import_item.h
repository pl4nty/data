// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef CHROME_COMMON_IMPORTER_EXTENSIONS_EDGE_EXTENSION_IMPORT_ITEM_H_
#define CHROME_COMMON_IMPORTER_EXTENSIONS_EDGE_EXTENSION_IMPORT_ITEM_H_

#include <unordered_map>

#include "base/containers/flat_set.h"
#include "base/files/file_util.h"
#include "base/values.h"
#include "components/user_data_importer/common/importer_type.h"

namespace importer {
namespace extensions_importer {

// This structure will represent the extension item that to be migrated from
// source profile to Anaheim.
struct ExtensionImportItem {
  ExtensionImportItem();
  ExtensionImportItem(const ExtensionImportItem& item);
  ~ExtensionImportItem();

  std::string old_extension_id;
  std::string manifest_data;
  std::string crx_id;
  std::string spartan_big_id;
  // public key of extension in chrome extension store
  std::string public_key;
  std::string original_extension_name;
  bool is_enabled = false;
  bool allow_in_private_mode = false;
  // returns true if extension is available in microsoft store and is ready
  // for use
  bool is_spartan_mapping_ready = false;
  bool is_installed = false;
  // indicate whether extension belong to microsoft store extension
  bool is_microsoft_store_extension = true;
  bool allow_file_access = false;
  bool is_theme_type_extension = false;
  base::flat_set<int> disable_reasons;
  uint16_t location = 0;
  // extension setting indicating whether to show extension errors or not
  uint16_t store_extension_errors = 0;
  // extension path in chrome
  base::FilePath extension_path;
  // map of data in local extension settings
  std::unordered_map<std::u16string, std::u16string> local_data;
  // map of data in sync extension settings
  std::unordered_map<std::u16string, std::u16string> sync_data;
  // explicit url required for extension setting
  std::vector<std::string> explicit_host_url_list;
  // scriptrable url required for extension setting
  std::vector<std::string> scriptable_host_url_list;
  // is permission was granted by user on chrome
  bool is_permission_granted = false;
  // extension creation flags
  uint32_t creation_flags;
  // site access permissions for urls
  bool is_withholding_permission = false;

  // Whther the item is of type regular import or continuous import.
  user_data_importer::ProfileImportType import_type =
      user_data_importer::ProfileImportType::REGULAR_IMPORT;
};

}  // namespace extensions_importer
}  // namespace importer
#endif  // CHROME_COMMON_IMPORTER_EXTENSIONS_EDGE_EXTENSION_IMPORT_ITEM_H_
