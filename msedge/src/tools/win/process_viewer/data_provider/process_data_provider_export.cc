// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <windows.h>

#include "tools/win/process_viewer/data_provider/process.h"
#include "tools/win/process_viewer/data_provider/process_data_provider.h"

namespace {

using process_viewer::DynamicCodePolicy;
using process_viewer::IntegrityLevel;
using process_viewer::ProcessDataProvider;
using process_viewer::ProcessType;
using process_viewer::SessionType;
using process_viewer::SignaturePolicy;

struct ProcessData {
  ULONG process_id;
  LONGLONG create_time;
  ULONG parent_process_id;
  WCHAR* full_image_name;
  WCHAR* command_line;
  ProcessType type;
  IntegrityLevel integrity_level;
  SignaturePolicy signature_policy;
  DynamicCodePolicy dynamic_code_policy;
  int enterprise_id_count;
  WCHAR** enterprise_ids;
  int cpu_usage;
  LONGLONG memory_usage;
  SessionType session_type;
};

struct ProcessDataSnapshot {
  int process_count;
  ProcessData* processes;
};

extern "C" {

__declspec(dllexport) ProcessDataProvider* CreateProcessDataProvider() {
  return new ProcessDataProvider;
}

__declspec(dllexport) void DestroyProcessDataProvider(
    ProcessDataProvider* data_provider) {
  delete data_provider;
}

__declspec(dllexport) bool RefreshProcessData(
    ProcessDataProvider* data_provider) {
  if (!data_provider) {
    return false;
  }
  data_provider->Refresh();
  return true;
}

__declspec(dllexport) bool GetProcessSnapshot(
    ProcessDataProvider* data_provider,
    ProcessDataSnapshot** snapshot) {
  if (!data_provider || !snapshot) {
    return false;
  }
  const auto& processes = data_provider->GetProcesses();

  *snapshot = new ProcessDataSnapshot;
  (*snapshot)->process_count = processes.size();
  (*snapshot)->processes = new ProcessData[processes.size()];
  for (size_t i = 0; i < processes.size(); i++) {
    (*snapshot)->processes[i].process_id = processes[i]->process_id();
    (*snapshot)->processes[i].create_time = processes[i]->create_time();
    (*snapshot)->processes[i].parent_process_id =
        processes[i]->parent_process_id();
    (*snapshot)->processes[i].type = processes[i]->type();
    (*snapshot)->processes[i].integrity_level = processes[i]->integrity_level();
    (*snapshot)->processes[i].signature_policy =
        processes[i]->signature_policy();
    (*snapshot)->processes[i].dynamic_code_policy =
        processes[i]->dynamic_code_policy();
    (*snapshot)->processes[i].cpu_usage = processes[i]->cpu_usage();
    (*snapshot)->processes[i].memory_usage = processes[i]->memory_usage();
    (*snapshot)->processes[i].create_time = processes[i]->create_time();
    (*snapshot)->processes[i].session_type = processes[i]->session_type();

    int enterprise_id_count = processes[i]->enterprise_ids().size();
    (*snapshot)->processes[i].enterprise_id_count = enterprise_id_count;
    if (enterprise_id_count > 0) {
      WCHAR** enterprise_ids = new WCHAR*[enterprise_id_count];
      for (int j = 0; j < enterprise_id_count; j++) {
        enterprise_ids[j] =
            new WCHAR[processes[i]->enterprise_ids()[j].length() + 1];
        wcscpy(enterprise_ids[j], processes[i]->enterprise_ids()[j].c_str());
      }
      (*snapshot)->processes[i].enterprise_ids = enterprise_ids;
    } else {
      (*snapshot)->processes[i].enterprise_ids = nullptr;
    }

    (*snapshot)->processes[i].full_image_name =
        new WCHAR[processes[i]->full_image_name().length() + 1];
    wcscpy((*snapshot)->processes[i].full_image_name,
           processes[i]->full_image_name().c_str());

    (*snapshot)->processes[i].command_line =
        new WCHAR[processes[i]->command_line().length() + 1];
    wcscpy((*snapshot)->processes[i].command_line,
           processes[i]->command_line().c_str());
  }
  return true;
}

__declspec(dllexport) bool DestroyProcessSnapshot(
    ProcessDataSnapshot* snapshot) {
  if (!snapshot) {
    return false;
  }
  for (int i = 0; i < snapshot->process_count; i++) {
    for (int j = 0; j < snapshot->processes[i].enterprise_id_count; j++) {
      delete[] snapshot->processes[i].enterprise_ids[j];
    }
    delete[] snapshot->processes[i].enterprise_ids;
    delete[] snapshot->processes[i].full_image_name;
    delete[] snapshot->processes[i].command_line;
  }
  delete[] snapshot->processes;
  delete snapshot;
  return true;
}

}  // extern "C"

}  // namespace
