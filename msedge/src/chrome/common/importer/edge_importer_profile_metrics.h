// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef CHROME_COMMON_IMPORTER_EDGE_IMPORTER_PROFILE_METRICS_H_
#define CHROME_COMMON_IMPORTER_EDGE_IMPORTER_PROFILE_METRICS_H_

#include "components/user_data_importer/common/importer_data_types.h"

#if BUILDFLAG(IS_WIN)
namespace edge_import {
enum class CopyErrorType : int;
}  // namespace edge_import
#endif

namespace importer {

// These values are logged to UMA. Entries should not be renumbered
// numeric values should never be reused. Please keep in sync with
// "Microsoft.ImportErrorState" in src/tools/metrics/histograms/edge_enums.xml.
enum class ImportErrorState {
  kIncorrectDbPath = 0,
  kTempPathCreateFailed = 1,
  kOriginalDbNotFound = 2,
  kOriginalPathNotFound = 3,
  kCreateTempLogFilePathFailed = 4,
  kCopyLogFilesFailed = 5,
  kCopyDbFailed = 6,
  kOpenDbFailed = 7,
  kInvalidQuery = 8,
  kInvalidHistoryQuery = 9,
  kCorruptDb = 10,
  kParseDbFailed = 11,
  kWinRTNotSupported = 12,
  kRetrieveCredentialsError = 13,
  kRetrievePasswordError = 14,
  kPasswordRequestDeniedOnMac = 15,
  kIECredentialCheckFailed = 16,
  kComObjectCreationFailed = 17,
  kGetEnumeratorFailed = 18,
  kGetCacheInfoFailed = 19,
  kOpenFileFailed = 20,
  kCopyComPtrFailed = 21,
  kDecryptionFailedOnIE7 = 22,
  kHistoryEntryNotFoundOnIE7 = 23,
  kRegistryReadError = 24,
  kRegistryValueInvalid = 25,
  kRegistryValueEmpty = 26,
  kCookieImportInitProcThreadAttributesError = 27,
  kCookieImportUpdateProcThreadAttributeSecurityCapabilitiesError = 28,
  kCookieImportGetChildWebContentSidError = 29,
  kCookieImportGetAppContainerSidError = 30,
  kCookieImportCreateExportProcessError = 31,
  kCookieImportExportProcessGetExitCodeError = 32,  // Deprecated
  kCookieImportExportProcessReturnCodeError = 33,
  kCookieImportExportProcessTimeoutError = 34,
  kCookieImportStorageFileStaticsActivationError = 35,          // Deprecated
  kCookieImportGetFileFromPathAsyncError = 36,                  // Deprecated
  kCookieImportAsyncPostResultsError = 37,                      // Deprecated
  kCookieImportCreateSharedFileTokenTimeoutError = 38,          // Deprecated
  kCookieImportSharedStorageAccessManagerActivationError = 39,  // Deprecated
  kCookieImportSharedStorageAccessManagerAddFileError = 40,     // Deprecated
  kCookieImportJsonDeserializationError = 41,
  kCookieImportLoadWinRTError = 42,  // Deprecated
  kCookieImportImporterTempDirError = 43,
  kCookieImportCookieJsonFileCreationError = 44,
  kCookieImportFilePathError = 45,
  kCookieImportTimeoutError = 46,  // Deprecated
  kParseSpartanInternetContainerError = 47,
  kParseSpartanIntranetContainerError = 48,
  kRegValuesMaxLimit = 49,
  kParseDownloadHistoryContainerError = 50,
  kParseDownloadResponseHeaderError = 51,
  kDownloadHistoryDataUnpackError = 52,
  kDownloadHistoryStringUnpackError = 53,
  kDownloadHistoryByteUnpackError = 54,
  kSpartanSSFJsonDeserializeError = 55,
  kSpartanSSFJsonMissingCollectionError = 56,
  kSpartanSSFJsonParseError = 57,
  kVaultCliDllLoadFailed = 58,
  kVaultCliMethodLoadFailed = 59,
  kUnableToOpenVault = 60,
  kUnableToGetPasswordItems = 61,
  kUnableToAllocateMemoryForItems = 62,
  kSpartanTopSitesParseError = 63,
  kTabsImportSessionFileLocked = 64,
  kTabsImportSessionFileCorrupt = 65,
  kTabsImportInvalidNavigation = 66,
  kSettingsImportJsonDeserializationError = 67,
  kIEPasswordsImportURLMapNotFound = 68,
  kEdgeSourcePathEmpty = 69,
  kEdgeTempPathReused = 70,
  kEdgeTempSourcePathNotFound = 71,
  kEdgeTempPathNotFound = 72,
  kEdgeEnumeratorNotFound = 73,
  kEdgeEnumeratorResetError = 74,
  kEdgeEnumeratorNoRecords = 75,
  kEdgeRecoveryStoreNotInitialized = 76,
  kEdgeFramesNotFound = 77,
  kEdgeFrameIndicesNotOrdered = 78,
  kEdgeDecryptionError = 79,
  kChromeTopSitesParseError = 80,
  kChromeTopSitesImportJsonDeserializationError = 81,
  kChromeImportCookiesParseError = 82,      // Deprecated
  kChromeImportInvalidCookieDataBlob = 83,  // Deprecated
  kChromeImportPreferencesParseError = 84,
  kEdgeRecoveryStoreFileNotFound = 85,
  kEdgeRecoveryStoreInvalidData = 86,
  kEdgeRecoveryStoreInvalidDataVersion = 87,
  kEdgeRecoveryStoreNoData = 88,
  kCookieImportJsonFileCreateSidError = 89,            // Deprecated
  kCookieImportJsonFileAddKnownSidToObjectError = 90,  // Deprecated
  kIsDeletedColumnNotFound = 91,
  kEntryMarkedIsDeleted = 92,
  kEntryMarkedIsOrphaned = 93,
  kIsFolderColumnNotFound = 94,
  kUrlColumnNotFound = 95,
  kInvalidUrl = 96,
  kTitleColumnNotFound = 97,
  kFaviconFileColumnNotFound = 98,
  kParentIdColumnNotFound = 99,
  kItemIdColumnNotFound = 100,
  kOrderNumberColumnNotFound = 101,
  kDateUpdatedColumnNotFound = 102,
  kEdgeGetTabByIdFailed = 103,
  kPasswordFieldsInvalid = 104,
  kCanonicalCookieImporterCreationFailed = 105,
  kFirefoxInvalidProfile = 106,
  kFavoriteFaviconImportFailed = 107,
  kNSSInitFailed = 108,
  kNSSReadAndParseLoginsFailed = 109,
  kNSSReadAndParseSignonsFailed = 110,
  kNSSParseSignons3Failed = 111,
  kNSSParseSignons2Failed = 112,
  kProfileJsonParseFailed = 113,
  kCookieImportUpdateProcThreadAttributeHandleListError = 114,
  kPreferenceFileNotFound = 115,
  kPreferenceFileParseError = 116,
  kSecurePreferenceFileNotFound = 117,
  kSecurePreferenceFileParseError = 118,
  kCopyFileSourcePathSizeExceededError = 119,
  kCopyFileDestinationPathSizeExceededError = 120,
  kCopyFilePathReferencesParentError = 121,
  kCopyFileFailedError = 122,
  kCopyFileInvalidFileAttributeError = 123,
  kCookieImportOpenOsfHandleError = 124,
  kCookieImportOpenFileDescriptorError = 125,
  kCookieImportReadFromFileHandleError = 126,
  kStartupUrlsNotFound = 127,
  kSuccess = 128,
  kNssLoginsFileEmpty = 129,
  kNssPasswordsNotFound = 130,
  kCookieImportCouldNotCreateJsonListError = 131,
  kCookieImportOpenProcessTokenError = 132,
  kCookieImportDuplicateProcessTokenError = 133,
  kCookieImportGetLowIntegritySidError = 134,
  kCookieImportSetTokenInformationError = 135,
  kEdgeDatabaseUsedFromSourcePath = 136,
  kImmersiveDirCopyDbFailed = 137,
  kOriginalDbNotFoundEdgeReplaced = 138,
  kOriginalDbNotFoundDatabaseDeleted = 139,
  kCookieSchemaNotSupported = 140,
  kParsedCookieListEmpty = 141,
  kNoExtensionsToImport = 142,
  kUnableToReadExtensions = 143,
  kOpenTabsErrorEdgeSessionLatest = 144,
  kLoginDataForAccountImportFailed = 145,
  kLoginDataImportFailed = 146,
  kDecryptionFailedWithElevation = 147,
  kAPPBEncryptionKeyDecryptionFailedWithElevation = 148,
  kDPAPIEncryptionKeyDecryptionFailedInSync = 149,
  kImportCookiesParseError = 150,
  kImportInvalidCookieDataBlob = 151,
  kWininetNotFound = 152,
  kImporterNotInitialized = 153,
  kMaxValue = kImporterNotInitialized
};

enum class ImportType {
  kAutoImport = 0,
  kManualImport = 1,
  kCustomizeImport = 2,
  kAutoImportV2 = 3,
  kDelayImport = 4,
  kReimport = 5,
  kCampaignTriggered = 6,
  kContinuousImport = 7,
  kChromeTakeoutImport = 8,
  kMaxValue = kChromeTakeoutImport
};

// These values are logged to UMA. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with "Microsoft.ContinuousMigration.ReadLocalState"
// in src/tools/metrics/histograms/edge_enums.xml.
enum class ImporterLocalStateReadState {
  kSuccess = 0,
  kFailed = 1,
  kJSONDeserializationError = 2,
  kInvalidLocalStateFile = 3,
  kMaxValue = kInvalidLocalStateFile
};

// These values are logged to UMA. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with "Microsoft.ContinuousMigration.DecryptKey"
// in src/tools/metrics/histograms/edge_enums.xml.
enum class ImporterDecryptKey {
  kSuccessfulDecryptionOfDPAPIKey = 0,
  kSuccessfulDecryptionOfAPPBKey = 1,
  kDPAPIKeyNotPresentInLocalStateFile = 2,
  kAPPBKeyNotPresentInLocalStateFile = 3,
  kAPPBKeyDecryptionFailedWithElevation = 4,
  kDPAPIKeyDecryptionFailed = 5,
  kDecodedDPAPIKeyEmpty = 6,
  kDecodedAPPBKeyEmpty = 7,
  kDecryptedDPAPIKeyEmpty = 8,
  kDecryptedAPPBKeyEmpty = 9,
  kMaxValue = kDecryptedAPPBKeyEmpty
};

// These values are logged to UMA. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with
// "Microsoft.ContinuousMigration.InitializeEnvironmentForImport" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class ImporterEnvironmentInitialize {
  kSetRawEncryptionKeySuccessfulInSync = 0,
  kEncryptorInstanceCreatedSuccessfully = 1,
  kDPAPIKeyRegisteredInAsyncProviders = 2,
  kAPPBKeyRegisteredInAsyncProviders = 3,
  kNoKeyRegisteredInAsyncProvidersKeyRingMap = 4,
  kMaxValue = kNoKeyRegisteredInAsyncProvidersKeyRingMap
};

