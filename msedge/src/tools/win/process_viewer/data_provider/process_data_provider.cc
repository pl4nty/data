// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/data_provider/process_data_provider.h"

#include <windows.h>
#include <algorithm>

#include "tools/win/process_viewer/data_provider/edge_process.h"
#include "tools/win/process_viewer/data_provider/edge_webview_process.h"
#include "tools/win/process_viewer/data_provider/ie_process.h"
#include "tools/win/process_viewer/data_provider/ntdefs.h"

namespace process_viewer {

namespace {
constexpr wchar_t kEdgeProcessName[] = L"msedge.exe";
constexpr wchar_t kIEProcessName[] = L"iexplore.exe";
constexpr wchar_t kWebViewName[] = L"msedgewebview2.exe";

constexpr size_t kBufferInitialSize = sizeof(SYSTEM_PROCESS_INFORMATION) * 100;
constexpr size_t kBufferGrowthSize = 8192;

std::vector<uint8_t> GetSystemProcessInfo(size_t buffer_size_hint) {
  static const auto nt_query_system_information_ptr =
      reinterpret_cast<decltype(&NtQuerySystemInformation)>(GetProcAddress(
          GetModuleHandle(L"ntdll.dll"), "NtQuerySystemInformation"));
  if (!nt_query_system_information_ptr) {
    return {};
  }

  size_t initial_size = std::max(kBufferInitialSize, buffer_size_hint);
  std::vector<uint8_t> buffer(initial_size);

  // If our buffer isn't large enough, make it larger and try again. We may need
  // to make multiple attempts if many new processes are created between calls
  // to NtQuerySystemInformation.
  NTSTATUS status;
  for (int i = 0; i < 3; i++) {
    ULONG actual_size;
    status = nt_query_system_information_ptr(
        SystemProcessInformation, buffer.data(), buffer.size(), &actual_size);
    if (status == STATUS_INFO_LENGTH_MISMATCH) {
      buffer.resize(actual_size + kBufferGrowthSize);
    } else {
      break;
    }
  }

  if (!NT_SUCCESS(status)) {
    return {};
  }

  return buffer;
}

LONGLONG FileTimeToLongLong(FILETIME file_time) {
  ULARGE_INTEGER time;
  time.HighPart = file_time.dwHighDateTime;
  time.LowPart = file_time.dwLowDateTime;
  return static_cast<LONGLONG>(time.QuadPart);
}

LONGLONG GetSystemCpuTime() {
  FILETIME idle_filetime;
  FILETIME kernel_filetime;
  FILETIME user_filetime;
  if (!GetSystemTimes(&idle_filetime, &kernel_filetime, &user_filetime)) {
    return 0;
  }

  return FileTimeToLongLong(kernel_filetime) +
         FileTimeToLongLong(user_filetime);
}

}  // namespace

ProcessDataProvider::ProcessDataProvider() = default;

ProcessDataProvider::~ProcessDataProvider() = default;

void ProcessDataProvider::Refresh() {
  std::vector<uint8_t> buffer = GetSystemProcessInfo(last_buffer_size_);
  if (buffer.empty()) {
    return;
  }
  last_buffer_size_ = buffer.size();
  LONGLONG system_cpu_time = GetSystemCpuTime();
  ptrdiff_t offset = 0;

  while (true) {
    SYSTEM_PROCESS_INFORMATION* system_process_info =
        reinterpret_cast<SYSTEM_PROCESS_INFORMATION*>(buffer.data() + offset);

    size_t image_name_length = system_process_info->ImageName.Length /
                               sizeof(system_process_info->ImageName.Buffer[0]);
    std::wstring image_name(system_process_info->ImageName.Buffer,
                              image_name_length);

    ProcessViewType process_type;
    if (image_name == kEdgeProcessName) {
      process_type = ProcessViewType::Edge;
    } else if (image_name == kIEProcessName) {
      process_type = ProcessViewType::IE;
    } else if (image_name == kWebViewName) {
      process_type = ProcessViewType::Webview;
    } else {
      process_type = ProcessViewType::Unknown;
    }

    if (process_type != ProcessViewType::Unknown) {
      ULONG process_id = HandleToULong(system_process_info->ProcessId);
      LONGLONG create_time = system_process_info->CreateTime;

      // Check whether we already know about this process.
      auto iter = std::find_if(processes_.begin(), processes_.end(),
                               [=](const std::unique_ptr<Process>& process) {
                                 return process_id == process->process_id() &&
                                        create_time == process->create_time();
                               });

      Process* process;
      if (iter == processes_.end()) {
        // New process since last refresh, need to add it to our list.
        ULONG parent_process_id =
            HandleToULong(system_process_info->ParentProcessId);

        switch (process_type) {
          case ProcessViewType::Edge:
            processes_.push_back(std::make_unique<EdgeProcess>(
                process_id, create_time, parent_process_id));
            break;
          case ProcessViewType::IE:
            processes_.push_back(std::make_unique<IEProcess>(
                process_id, create_time, parent_process_id));
            break;
          case ProcessViewType::Webview:
            processes_.push_back(std::make_unique<WebViewProcess>(
                process_id, create_time, parent_process_id));
            break;
          default:
            break;
        }
        process = processes_.back().get();
      } else {
        // Known process, just need to update it.
        process = iter->get();
      }

      LONGLONG new_process_cpu_time = system_process_info->UserTime +
                                      system_process_info->KernelTime;
      process->UpdateCpuUsage(new_process_cpu_time, system_cpu_time);
      process->UpdateMemoryUsage(
          system_process_info->WorkingSetPrivateSize);
      process->Refresh();
    }

    if (system_process_info->NextEntryOffset == 0) {
      break;
    }
    offset += system_process_info->NextEntryOffset;
  }

  // If we have a process in our list but we didn't refresh it above, then the
  // process no longer exists and we need to remove it from our list.
  auto remove_iter =
      std::remove_if(processes_.begin(), processes_.end(),
                     [](const std::unique_ptr<Process>& process) {
                       return !process->HasRefreshed();
                     });
  processes_.erase(remove_iter, processes_.end());

  // Keep our list sorted by process type
  // After process type, we sort by PID to keep from having processes trade
  // places in the list
  std::sort(processes_.begin(), processes_.end(),
            [](const std::unique_ptr<Process>& first,
               const std::unique_ptr<Process>& second) {
              if (first->type() == second->type()) {
                return first->process_id() < second->process_id();
              }
              return first->type() < second->type();
            });

  for (const auto& process : processes_) {
    process->ResetRefreshed();
  }
}

const std::vector<std::unique_ptr<Process>>& ProcessDataProvider::GetProcesses()
    const {
  return processes_;
}

}  // namespace process_viewer
