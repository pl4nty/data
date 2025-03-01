// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_PROCESS_H_
#define TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_PROCESS_H_

#include <windows.h>

#include "base/win/scoped_handle.h"

#include <string>
#include <vector>

namespace process_viewer {

enum class ProcessType {
  Unknown = 0,
  Browser,
  CrashpadHandler,
  Watcher,
  Gpu,
  Utility,
  Plugin,
  PluginBroker,
  Extension,
  Renderer,
  IEManager,
  IEContent,
};

enum class IntegrityLevel {
  Unknown = 0,
  System,
  High,
  Medium,
  Low,
  Untrusted,
  AppContainer,
};

enum class SignaturePolicy : uint32_t {
  kNone = 0,
  kMicrosoftSignedOnly = 0x1,
  kStoreSignedOnly = 0x2,
  kMitigationOptIn = 0x4,
};

enum class DynamicCodePolicy : uint32_t {
  kNone = 0x0,
  kProhibitDynamicCode = 0x1,
  kAllowThreadOptOut = 0x2,
  kAllowRemoteDowngrade = 0x4,
};

enum class SessionType : uint32_t {
  Unknown = 0,
  CanaryChannel = 0x1,
  DeveloperChannel = 0x2,
  BetaChannel = 0x4,
  StableChannel = 0x10,
  LocalBuild = 0x20,
  IEProcess = 0x40,
  Webview = 0x80,
};

class Process {
 public:
  Process(ULONG process_id, LONGLONG create_time, ULONG parent_process_id);
  virtual ~Process();
  Process(const Process&) = delete;
  Process& operator=(const Process&) = delete;


  ULONG process_id() const { return process_id_; }

  LONGLONG create_time() const { return create_time_; }

  ULONG parent_process_id() const { return parent_process_id_; }

  const std::wstring& full_image_name() const { return full_image_name_; }

  const std::wstring& command_line() const { return command_line_; }

  ProcessType type() const { return process_type_; }

  IntegrityLevel integrity_level() const { return integrity_level_; }

  SignaturePolicy signature_policy() const { return signature_policy_; }

  DynamicCodePolicy dynamic_code_policy() const { return dynamic_code_policy_; }

  const std::vector<std::wstring>& enterprise_ids() const {
    return enterprise_ids_;
  }

  int cpu_usage() const { return cpu_usage_; }

  LONGLONG memory_usage() const { return memory_usage_; }

  SessionType session_type() const { return session_type_; }

  // Refreshes information about a process. Note that some information must be
  // updated separately by calling specific methods below.
  virtual void Refresh();

  bool HasRefreshed() const { return refreshed_; }
  void ResetRefreshed() { refreshed_ = false; }

  // Updates the information about how much memory the process is using.
  void UpdateMemoryUsage(LONGLONG new_memory_usage) {
    memory_usage_ = new_memory_usage;
  }

  // Updates the information about how much CPU the process is using.
  void UpdateCpuUsage(LONGLONG new_process_cpu_time,
                      LONGLONG new_system_cpu_time);

 protected:
  // Called when the process command line is updated, for derived classes who
  // want to make decisions based on the command line.
  virtual void OnCommandLineUpdated() {}

  void set_process_type(ProcessType new_process_type) {
    process_type_ = new_process_type;
  }

  void set_session_type(SessionType new_session_type) {
    session_type_ = new_session_type;
  }

  HANDLE process_handle() {
    return (full_process_handle_.IsValid() ? full_process_handle_.Get()
                                           : limited_process_handle_.Get());
  }

 private:
  ULONG process_id_ = 0;
  LONGLONG create_time_ = 0;
  ULONG parent_process_id_ = 0;
  std::wstring full_image_name_;
  std::wstring command_line_;
  ProcessType process_type_ = ProcessType::Unknown;
  IntegrityLevel integrity_level_ = IntegrityLevel::Unknown;
  SignaturePolicy signature_policy_ = SignaturePolicy::kNone;
  DynamicCodePolicy dynamic_code_policy_ = DynamicCodePolicy::kNone;
  std::vector<std::wstring> enterprise_ids_;
  double cpu_usage_ = 0.0;
  LONGLONG process_cpu_time_ = 0;
  LONGLONG system_cpu_time_ = 0;
  LONGLONG memory_usage_ = 0;
  SessionType session_type_ = SessionType::Unknown;
  bool refreshed_ = false;

  base::win::ScopedHandle full_process_handle_;
  base::win::ScopedHandle limited_process_handle_;
};

}  // namespace process_viewer

#endif  // TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_PROCESS_H_
