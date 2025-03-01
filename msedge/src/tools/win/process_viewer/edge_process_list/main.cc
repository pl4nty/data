// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <stdio.h>

#include <map>
#include <string>
#include <vector>

#include "base/at_exit.h"
#include "base/stl_util.h"
#include "base/strings/strcat.h"
#include "base/strings/string_util_win.h"
#include "base/threading/thread.h"
#include "mojo/core/embedder/embedder.h"
#include "mojo/core/embedder/scoped_ipc_support.h"
#include "mojo/public/c/system/core.h"
#include "tools/win/process_viewer/data_provider/ie_task_provider.h"
#include "tools/win/process_viewer/data_provider/process_data_provider.h"
#include "tools/win/process_viewer/data_provider/task_manager_client_sync.h"

namespace process_viewer {

namespace {

constexpr wchar_t kDualEngineIESwitch[] = L"-DualEngineAdapter";

bool IsDualEngineIEManager(const Process* process) {
  return process->type() == ProcessType::IEManager &&
         process->command_line().find(kDualEngineIESwitch) !=
             std::string::npos;
}

const wchar_t* GetProcessTypeString(ProcessType process_type) {
  switch (process_type) {
    case ProcessType::Unknown:
      return L"Unknown";
    case ProcessType::Browser:
      return L"Browser";
    case ProcessType::Renderer:
      return L"Renderer";
    case ProcessType::Gpu:
      return L"GPU";
    case ProcessType::Utility:
      return L"Utility";
    case ProcessType::Plugin:
      return L"Plugin";
    case ProcessType::PluginBroker:
      return L"Plugin Broker";
    case ProcessType::Extension:
      return L"Extension";
    case ProcessType::CrashpadHandler:
      return L"Crashpad Handler";
    case ProcessType::Watcher:
      return L"Watcher";
    case ProcessType::IEManager:
      return L"IE Manager";
    case ProcessType::IEContent:
      return L"Content";
  }
}

const wchar_t* GetIntegrityLevelString(IntegrityLevel integrity_level) {
  switch (integrity_level) {
    case IntegrityLevel::Unknown:
      return L"Unknown";
    case IntegrityLevel::System:
      return L"System";
    case IntegrityLevel::High:
      return L"High";
    case IntegrityLevel::Medium:
      return L"Medium";
    case IntegrityLevel::Low:
      return L"Low";
    case IntegrityLevel::Untrusted:
      return L"Untrusted";
    case IntegrityLevel::AppContainer:
      return L"AppContainer";
  }
}

const wchar_t* GetDecimalSeparator() {
  static bool is_set = false;
  static wchar_t separator[4];
  if (!is_set) {
    HRESULT hr = GetLocaleInfoEx(LOCALE_NAME_USER_DEFAULT, LOCALE_SDECIMAL,
                                 separator, std::size(separator));
    if (FAILED(hr)) {
      separator[0] = L'.';
      separator[1] = L'\0';
    }
    is_set = true;
  }
  return separator;
}

// Converts from a LONGLONG to a string in display format for the current locale
// (for example: "11,853 K").
std::wstring GetMemoryUsageString(LONGLONG memory_usage) {
  LONGLONG usage_in_kb = memory_usage / 1024;
  wchar_t buffer[64];
  if (swprintf(buffer, std::size(buffer), L"%zu", usage_in_kb) <= 0) {
    return {};
  }
  wchar_t formatted_buffer[64];
  if (GetNumberFormatEx(LOCALE_NAME_USER_DEFAULT, 0, buffer, nullptr,
                        formatted_buffer, std::size(formatted_buffer)) == 0) {
    return {};
  }

  // Formatting may add decimals, which we don't want to include.
  wchar_t* separator = wcsstr(formatted_buffer, GetDecimalSeparator());
  if (separator) {
    *separator = L'\0';
  }
  return base::StrCat({formatted_buffer, L" K"});
}

void PrintProcess(const Process* process) {
  wchar_t pid_string[16];
  swprintf(pid_string, std::size(pid_string), L"%u (0x%x)",
           process->process_id(), process->process_id());
  wprintf(L"%-16s   PID: %-15s   IL: %-12s   CPU: %02d   Memory: %9s\n",
          GetProcessTypeString(process->type()), pid_string,
          GetIntegrityLevelString(process->integrity_level()),
          process->cpu_usage(),
          GetMemoryUsageString(process->memory_usage()).c_str());
}

void PrintTasksForProcess(ULONG process_id, const std::vector<Task>& tasks) {
  for (const auto& task : tasks) {
    if (task.process_id == process_id) {
      wprintf(L"  %s\n", task.title.c_str());
    }
  }
}

void PrintIETasksForProcess(ULONG process_id,
                            const std::vector<IETask>& tasks) {
  for (const auto& task : tasks) {
    if (task.process_id == process_id) {
      wprintf(L"  Tab: %s\n", task.title.c_str());
    }
  }
}

std::vector<Task> GetEdgeTasks(ULONG browser_process_id) {
  TaskManagerClientSync task_manager_client;
  if (!task_manager_client.Initialize()) {
    wprintf(L"Failed to initialize task manager.\n");
    return {};
  }

  constexpr base::TimeDelta timeout = base::Seconds(10);
  if (!task_manager_client.ConnectToServer(browser_process_id, timeout)) {
    wprintf(L"Failed to connect to Browser process %u.\n", browser_process_id);
    return {};
  }

  std::vector<Task> tasks;
  if (!task_manager_client.GetSnapshot(timeout, &tasks)) {
    wprintf(L"Failed to get tasks from Browser process %u.\n",
            browser_process_id);
    return {};
  }

  return tasks;
}

std::vector<IETask> GetIETasks() {
  IETaskProvider ie_task_provider;
  std::vector<IETask> tasks;
  if (!ie_task_provider.GetTasks(&tasks)) {
    wprintf(L"Failed to get IE tasks.\n");
    return {};
  }
  return tasks;
}

}  // namespace

}  // namespace process_viewer

