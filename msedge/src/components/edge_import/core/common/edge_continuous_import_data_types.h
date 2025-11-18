// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef COMPONENTS_EDGE_IMPORT_CORE_COMMON_EDGE_CONTINUOUS_IMPORT_DATA_TYPES_H_
#define COMPONENTS_EDGE_IMPORT_CORE_COMMON_EDGE_CONTINUOUS_IMPORT_DATA_TYPES_H_

#include <cstdint>

namespace edge_continuous_migration {

enum class SourceOfData : std::uint8_t {
  // Default source for any Edge record
  ANAHEIM = 0,
  // Record has come from Chrome via Continuous import and is live - can be
  // updated
  CONTINUOUS_IMPORT_CHROME,
  // Record was imported from a previouly selected Chrome profile - won't be
  // updated as active profile was changed by user
  IMPORTED_FROM_CHROME_OLD,
  // Record was imported from Chrome takeout importer
  CHROME_TAKEOUT_IMPORT,
  // Record was imported from Chrome manual import
  CHROME_MANUAL_IMPORT,
};

// Important:: whenever new enums are added make sure to update
// ConvertOperationToString method in continuous_migration_logger_win.cc file
// and GetOperationTypeFromString method in
// continuous_migration_logger_win_unittest.cc file.
enum class LogOperationType {
  NONE = 0,
  ADD = 1,
  ADD_ERR = 2,
  ADD_MERGE = 3,
  UPDATE = 4,
  UPDATE_REPLACE = 5,
  UPDATE_MERGE = 6,
  UPDATE_ADD = 7,
  UPDATE_ERR = 8,
  SKIPPED_EDGE_DELETED = 9,
  SKIPPED_EDGE_HAS_LATEST = 10,
  ADD_FORM_DATA = 11,
  UNDO_CI = 12,
  MAX = UNDO_CI,
};

enum class OperationType {
  ADD = 0,
  UPDATE = 1,
  REMOVE = 2
};

// NOTE: Do not re-order the entries in the enum. It is being used in UMA for
// histogram "Microsoft.ContinuousMigration.ItemCountType". If changed, modify
// src\tools\metrics\histograms\edge_enums.xml accoridngly.
enum class ContinuousMigrationCountTypes : int {
  DISCOVERED = 0,
  SELECTED_FOR_PROCESSING = 1,
  PARSING_ERRORS = 2,
  SKIPPED_FROM_SELECTION = 3,
  INSERTED_NEW = 4,
  PROCESSING_ERRORS = 5,
  SKIPPED_AT_PROCESSING = 6,
  MERGED = 7,
  SELECTED_FOR_DB_INSERTION = 8,
  kMaxValue = SELECTED_FOR_DB_INSERTION
};

// NOTE: Do not re-order the entries in the enum. It is being used in UMA for
// histogram "Microsoft.ContinuousMigration.SkipReasonTypes". If changed, modify
// src\tools\metrics\histograms\edge_enums.xml accoridngly.
enum class ContinuousMigrationSkipReasons : int {
  NONE = 0,
  EDGE_HAS_LATEST_DATA = 1,
  DATA_DELETED_IN_EDGE = 2,
  DATA_FROM_DOMAIN_IS_PRESENT_IN_EDGE = 3,
  kMaxValue = DATA_FROM_DOMAIN_IS_PRESENT_IN_EDGE
};

// NOTE: Do not re-order the entries in the enum. It is being used in UMA for
// histogram "Microsoft.ContinuousMigration.ErrorReasonTypes". If changed,
// modify src\tools\metrics\histograms\edge_enums.xml accoridngly.
enum class ContinuousMigrationErrorReasons : int {
  NONE = 0,
  DB_NOT_AVAILABLE = 1,
  DB_ERROR = 2,
  CONSTRAINT_VIOLATION = 3,
  ENCRYPTION_FAILURE = 4,
  SCHEME_NOT_APPLICABLE = 5,
  SECURE_OVERWRITE_ATTEMPT = 6,
  HTTP_OVERWRITE_ATTEMPT = 7,
  INVALID_DOMAIN = 8,
  INVALID_PREFIX = 9,
  INVALID_SAMEPARTY = 10,
  EDGE_LEGACY = 11,
  INVALID_PARTITION_KEY = 12,
  CANONICAL_COOKIE_CREATION_FAILED = 13,
  COOKIE_NOT_CANONICAL = 14,
  EXPIRED_COOKIE = 15,
  INVALID_PASSWORD_BLOB = 16,
  CHROME_DATA_DECRYPTION_FAILED = 17,
  INVALID_PASSWORD_NOTE = 18,
  kMaxValue = INVALID_PASSWORD_NOTE
};

// "Microsoft.ContinuousMigration.OpenTabsCampaignStates" in
// src/tools/metrics/histograms/edge_enums.xml
enum class OpenTabsCampaignStates {
  kOpentabsCountExceededFirstTime = 0,
  kOpentabsCountExceededConsequentTime = 1,
  kCampaignTriggered = 2,
  kCampaignNeverShowOptOut = 3,
  kCampaignNeverShowGotIt = 4,
  kCampaignNeverShowSettingsChanged = 5,
  kCampaignNeverShowProfileChanged = 6,
  kCampaignNeverShowLimitExceeded = 7,
  kSessionDBLockImportTry = 8,
  kNoImportAsEdgeSessionLatest = 9,
  kNoImportAsSameURLDedupe = 10,
  kImportedTabsRendered = 11,
  kCampaignNeverShowChromeInstalledBeforeFRE = 12,
  kMaxValue = kCampaignNeverShowChromeInstalledBeforeFRE
};

bool IsSourceAsterImport(SourceOfData source_of_data);
}  // namespace edge_continuous_migration

#endif  // COMPONENTS_EDGE_IMPORT_CORE_COMMON_EDGE_CONTINUOUS_IMPORT_DATA_TYPES_H_
