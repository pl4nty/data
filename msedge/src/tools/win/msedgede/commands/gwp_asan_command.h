// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_MSEDGEDE_COMMANDS_GWP_ASAN_COMMAND_H_
#define TOOLS_WIN_MSEDGEDE_COMMANDS_GWP_ASAN_COMMAND_H_

#include <streambuf>

#include "components/gwp_asan/crash_handler/crash.pb.h"
#include "third_party/crashpad/crashpad/util/file/file_reader.h"
#include "tools/win/msedgede/msedgede_command.h"

namespace tools {
namespace win {
namespace msedgede {

struct membuf : std::streambuf {
  membuf(char* begin, char* end) { this->setg(begin, begin, end); }

  membuf() {}
};

class GwpAsanCommand : public MsedgedeCommand {
 public:
  GwpAsanCommand();
  ~GwpAsanCommand() override;

 protected:
  HRESULT Execute() override;
  HRESULT InitPlatformID();
  HRESULT ReadFromDumpStream(uint32_t stream_type,
                             std::vector<char>* buffer,
                             uint64_t offset);
  HRESULT GetBaseAddress(ULONG64* base_address);
  HRESULT UseWinDbgSymbolize(uint64_t* stack_address, int stack_trace_size);
  HRESULT SymbolizeStackTrace(gwp_asan::Crash_AllocationInfo& allocation,
                              ULONG64* base_address);
  HRESULT ReadSymbols(std::string hexstring, std::string* json_string);
  void PrintErrorType(const int& error_type);

 private:
  ComPtr<IDebugSymbols3> debug_symbols_;
  ULONG platform_id_;
};

}  // namespace msedgede
}  // namespace win
}  // namespace tools

#endif  // TOOLS_WIN_MSEDGEDE_COMMANDS_GWP_ASAN_COMMAND_H_
