// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/data_provider/ie_process.h"

#include "base/command_line.h"

namespace process_viewer {

namespace {
constexpr wchar_t kScodefArg[] = L"SCODEF:";
}

IEProcess::IEProcess(ULONG process_id,
                     LONGLONG create_time,
                     ULONG parent_process_id)
    : Process(process_id, create_time, parent_process_id) {
  set_session_type(SessionType::IEProcess);
}

IEProcess::~IEProcess() = default;

void IEProcess::OnCommandLineUpdated() {
  // Determine the process type from the command line.
  ProcessType process_type = ProcessType::Unknown;
  size_t scodef_start_pos = command_line().find(kScodefArg);
  process_type = (scodef_start_pos == std::string::npos)
                     ? ProcessType::IEManager
                     : ProcessType::IEContent;
  set_process_type(process_type);
}

}  // namespace process_viewer
