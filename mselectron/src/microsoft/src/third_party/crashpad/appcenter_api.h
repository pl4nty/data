// Copyright (c) 2019 Microsoft Corporation.

#ifndef MICROSOFT_SRC_THIRD_PARTY_CRASHPAD_APPCENTER_API_H_
#define MICROSOFT_SRC_THIRD_PARTY_CRASHPAD_APPCENTER_API_H_

#include <cstddef>
#include <map>
#include <optional>
#include <string>

#include "base/memory/singleton.h"
#include "base/time/time.h"
#include "base/values.h"
#include "build/build_config.h"

namespace crashpad {
class FileReader;
class ProcessSnapshotMinidump;
}  // namespace crashpad

namespace microsoft {

class AppCenter {
 public:
  AppCenter();
  ~AppCenter();

  void Initialize(const std::string& url);
  bool IsInitialized() const;

  std::optional<std::string> GenerateCrashJson(
      const std::string& executable_name,
      const std::string& version,
      int32_t pid,
      const std::string& report_id,
      const std::map<std::string, std::string>& parameters_from_minidump,
      const std::string& minidump_b64);

  bool CrashPadUploadReport(
      const crashpad::ProcessSnapshotMinidump& process_snapshot_minidump,
      const std::map<std::string, std::string>& parameters_from_minidump,
      crashpad::FileReader* reader,
      std::string* response_body);

  static AppCenter* GetInstance();

 private:
  friend struct base::DefaultSingletonTraits<AppCenter>;

  void Initialize(const std::string& app_secret,
                  const std::string& instance_uid,
                  const std::string& user_id,
                  const std::string& session_id);

  base::Value GenerateDeviceInfo(const std::string& app_version);
  base::Value GenerateExceptionInfo(base::Value device_info,
                                    const std::string& id,
                                    const base::Time& time_stamp,
                                    const std::string& executable_name,
                                    int32_t pid);
  base::Value GenerateParametersEvent(
      base::Value device_info,
      const std::string& parent_guid,
      const base::Time& time_stamp,
      const std::map<std::string, std::string>& parameters);
  base::Value GenerateMinidumpAttachment(base::Value device_info,
                                         const std::string& parent_guid,
                                         const base::Time& time_stamp,
                                         const std::string& minidump_b64);

  base::Value GenerateCrash(
      const std::string& executable_name,
      const std::string& version,
      int32_t pid,
      const std::string& report_id,
      const std::map<std::string, std::string>& parameters_from_minidump,
      const std::string& minidump_b64);

  bool CrashPadUploadReport(const std::string& payload);

  std::string app_secret_;
  std::string instance_uid_;
  std::string user_id_;
  std::string session_id_;
  base::Time start_time_;
};

}  // namespace microsoft

#endif  // MICROSOFT_SRC_THIRD_PARTY_CRASHPAD_APPCENTER_API_H_
