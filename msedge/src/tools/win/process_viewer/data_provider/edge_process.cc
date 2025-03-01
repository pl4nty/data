// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/data_provider/edge_process.h"

#include "base/command_line.h"
#include "base/files/file_path.h"
#include "base/strings/utf_string_conversions.h"
#include "tools/win/process_viewer/data_provider/edge_process_constants.h"

namespace process_viewer {

namespace {

SessionType GetSessionTypeFromExePath(const std::wstring& exe_path) {
  if (exe_path.find(L"Beta") != std::string::npos) {
    return SessionType::BetaChannel;
  } else if (exe_path.find(L"Dev") != std::string::npos) {
    return SessionType::DeveloperChannel;
  } else if ((exe_path.find(L"SxS") != std::string::npos) ||
             (exe_path.find(L"Canary") != std::string::npos)) {
    return SessionType::CanaryChannel;
  } else if ((exe_path.find(L"Internal") != std::string::npos) ||
             (exe_path.find(L"out") != std::string::npos)) {
    return SessionType::LocalBuild;
  } else if (exe_path.find(L"Edge") != std::string::npos) {
    return SessionType::StableChannel;
  } else {
    return SessionType::Unknown;
  }
}

}  // namespace

EdgeProcess::EdgeProcess(ULONG process_id,
                         LONGLONG create_time,
                         ULONG parent_process_id)
    : Process(process_id, create_time, parent_process_id) {}

EdgeProcess::~EdgeProcess() = default;

void EdgeProcess::OnCommandLineUpdated() {
  base::CommandLine parsed_command_line =
      base::CommandLine::FromString(command_line());

  // Determine the process type from the command line.
  ProcessType process_type = ProcessType::Unknown;
  if (!parsed_command_line.HasSwitch(kProcessTypeSwitch)) {
    process_type = ProcessType::Browser;
  } else {
    std::string process_type_string =
        parsed_command_line.GetSwitchValueASCII(kProcessTypeSwitch);
    if (process_type_string == kRendererProcess) {
      if (parsed_command_line.HasSwitch(kExtensionProcessSwitch)) {
        process_type = ProcessType::Extension;
      } else {
        process_type = ProcessType::Renderer;
      }
    } else if (process_type_string == kGpuProcess) {
      process_type = ProcessType::Gpu;
    } else if (process_type_string == kUtilityProcess) {
      process_type = ProcessType::Utility;
    } else if (process_type_string == kPpapiPluginProcess) {
      process_type = ProcessType::Plugin;
    } else if (process_type_string == kPpapiBrokerProcess) {
      process_type = ProcessType::PluginBroker;
    } else if (process_type_string == kCrashpadHandlerProcess) {
      process_type = ProcessType::CrashpadHandler;
    } else if (process_type_string == kWatcherProcess) {
      process_type = ProcessType::Watcher;
    }
  }

  set_process_type(process_type);

  set_session_type(
      GetSessionTypeFromExePath(parsed_command_line.GetProgram().value()));
}

}  // namespace process_viewer