// These values are logged to UMA. Entries should not be renumbered or
// removed and numeric values should never be reused.
// Please keep in sync with "Microsoft.ContinuousMigration.DecryptData"
// in src/tools/metrics/histograms/edge_enums.xml.
enum class ImporterDecryptDataStatus {
  kSuccessfulDataDecryptionWithSync = 0,
  kSuccessfulDataDecryptionWithAsync = 1,
  kFailedDataDecryptionWithSync = 2,
  kFailedDataDecryptionWithAsync = 3,
  kEncryptorInstanceNotInitialised = 4,
  kDPAPIKeyUsed = 5,
  kAPPBKeyUsed = 6,
  kV24DomainHashRemoved = 7,
  kV24InvalidHash = 8,
  kMaxValue = kV24InvalidHash
};

// These values are logged to UMA. Entries should not be renumbered
// numeric values should never be reused. Please keep in sync with
// "Microsoft.StartPageType" in src/tools/metrics/histograms/edge_enums.xml.
enum class StartPageType { kMSN = 0, kNTP, kOther, kLast, kMaxValue = kLast };

enum class ImportedPref {
  kAutofillCreditCardEnabledPref = 0,
  kAutofillPasswordEnabledPref,
  kAutofillProfileEnabledPref,
};

enum class ChromeTakeoutFileParseStatus {
  kUnknown = 0,
  kSuccess = 1,
  kBrowserHistoryError = 2,
  kPasswordsError = 3,
  kBookmarksError = 4,
  kAutofillError = 5,
  kMaxValue = kAutofillError
};

