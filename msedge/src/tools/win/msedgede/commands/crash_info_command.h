// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_MSEDGEDE_COMMANDS_CRASH_INFO_COMMAND_H_
#define TOOLS_WIN_MSEDGEDE_COMMANDS_CRASH_INFO_COMMAND_H_

#include "third_party/crashpad/crashpad/util/file/file_reader.h"
#include "tools/win/msedgede/msedgede_command.h"

namespace tools {
namespace win {
namespace msedgede {

class CrashInfoCommand : public MsedgedeCommand {
 public:
  CrashInfoCommand();
  ~CrashInfoCommand() override;

  CrashInfoCommand(const CrashInfoCommand&) = delete;
  CrashInfoCommand& operator=(const CrashInfoCommand&) = delete;

 protected:
  HRESULT Execute() override;

  void DisplayAnnotations();
  void DisplayMiscInfo();

  std::unique_ptr<crashpad::FileReaderInterface> OpenDumpFileReader();
  HRESULT ReadFromDumpStream(uint32_t stream_type,
                             uint64_t offset,
                             size_t max_read,
                             void* bytes,
                             size_t* bytes_read);
 private:
  ComPtr<IDebugAdvanced3> debug_advanced_;
};

}  // namespace msedgede
}  // namespace win
}  // namespace tools

#endif  // TOOLS_WIN_MSEDGEDE_COMMANDS_CRASH_INFO_COMMAND_H_
