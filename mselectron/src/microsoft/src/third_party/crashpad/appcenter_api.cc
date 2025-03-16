// Copyright (c) 2019 Microsoft Corporation.
// https://docs.microsoft.com/en-us/appcenter/diagnostics/upload-crashes#upload-a-breakpad-crash-log-and-minidump

#include "microsoft/src/third_party/crashpad/appcenter_api.h"

#include <ctime>
#include <map>
#include <memory>
#include <string_view>
#include <utility>
#include <vector>

#include "base/base64.h"
#include "base/files/file_util.h"
#include "base/i18n/rtl.h"
#include "base/json/json_reader.h"
#include "base/json/json_writer.h"
#include "base/logging.h"
#include "base/strings/string_split.h"
#include "base/strings/stringprintf.h"
#include "base/strings/utf_string_conversions.h"
#include "base/system/sys_info.h"
#include "base/time/time.h"
#include "base/uuid.h"
#include "base/values.h"
#include "build/build_config.h"
#include "electron/electron_version.h"
#include "microsoft/buildflags/buildflags.h"
#include "snapshot/minidump/process_snapshot_minidump.h"
#include "snapshot/module_snapshot.h"
#include "util/file/file_reader.h"
#include "util/misc/metrics.h"
#include "util/misc/uuid.h"
#include "util/net/http_body.h"
#include "util/net/http_multipart_builder.h"
#include "util/net/http_transport.h"
#include "util/net/url.h"