// These values are logged to UMA. Entries should not be renumbered
// numeric values should never be reused. Please keep in sync with
// "Microsoft.ContinuousMigration.ImportedMUIDSharingStates" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class ImportedMUIDSharingStates {
  kChromeMUIDRetained = 0,
  kFirstTimeImportedMUIDShared = 1,
  kImportedMUIDSharedAfterThresholdDays = 2,
  kImportedMUIDSharedToOneDsSuccessful = 3,
  kConnectionErrorWithCookieManager = 4,
  kImportedMUIDSharedOnCookieChange = 5,
  kImportedMUIDSharedToOneDsFailed = 6,
  kRequestToShareImportedMUIDSent = 7,
  kImportedMUIDNotSharedAsIdIsBeforeSANConsent = 8,
  kImportedMUIDNotSharedDueToMissingConsent = 9,
  kImportedMUIDNotSharedDueToMissingSANConsent = 10,
  kImportedMUIDNotSharedDueToMissingCIConsent = 11,
  kImportedMUIDSharedToOneDsCached = 12,
  kImportedMUIDSharedtoOneDsQueuedForProfiles = 13,
  kImportedMUIDSharedToOneDsPendingForDirectUpload = 14,
  kImportedMUIDSharedToOneDsPendingUploaderSequence = 15,
  kCallbackResultIsInvalid = 16,
  kImportEndedTiggerringImportedMUIDSharing = 17,
  kImportedMUIDSharingForNonWorkProfile = 18,
  kImportedMUIDSharingForSANConsentedUser = 19,
  KImportedMUIDEligibleForSharingToOneDs = 20,
  kImportedMUIDBeingSharedDueToCookieChange = 21,
  kImportedMUIDBeingSharedDueToFirstTime = 22,
  kImportedMUIDBeingSharedDueToThresholdDays = 23,
  kUnknown = 24,
  kImportedMUIDSharedDueToUnknownSucceedCallback = 25,
  kMUIDNotFound = 26,
  kMaxValue = kMUIDNotFound
};

