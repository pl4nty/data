// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_MSEDGEDE_MSEDGEDE_COMMAND_H_
#define TOOLS_WIN_MSEDGEDE_MSEDGEDE_COMMAND_H_

#include <dbgeng.h>
#include <stdarg.h>
#include <wrl/client.h>

#include <memory>
#include <string>

#include "base/memory/ptr_util.h"

namespace tools {
namespace win {
namespace msedgede {

namespace {
using Microsoft::WRL::ComPtr;
}  // namespace

// Superclass of all commands in the debugger extension.
// To implement your own command, just follow these steps:
// 1) Create a new class and subclass MsedgedeCommand.
// 2) Implement Execute().
// 3) Add a function that calls Run<Your Subclass>() to msedgede.cc.
// 4) Add your new function to the exports list in msedgede.def.
// Done!
class MsedgedeCommand {
 public:
  template <typename T>
  static HRESULT Run(IDebugClient* debug_client, const char* args) {
    std::unique_ptr<MsedgedeCommand> command = std::make_unique<T>();
    HRESULT hr = command->Initialize(debug_client, args);
    if (SUCCEEDED(hr)) {
      hr = command->Execute();
    }
    return hr;
  }

  virtual ~MsedgedeCommand();
  MsedgedeCommand(const MsedgedeCommand&) = delete;
  MsedgedeCommand& operator=(const MsedgedeCommand&) = delete;

 protected:
  MsedgedeCommand();

  virtual HRESULT Initialize(IDebugClient* debug_client, const char* args);

  virtual HRESULT Execute() = 0;

  HRESULT Printf(const char* format, ...);
  HRESULT PrintfWithIndent(int indent_level, const char* format, ...);
  HRESULT PrintV(const char* format, va_list ap);

  HRESULT PrintErrorf(const char* format, ...);
  HRESULT PrintErrorV(const char* format, va_list ap);

  const std::string& args() const { return args_; }
  IDebugClient5* debug_client() { return debug_client_.Get(); }
  IDebugControl4* debug_control() { return debug_control_.Get(); }

 private:
  std::string args_;
  ComPtr<IDebugClient5> debug_client_;
  ComPtr<IDebugControl4> debug_control_;
};

}  // namespace msedgede
}  // namespace win
}  // namespace tools

#endif  // TOOLS_WIN_MSEDGEDE_MSEDGEDE_COMMAND_H_