const bool use_ipcz = true;

int main(int argc, char* argv[]) {
  base::AtExitManager exit_manager;
  std::unique_ptr<base::Thread> ipc_thread;
  std::unique_ptr<mojo::core::ScopedIPCSupport> ipc_support;

  if (use_ipcz) {
    mojo::core::EnableMojoIpcz();
    mojo::core::Init({.is_broker_process = true});

    ipc_thread = std::make_unique<base::Thread>("ipc!");
    ipc_thread->StartWithOptions(
        base::Thread::Options(base::MessagePumpType::IO, 0));

    // As long as this object is alive, all Mojo API surface relevant to IPC
    // connections is usable, and message pipes which span a process boundary
    // will continue to function.
    ipc_support = std::make_unique<mojo::core::ScopedIPCSupport>(
        ipc_thread->task_runner(),
        mojo::core::ScopedIPCSupport::ShutdownPolicy::CLEAN);
  } else {
    MojoResult result = MojoInitialize(nullptr);
    if (result != MOJO_RESULT_OK) {
      printf("Failed to initialize mojo.\n");
      return 1;
    }
  }

  // Get data on the currently running processes.
  process_viewer::ProcessDataProvider process_data_provider;
  process_data_provider.Refresh();

  // In order to get CPU usage information, we need to refresh a second time so
  // that the difference in CPU time can be calculated.
  Sleep(500);
  process_data_provider.Refresh();
  const auto& processes = process_data_provider.GetProcesses();

  // For each browser process, connect to the process and obtain its task data.
  bool found_ie = false;
  std::map<ULONG, std::vector<process_viewer::Task>> browser_tasks;
  std::vector<process_viewer::IETask> ie_tasks;
  for (const auto& process : processes) {
    if (process->type() == process_viewer::ProcessType::Browser) {
      browser_tasks[process->process_id()] =
          process_viewer::GetEdgeTasks(process->process_id());
    } else if (process->type() == process_viewer::ProcessType::IEManager) {
      if (!found_ie && process_viewer::IsDualEngineIEManager(process.get())) {
        found_ie = true;
        ie_tasks = process_viewer::GetIETasks();
      }
    }
  }

  // For each Edge browser process, print that process along with its
  // corresponding child processes and their tasks.
  for (const auto& process : processes) {
    if (process->type() == process_viewer::ProcessType::Browser ||
        process->type() == process_viewer::ProcessType::Unknown) {
      process_viewer::PrintProcess(process.get());
      const auto& tasks = browser_tasks[process->process_id()];

      for (const auto& child_process : processes) {
        if (child_process->parent_process_id() == process->process_id()) {
          process_viewer::PrintProcess(child_process.get());
          if (child_process->type() == process_viewer::ProcessType::Gpu) {
            // GPU task for GPU process is redundant, so don't print it.
            continue;
          }
          process_viewer::PrintTasksForProcess(child_process->process_id(),
                                               tasks);
        }
      }
      printf("\n");
    }
  }

  // Now do the same for each dual-engine IE manager process.
  for (const auto& process : processes) {
    if (process->type() == process_viewer::ProcessType::IEManager &&
        process_viewer::IsDualEngineIEManager(process.get())) {
      process_viewer::PrintProcess(process.get());
      for (const auto& child_process : processes) {
        if (child_process->parent_process_id() == process->process_id()) {
          process_viewer::PrintProcess(child_process.get());
          process_viewer::PrintIETasksForProcess(child_process->process_id(),
                                                 ie_tasks);
        }
      }
      printf("\n");
    }
  }

  if (!use_ipcz) {
    MojoShutdown(nullptr);
  }

  return 0;
}