namespace microsoft {

namespace {

// Formats a time compliant to ISO 8601 in UTC, e.g. "2020-12-31T23:59:59.999Z".
//
// This behaves identically to the function in base/i18n/time_formatting.h.
std::string TimeFormatAsIso8601(const base::Time& time) {
  base::Time::Exploded exploded;
  time.UTCExplode(&exploded);
  return base::StringPrintf(
      "%04d-%02d-%02dT%02d:%02d:%02d.%03dZ", exploded.year, exploded.month,
      exploded.day_of_month, exploded.hour, exploded.minute, exploded.second,
      exploded.millisecond);
}

bool ParseAppCenterURL(const std::string& url,
                       std::string* app_secret,
                       std::string* instance_uid,
                       std::string* user_id,
                       std::string* session_id) {
  // find appcenter scheme in url
  // example url: appcenter://somestuff<##>aria://someotherstuff
  static constexpr const char kAppcenter[] = "appcenter://";
  std::string appcenter_scheme = "";
  auto schemes_in_url = base::SplitStringUsingSubstr(
      url, "<##>", base::TRIM_WHITESPACE, base::SPLIT_WANT_NONEMPTY);
  for (const auto& scheme : schemes_in_url) {
    if (scheme.compare(0, strlen(kAppcenter), kAppcenter) == 0) {
      appcenter_scheme = scheme;
      break;
    }
  }

  size_t host_start;
  if (!appcenter_scheme.empty()) {
    host_start = strlen(kAppcenter);
  } else {
    LOG(ERROR) << "expecting appcenter url prefix";
    return false;
  }

  // Find the start of the parameters.
  size_t resource_start = appcenter_scheme.find('?', host_start);
  if (resource_start == std::string::npos) {
    LOG(ERROR) << "expecting appcenter url parameters";
    return false;
  }

  auto rest = appcenter_scheme.substr(resource_start + 1);
  for (const auto& cur : base::SplitStringUsingSubstr(
           rest, "&", base::TRIM_WHITESPACE, base::SPLIT_WANT_NONEMPTY)) {
    const auto kv = base::SplitStringUsingSubstr(
        cur, "=", base::TRIM_WHITESPACE, base::SPLIT_WANT_NONEMPTY);
    if (kv.size() == 2) {
      if (kv[0] == "aid") {
        *app_secret = kv[1];
      } else if (kv[0] == "iid") {
        *instance_uid = kv[1];
      } else if (kv[0] == "uid") {
        *user_id = kv[1];
      } else if (kv[0] == "sid") {
        *session_id = kv[1];
      }
    }
  }
  return true;
}

std::string GenerateGUID() {
  return base::Uuid::GenerateRandomV4().AsLowercaseString();
}

bool IsValidGUID(std::string_view input) {
  return base::Uuid::ParseCaseInsensitive(input).is_valid();
}

}  // namespace

// static
AppCenter* AppCenter::GetInstance() {
  return base::Singleton<AppCenter>::get();
}

AppCenter::AppCenter() : start_time_{base::Time::Now()} {}

AppCenter::~AppCenter() {}

void AppCenter::Initialize(const std::string& app_secret,
                           const std::string& instance_uid,
                           const std::string& user_id,
                           const std::string& session_id) {
  if (!IsValidGUID(app_secret)) {
    LOG(ERROR) << "invalid app secret";
    return;
  }
  app_secret_ = app_secret;

  instance_uid_ = instance_uid;
  if (instance_uid_.empty() || !IsValidGUID(instance_uid_)) {
    instance_uid_ = GenerateGUID();
  }

  user_id_ = user_id;
  if (user_id_.empty()) {
    user_id_ = GenerateGUID();
  }

  session_id_ = session_id;
  if (session_id_.empty() || !IsValidGUID(session_id_)) {
    session_id_ = GenerateGUID();
  }
}

void AppCenter::Initialize(const std::string& url) {
  std::string app_secret, instance_uid, user_id, session_id;

  // Parse appcenter parameter from url
  if (!ParseAppCenterURL(url, &app_secret, &instance_uid, &user_id,
                         &session_id)) {
    return;
  }

  Initialize(app_secret, instance_uid, user_id, session_id);
}

bool AppCenter::IsInitialized() const {
  return !app_secret_.empty();
}

base::Value AppCenter::GenerateDeviceInfo(const std::string& app_version) {
  base::Value::Dict dict;
  dict.Set("sdkName", "appcenter.custom");
  dict.Set("sdkVersion", "2.4.1-SNAPSHOT");
  // TODO(kykropyv): app-specific?
  dict.Set("appNamespace", "com.microsoft.electron");
  dict.Set("appVersion", app_version);

  std::string electron_version = ELECTRON_VERSION_STRING;
  // #if BUILDFLAG(MICROSOFT_ADD_BUILD_VERSION_TO_PROCESS_VERSIONS)
  //   electron_version += ";ms-";
  //   electron_version += MICROSOFT_BUILD_VERSION_STRING;
  // #endif
  // TODO(kykropyv): reiterate
  dict.Set("appBuild", electron_version);
  dict.Set("wrapperSdkName", "custom.ndk");

  // do we need it on PC where there are multiple screens?
  dict.Set("screenSize", "42x42");

  std::string hwModel = base::SysInfo::HardwareModelName();
  if (hwModel.empty()) {
    hwModel = "Generic";
  }

  dict.Set("model", hwModel);

  // dict.Set("osName", base::SysInfo::OperatingSystemName());
#if BUILDFLAG(IS_WIN)
  dict.Set("oemName", hwModel);  // TODO(kykropyv): the same now
  dict.Set("osName", "Windows");
#elif BUILDFLAG(IS_MAC)
  dict.Set("oemName", "Apple");
  dict.Set("osName", "macOS");
#else
  dict.Set("oemName", hwModel);  // TODO(kykropyv): the same now
  dict.Set("osName", "Linux");
#endif
  dict.Set("osVersion", base::SysInfo::OperatingSystemVersion());
  // TODO(kykropyv): the same now
  dict.Set("osBuild", base::SysInfo::OperatingSystemVersion());

  // dict.Set("locale", base::i18n::GetConfiguredLocale());
  // TODO(kykropyv): get from system
  dict.Set("locale", "en-US");
  // TODO(kykropyv): get from system
  dict.Set("carrierCountry", "us");

#if BUILDFLAG(IS_WIN)
  TIME_ZONE_INFORMATION tz{};
  if (GetTimeZoneInformation(&tz) != TIME_ZONE_ID_INVALID) {
    dict.Set("timeZoneOffset", static_cast<int32_t>(-tz.Bias));
  } else {
    dict.Set("timeZoneOffset", 0);
  }
#else
  time_t now = time(nullptr);
  tm time = {};
  localtime_r(&now, &time);
  dict.Set("timeZoneOffset", static_cast<int32_t>(time.tm_gmtoff / 60));
#endif
  return base::Value(std::move(dict));
}

base::Value AppCenter::GenerateExceptionInfo(base::Value device_info,
                                             const std::string& id,
                                             const base::Time& time_stamp,
                                             const std::string& executable_name,
                                             int32_t pid) {
  base::Value::Dict dict;
  dict.Set("type", "managedError");
  dict.Set("id", id);
  dict.Set("sid", session_id_);
  dict.Set("userId", user_id_);
  dict.Set("processId", pid);
  dict.Set("processName", executable_name);
  dict.Set("fatal", true);
  dict.Set("timestamp", TimeFormatAsIso8601(time_stamp));
  dict.Set("appLaunchTimestamp", TimeFormatAsIso8601(start_time_));

#if defined(ARCH_CPU_X86_64)
  dict.Set("architecture", "X64");
#elif defined(ARCH_CPU_X86)
  // todo(kykropyv): not sure which value is correct for x86 platfrom identifier
  // here
  dict.Set("architecture", "X86");
#elif defined(ARCH_CPU_ARM64)
  dict.Set("architecture", "arm64");
#elif defined(ARCH_CPU_ARMEL)
  dict.Set("architecture", "arm");
#else
#error "Not implemented"
#endif

  dict.Set("device", std::move(device_info));

  base::Value::Dict exception;
  exception.Set("type", "minidump");
  exception.Set("wrapperSdkName", "custom.ndk");

  dict.Set("exception", std::move(exception));

  return base::Value(std::move(dict));
}

base::Value AppCenter::GenerateParametersEvent(
    base::Value device_info,
    const std::string& parent_guid,
    const base::Time& time_stamp,
    const std::map<std::string, std::string>& parameters) {
  base::Value::Dict dict;

  dict.Set("type", "event");
  dict.Set("name", "crash");  // event name
  dict.Set("errorId", parent_guid);
  dict.Set("id", GenerateGUID());
  dict.Set("sid", session_id_);
  dict.Set("userId", user_id_);
  dict.Set("timestamp", TimeFormatAsIso8601(time_stamp));

  base::Value::Dict props;
  for (auto&& kv : parameters) {
    props.Set(kv.first, kv.second);
  }
  dict.Set("properties", std::move(props));

  dict.Set("device", std::move(device_info));
  return base::Value(std::move(dict));
}

base::Value AppCenter::GenerateMinidumpAttachment(
    base::Value device_info,
    const std::string& parent_guid,
    const base::Time& time_stamp,
    const std::string& minidump_b64) {
  base::Value::Dict dict;
  dict.Set("contentType", "application/octet-stream");
  dict.Set("errorId", parent_guid);
  dict.Set("fileName", "minidump.dmp");
  dict.Set("id", GenerateGUID());
  dict.Set("sid", session_id_);
  dict.Set("timestamp", TimeFormatAsIso8601(time_stamp));
  dict.Set("type", "errorAttachment");
  dict.Set("device", std::move(device_info));
  dict.Set("data", minidump_b64);

  return base::Value(std::move(dict));
}

base::Value AppCenter::GenerateCrash(
    const std::string& executable_name,
    const std::string& version,
    int32_t pid,
    const std::string& report_id,
    const std::map<std::string, std::string>& parameters_from_minidump,
    const std::string& minidump_b64) {
  auto device_info = GenerateDeviceInfo(version);
  auto time_stamp = base::Time::Now();

  base::Value::List logs;
  logs.Append(GenerateExceptionInfo(device_info.Clone(), report_id, time_stamp,
                                    executable_name, pid));
  if (!parameters_from_minidump.empty()) {
    logs.Append(GenerateParametersEvent(device_info.Clone(), report_id,
                                        time_stamp, parameters_from_minidump));
  }
  logs.Append(GenerateMinidumpAttachment(std::move(device_info), report_id,
                                         time_stamp, minidump_b64));

  base::Value::Dict dict;
  dict.Set("logs", std::move(logs));

  return base::Value(std::move(dict));
}

std::optional<std::string> AppCenter::GenerateCrashJson(
    const std::string& executable_name,
    const std::string& version,
    int32_t pid,
    const std::string& report_id,
    const std::map<std::string, std::string>& parameters_from_minidump,
    const std::string& minidump_b64) {
  std::string output;
  if (base::JSONWriter::Write(
          GenerateCrash(executable_name, version, pid, report_id,
                        parameters_from_minidump, minidump_b64),
          &output)) {
    return output;
  }
  return std::nullopt;
}

bool AppCenter::CrashPadUploadReport(const std::string& payload) {
  std::unique_ptr<crashpad::HTTPBodyStream> body_stream{
      new crashpad::StringHTTPBodyStream{payload}};
  std::unique_ptr<crashpad::HTTPTransport> http_transport{
      crashpad::HTTPTransport::Create()};
  http_transport->SetHeader("App-Secret", app_secret_);
  http_transport->SetHeader("Install-ID", instance_uid_);
  http_transport->SetURL("https://in.appcenter.ms/logs?api-version=1.0.0");
  http_transport->SetMethod("POST");
  http_transport->SetTimeout(60.0);
  http_transport->SetBodyStream(std::move(body_stream));
  http_transport->SetHeader("Content-Type", "application/json");

  std::string response_body;
  if (!http_transport->ExecuteSynchronously(&response_body)) {
    return false;
  }

  auto response = base::JSONReader::Read(response_body);
  if (!response) {
    LOG(ERROR) << response_body;
    return false;
  }

  auto* status = response->GetDict().Find("status");
  if (!status || status->GetString() != "Success") {
    LOG(ERROR) << response_body;
    return false;
  }

  return true;
}

bool AppCenter::CrashPadUploadReport(
    const crashpad::ProcessSnapshotMinidump& process_snapshot_minidump,
    const std::map<std::string, std::string>& parameters_from_minidump,
    crashpad::FileReader* reader,
    std::string* response_body) {
  if (app_secret_.empty()) {
    return false;
  }

  std::string executable_name;
  std::string version;
  std::string report_id;
  int32_t pid;

  {
    auto it = parameters_from_minidump.find("_productName");
    if (it != parameters_from_minidump.end()) {
      executable_name = it->second;
    }

    it = parameters_from_minidump.find("_version");
    if (it != parameters_from_minidump.end()) {
      version = it->second;
    }

    crashpad::UUID report_uuid;
    process_snapshot_minidump.ReportID(&report_uuid);
    report_id = report_uuid.ToString();

    pid = process_snapshot_minidump.ProcessID();
  }

  // We set response body to report id because AppCenter is using whatever id
  // we send there. Also response from in.appcenter.com is just JSON which
  // looks like this:
  // {
  //   "status":"Success",
  //   "validDiagnosticsIds":[],
  //   "throttledDiagnosticsIds":[],
  //   "correlationId":"70de6a0e-fb61-4767-bd1a-1f10efe9ead1"
  // }
  *response_body = report_id;

  crashpad::FileOffset start_offset = reader->SeekGet();
  if (start_offset < 0) {
    return false;
  }

  if (!reader->Seek(0, SEEK_END)) {
    return false;
  }

  crashpad::FileOffset dump_size = reader->SeekGet();
  if (!reader->SeekSet(0)) {
    return false;
  }

  std::optional<std::string> json_payload;
  {
    std::vector<char> dump_buffer;
    dump_buffer.resize(dump_size);
    if (!reader->ReadExactly(&dump_buffer.front(), dump_size)) {
      return false;
    }

    std::string_view minidump{
        reinterpret_cast<const char*>(&dump_buffer.front()),
        static_cast<std::string_view::size_type>(dump_size)};
    json_payload = GenerateCrashJson(executable_name, version, pid, report_id,
                                     parameters_from_minidump,
                                     base::Base64Encode(minidump));
  }

  if (json_payload) {
    return CrashPadUploadReport(json_payload.value());
  }

  return false;
}

}  // namespace microsoft