// These values are logged to UMA. Entries should not be renumbered
// numeric values should never be reused. Please keep in sync with
// "Microsoft.ContinuousMigration.ImportedDataSharingFailureReason" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class ImportedDataSharingFailureReason {
  kUnknown = 0,
  kNoTelemetryService = 1,
  kNoConsent = 2,
  kNotAllowed = 3,
  kNotInSampleGroup = 4,
  kLargeEvent = 5,
  kMaxPendingEvents = 6,
  kNoUploader = 7,
  kNotInitialized = 8,
  kNoEventName = 9,
  kRestrictedForWebview = 10,
  kNoIngestionKey = 11,
  kNoEventLogger = 12,
  kUserIdError = 13,
  kNoUploaderSequence = 14,
  kErrorFlag = 15,
  kRestrictedForCopilot = 16,
  kMaxValue = kRestrictedForCopilot
};

// These values are logged to UMA. Entries should not be renumbered
// numeric values should never be reused. Please keep in sync with
// "Microsoft.ContinuousMigration.ThemesImportState" in
// src/tools/metrics/histograms/edge_enums.xml.
enum class ThemesImportState {
  kThemesImportStarted = 0,
  kThemeExtensionFound = 1,
  kThemeExtensionFlyoutTriggered = 2,
  kThemeExtensionNotImportedDueToOtherStoreConsent = 3,
  kThemeExtensionImportSkippedDueToRequirementsNotMet = 4,
  kThemeExtensionIsMicrosoftStoreExtension = 5,
  kThemeExtensionImportedWithOtherStoreConsent = 6,
  kThemeExtensionImported = 7,
  kThemesImportFinished = 8,
  kThemeExtensionNotEnabledDueToNoUserConsent = 9,
  kThemeExtensionNotInstalledDueToNoWebContents = 10,
  kThemeExtensionImportedWithoutOtherStoreConsent = 11,
  kMaxValue = kThemeExtensionImportedWithoutOtherStoreConsent
};

