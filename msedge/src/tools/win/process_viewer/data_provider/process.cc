// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/data_provider/process.h"

#include "tools/win/process_viewer/data_provider/ntdefs.h"
#include <srpapi.h>
#include <windows.h>
#include "base/stl_util.h"

namespace process_viewer {

namespace {

bool GetProcessBasicInformation(HANDLE process_handle,
                                PROCESS_BASIC_INFORMATION* basic_info) {
  static const auto nt_query_information_process_ptr =
      reinterpret_cast<decltype(&NtQueryInformationProcess)>(GetProcAddress(
          GetModuleHandle(L"ntdll.dll"), "NtQueryInformationProcess"));
  if (!nt_query_information_process_ptr) {
    return false;
  }

  ULONG num_bytes;
  NTSTATUS status = nt_query_information_process_ptr(
      process_handle, ProcessBasicInformation, basic_info, sizeof(*basic_info),
      &num_bytes);
  return NT_SUCCESS(status);
}

base::win::ScopedHandle GetProcessToken(HANDLE process_handle,
                                        DWORD desired_access) {
  HANDLE process_token;
  if (!OpenProcessToken(process_handle, desired_access, &process_token)) {
    return {};
  }
  return base::win::ScopedHandle(process_token);
}

std::vector<uint8_t> GetTokenInfo(HANDLE token_handle,
                                  TOKEN_INFORMATION_CLASS token_info_class) {
  DWORD num_bytes;
  if (GetTokenInformation(token_handle, token_info_class, nullptr, 0,
                          &num_bytes)) {
    return {};
  }
  if (GetLastError() != ERROR_INSUFFICIENT_BUFFER) {
    return {};
  }
  std::vector<uint8_t> buffer(num_bytes);
  if (!GetTokenInformation(token_handle, token_info_class, buffer.data(),
                           buffer.size(), &num_bytes)) {
    return {};
  }
  return buffer;
}

IntegrityLevel IntegrityLevelFromMandatoryRid(DWORD mandatory_rid) {
  switch (mandatory_rid) {
    case SECURITY_MANDATORY_SYSTEM_RID:
      return IntegrityLevel::System;
    case SECURITY_MANDATORY_HIGH_RID:
      return IntegrityLevel::High;
    case SECURITY_MANDATORY_MEDIUM_RID:
      return IntegrityLevel::Medium;
    case SECURITY_MANDATORY_LOW_RID:
      return IntegrityLevel::Low;
    case SECURITY_MANDATORY_UNTRUSTED_RID:
      return IntegrityLevel::Untrusted;
    default:
      return IntegrityLevel::Unknown;
  }
}

bool IsAppContainerProcess(HANDLE process_token) {
  std::vector<uint8_t> buffer =
      GetTokenInfo(process_token, TokenIsAppContainer);
  if (buffer.empty()) {
    return false;
  }
  DWORD* is_app_container = reinterpret_cast<DWORD*>(buffer.data());
  return *is_app_container != 0;
}

IntegrityLevel GetProcessIntegrityLevel(HANDLE process_handle) {
  base::win::ScopedHandle process_token(
      GetProcessToken(process_handle, TOKEN_QUERY));
  if (!process_token.IsValid()) {
    return IntegrityLevel::Unknown;
  }

  std::vector<uint8_t> buffer =
      GetTokenInfo(process_token.Get(), TokenIntegrityLevel);
  if (buffer.empty()) {
    return IntegrityLevel::Unknown;
  }
  TOKEN_MANDATORY_LABEL* label =
      reinterpret_cast<TOKEN_MANDATORY_LABEL*>(buffer.data());
  PSID sid = label->Label.Sid;
  if (!IsValidSid(sid)) {
    return IntegrityLevel::Unknown;
  }
  UCHAR subauthority_count = *GetSidSubAuthorityCount(sid);
  if (subauthority_count == 0) {
    return IntegrityLevel::Unknown;
  }
  DWORD subauthority = *GetSidSubAuthority(sid, subauthority_count - 1);
  IntegrityLevel integrity_level = IntegrityLevelFromMandatoryRid(subauthority);

  bool may_be_appcontainer = integrity_level == IntegrityLevel::Low ||
                             integrity_level == IntegrityLevel::Untrusted;
  if (may_be_appcontainer && IsAppContainerProcess(process_token.Get())) {
    integrity_level = IntegrityLevel::AppContainer;
  }
  return integrity_level;
}

bool IsWow64Process(HANDLE process_handle) {
  BOOL is_wow64;
  if (!::IsWow64Process(process_handle, &is_wow64)) {
    return false;
  }
  return !!is_wow64;
}

std::wstring GetProcessCommandLine(HANDLE process_handle) {
  static const bool is_current_process_wow64 =
      IsWow64Process(GetCurrentProcess());
  if (is_current_process_wow64 && !IsWow64Process(process_handle)) {
    // Can't read memory of a 64-bit process from a 32-bit process.
    return {};
  }

  PROCESS_BASIC_INFORMATION basic_info;
  if (!GetProcessBasicInformation(process_handle, &basic_info)) {
    return {};
  }
  PEB peb;
  SIZE_T num_bytes;
  if (!ReadProcessMemory(process_handle, basic_info.PebBaseAddress, &peb,
                         sizeof(peb), &num_bytes)) {
    return {};
  }

  void* command_line_address =
      reinterpret_cast<uint8_t*>(peb.ProcessParameters) +
      offsetof(RTL_USER_PROCESS_PARAMETERS, CommandLine);
  UNICODE_STRING command_line;
  if (!ReadProcessMemory(process_handle, command_line_address, &command_line,
                         sizeof(command_line), &num_bytes)) {
    return {};
  }

  auto command_line_buffer =
      std::make_unique<wchar_t[]>(command_line.Length);
  num_bytes = command_line.Length * sizeof(command_line_buffer[0]);
  if (!ReadProcessMemory(process_handle, command_line.Buffer,
                         command_line_buffer.get(), num_bytes, &num_bytes)) {
    return {};
  }

  return std::wstring(command_line_buffer.get(), command_line.Length);
}

SignaturePolicy GetProcessSignaturePolicy(HANDLE process_handle) {
  static const auto get_process_mitigation_policy_ptr =
      reinterpret_cast<decltype(&GetProcessMitigationPolicy)>(GetProcAddress(
          GetModuleHandle(L"kernel32.dll"), "GetProcessMitigationPolicy"));
  if (!get_process_mitigation_policy_ptr) {
    return SignaturePolicy::kNone;
  }

  PROCESS_MITIGATION_BINARY_SIGNATURE_POLICY signature_policy;
  if (!get_process_mitigation_policy_ptr(process_handle, ProcessSignaturePolicy,
                                         &signature_policy,
                                         sizeof(signature_policy))) {
    return SignaturePolicy::kNone;
  }
  return static_cast<SignaturePolicy>(signature_policy.Flags);
}

DynamicCodePolicy GetProcessDynamicCodePolicy(HANDLE process_handle) {
  static const auto get_process_mitigation_policy_ptr =
      reinterpret_cast<decltype(&GetProcessMitigationPolicy)>(GetProcAddress(
          GetModuleHandle(L"kernel32.dll"), "GetProcessMitigationPolicy"));
  if (!get_process_mitigation_policy_ptr) {
    return DynamicCodePolicy::kNone;
  }

  PROCESS_MITIGATION_DYNAMIC_CODE_POLICY dynamic_code_policy;
  if (!get_process_mitigation_policy_ptr(
          process_handle, ProcessDynamicCodePolicy, &dynamic_code_policy,
          sizeof(dynamic_code_policy))) {
    return DynamicCodePolicy::kNone;
  }
  return static_cast<DynamicCodePolicy>(dynamic_code_policy.Flags);
}

std::vector<std::wstring> GetProcessEnterpriseIds(HANDLE process_handle) {
  static const auto srp_get_enterprise_ids_ptr =
      reinterpret_cast<decltype(&SrpGetEnterpriseIds)>(GetProcAddress(
          GetModuleHandle(L"srpapi.dll"), "SrpGetEnterpriseIds"));
  if (!srp_get_enterprise_ids_ptr) {
    return {};
  }

  base::win::ScopedHandle process_token(
      GetProcessToken(process_handle, TOKEN_QUERY));
  if (!process_token.IsValid()) {
    return {};
  }

  ULONG enterprise_ids_count = 0;
  ULONG enterprise_ids_size = 0;
  HRESULT hr =
      srp_get_enterprise_ids_ptr(process_token.Get(), &enterprise_ids_size,
                                 nullptr, &enterprise_ids_count);
  if (hr != E_NOT_SUFFICIENT_BUFFER) {
    // Either there are zero enterprise IDs or the call failed.
    return {};
  }

  auto enterprise_ids_buffer =
      std::make_unique<uint32_t[]>(enterprise_ids_size);
  PCWSTR* enterprise_ids_raw =
      reinterpret_cast<PCWSTR*>(enterprise_ids_buffer.get());
  hr = srp_get_enterprise_ids_ptr(process_token.Get(), &enterprise_ids_size,
                                  enterprise_ids_raw, &enterprise_ids_count);
  if (FAILED(hr) || enterprise_ids_count == 0) {
    return {};
  }
  std::vector<std::wstring> enterprise_ids(enterprise_ids_count);
  for (ULONG i = 0; i < enterprise_ids_count; i++) {
    enterprise_ids[i] = enterprise_ids_raw[i];
  }
  return enterprise_ids;
}

}  // namespace

Process::Process(ULONG process_id,
                 LONGLONG create_time,
                 ULONG parent_process_id)
    : process_id_(process_id),
      create_time_(create_time),
      parent_process_id_(parent_process_id) {
  // Attempt to obtain a process handle with the permissions needed for all the
  // information we want. If that fails (e.g. because the process is at a higher
  // integrity level), then attempt to obtain a handle with lower permissions
  // that will let us obtain at least some of the information we want.
  full_process_handle_.Set(OpenProcess(
      PROCESS_QUERY_INFORMATION | PROCESS_VM_READ, FALSE, process_id));
  if (!full_process_handle_.IsValid()) {
    limited_process_handle_.Set(
        OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, FALSE, process_id));
  }