namespace metrics {

#if BUILDFLAG(IS_WIN)
inline constexpr std::string_view kEdgeContinuousThemesImportState =
    "Microsoft.ContinuousMigration.ThemesImport.State";
#endif  // BUILDFLAG(IS_WIN)

const char* GetImportTargetType(user_data_importer::ImporterType source_type);

const char* GetImportDataType(user_data_importer::ImportItem item);

std::string GetHistogramWithSuffix(std::string_view base_histogram,
                                   std::string_view suffix);

// Logs overall success of profile import in terms of ratio of
// what all has been selected and how many passed!
void LogImporterProfileSuccessMetric(
    ImportType import_type,
    user_data_importer::ImporterType source_type,
    double profile_import_ratio);

// Logs status of local state file read!
void LogImporterLocalStateReadMetric(std::string_view method,
                                     ImporterLocalStateReadState error);

// Logs status of eading local state encryption key
void LogImporterDecryptKeyMetric(std::string_view method,
                                 ImporterDecryptKey error);

// Logs status of Initialization of import environment
void LogImporterInitializeEnvironmentMetric(
    std::string_view method,
    ImporterEnvironmentInitialize error);

// Logs status of decryption of imported data
void LogImporterDecryptDataMetric(user_data_importer::ImportItem item,
                                  ImporterDecryptDataStatus error);

// Logs the performance of the decryption function
// for imported data keys using DPAPI or APPB.
void LogImporterDecryptKeyPerfMetric(std::string_view method,
                                     std::string_view encryption_key_name,
                                     base::TimeTicks start_time);

// Logs perf of overall import. This only captures the start of import
// and when user is unblocked. DB layer could still be in process of writing.
void LogImporterProfilePerfMetric(ImportType import_type,
                                  user_data_importer::ImporterType source_type,
                                  base::TimeTicks start_time);

// Logs success of individual data item import.
void LogImporterProfileDataTypeSuccessMetric(
    ImportType import_type,
    user_data_importer::ImporterType source_type,
    user_data_importer::ImportItem item,
    bool succeeded);

// Logs perf of individual data item import. This only captures time between
// start of import and when data is handed over to DB layer to be written
// on different thread.
void LogImporterProfileDataTypePerfMetric(
    ImportType import_type,
    user_data_importer::ImporterType source_type,
    user_data_importer::ImportItem item,
    base::TimeDelta run_time);

// Logs perf of Edge import to open database amd parse data.
void LogEdgeHistoryImportPerfMetric(bool is_open_db_perf,
                                    const base::TimeDelta& run_time);

// Logs perf of Edge download history import to fetch and parse download
// history rows
void LogEdgeDownloadHistoryImportPerfMetric(const base::TimeDelta& run_time);

// Logs the ImportErrorState enum to log errors in data import.
void LogImporterErrorMetric(user_data_importer::ImporterType source_type,
                            user_data_importer::ImportItem item,
                            ImportErrorState error);

void LogImporterErrorMetric(user_data_importer::ImporterType source_type,
                            ImportErrorState error);

// Returns suffix based on import type
const char* GetImportTypeSuffix(ImportType import_type);

// Logs the Spartan start page configuration
void LogSpartanStartPageConfiguration(StartPageType start_page);

// Logs count metrics for import of data types from importer process
void LogImportDetailCountImporter(user_data_importer::ImporterType source_type,
                                  user_data_importer::ImportItem item,
                                  int discovered_count,
                                  int extraction_count,
                                  int extraction_error_count);

// Logs count metrics for import of data types from browser process
void LogImportDetailCountBrowser(user_data_importer::ImporterType source_type,
                                 user_data_importer::ImportItem item,
                                 int insertion_count,
                                 int merge_count,
                                 int insertion_error_count,
                                 bool is_merged);

// Logs count metrics for update operation via import of data types from
// browser process
void LogUpdateOperationViaImportDetailCountBrowser(
    user_data_importer::ImporterType source_type,
    user_data_importer::ImportItem item,
    int update_count,
    int update_merge_count,
    int updation_error_count,
    int edge_deleted_count,
    bool is_merged);

// Logs count metrics for import of data types
void LogImportDetailCountWithItemName(
    user_data_importer::ImporterType source_type,
    const std::string& import_item_name,
    user_data_importer::ImportDetailType count_type,
    int count);

// Logs count metrics for import of data types
void LogImportDetailCount(user_data_importer::ImporterType source_type,
                          user_data_importer::ImportItem item,
                          user_data_importer::ImportDetailType count_type,
                          int count);

// Log ratio metrics for import of data types from importer process
void LogImportDetailRatioImporter(user_data_importer::ImporterType source_type,
                                  user_data_importer::ImportItem item,
                                  int extraction_ratio,
                                  int extraction_error_ratio);

// Log ratio metrics for import of data types from browser process
void LogImportDetailRatioBrowser(user_data_importer::ImporterType source_type,
                                 user_data_importer::ImportItem item,
                                 int insertion_ratio,
                                 int merge_ratio,
                                 int insertion_error_ratio,
                                 bool is_merged);

// Log ratio metrics for update operation via import of data types from
// browser process
void LogUpdateOperationViaImportDetailRatioBrowser(
    user_data_importer::ImporterType source_type,
    user_data_importer::ImportItem item,
    int updation_ratio,
    int update_merge_ratio,
    int updation_error_ratio,
    int edge_deleted_ratio,
    bool is_merged);

// Log ratio metrics for import of data types
void LogImportDetailRatio(
    user_data_importer::ImporterType source_type,
    user_data_importer::ImportItem item,
    user_data_importer::ImportDetailType ratio_suffix_type,
    int percentage);

// Log import counts and ratios related histograms for an import item
// depending on the import operation type, i.e. ADD/UPDATE/REMOVE(to be
// implemented in future)
void AddHistogramsForImport(edge_continuous_migration::OperationType operation,
                            user_data_importer::ImporterType importer_type,
                            user_data_importer::ImportItem import_item_type,
                            int total_count,
                            int success_count,
                            int merge_count,
                            int error_count,
                            int edge_deleted_count,
                            bool is_merged);

#if BUILDFLAG(IS_WIN)
// JetErrors are negative numbers. This method logs the exact error code.
void LogSpartanOpenDatabaseError(user_data_importer::ImportItem item,
                                 long error);

void LogCopyFileError(user_data_importer::ImporterType type,
                      edge_import::CopyErrorType error);

// Log errors for firefox password import during NSS
void LogFirefoxNSSError(user_data_importer::NSSLocation nssLocation,
                        user_data_importer::NSSBinary binaryName,
                        user_data_importer::NSSFailCase failureCase,
                        long error);

void LogVaultApiReadError(long error_code);

void LogVaultReadErrorCount(int error_count);

void LogCopyFileErrorCode(user_data_importer::ImporterType source_type,
                          user_data_importer::ImportItem item,
                          long error_code);

void LogCopyFileErrorSize(user_data_importer::ImporterType source_type,
                          user_data_importer::ImportItem item,
                          int64_t file_size);

// Log themes import state
void LogThemesImportState(ThemesImportState state);
#endif

// Log pref states for imported bool prefs
void LogImportedBoolPrefValueMetric(
    user_data_importer::ImporterType source_type,
    ImportedPref pref_name,
    bool pref_value);

void LogChromeTakeoutFileParseStatus(ChromeTakeoutFileParseStatus status);

// Logs status of sharing Imported MUID to OneDs
void LogImportedMUIDSharingStatesHistogram(ImportedMUIDSharingStates state);
}  // namespace metrics
}  // namespace importer

#endif  // CHROME_COMMON_IMPORTER_EDGE_IMPORTER_PROFILE_METRICS_H_