  HANDLE handle = process_handle();
  if (handle) {
    // We assume this data doesn't change for the lifetime of the process.
    wchar_t full_image_name[MAX_PATH];
    DWORD full_image_name_length = std::size(full_image_name);
    if (QueryFullProcessImageName(handle, 0, full_image_name,
                                  &full_image_name_length)) {
      full_image_name_ = full_image_name;
    }

    enterprise_ids_ = GetProcessEnterpriseIds(handle);
  }
}

Process::~Process() = default;

void Process::Refresh() {
  refreshed_ = true;

  HANDLE handle = process_handle();
  if (handle) {
    integrity_level_ = GetProcessIntegrityLevel(handle);
  }

  if (!full_process_handle_.IsValid()) {
    return;
  }

  // Assume that the command line won't change once it has been set.
  if (command_line_.empty()) {
    std::wstring command_line =
        GetProcessCommandLine(full_process_handle_.Get());
    if (!command_line.empty()) {
      command_line_ = std::move(command_line);
      OnCommandLineUpdated();
    }
  }

  signature_policy_ = GetProcessSignaturePolicy(full_process_handle_.Get());
  dynamic_code_policy_ =
      GetProcessDynamicCodePolicy(full_process_handle_.Get());
}

void Process::UpdateCpuUsage(LONGLONG new_process_cpu_time,
                             LONGLONG new_system_cpu_time) {
  // On the first call, just set the initial values. We can't calculate the
  // actual usage until the second call.
  if (system_cpu_time_ == 0) {
    process_cpu_time_ = new_process_cpu_time;
    system_cpu_time_ = new_system_cpu_time;
    return;
  }

  // Only update if CPU time actually increased.
  if (new_process_cpu_time <= process_cpu_time_ ||
      new_system_cpu_time <= system_cpu_time_) {
    return;
  }

  double process_time_delta = new_process_cpu_time - process_cpu_time_;
  double system_time_delta = new_system_cpu_time - system_cpu_time_;
  cpu_usage_ = (process_time_delta / system_time_delta) * 100.0;

  process_cpu_time_ = new_process_cpu_time;
  system_cpu_time_ = new_system_cpu_time;
}

}  // namespace process_viewer
