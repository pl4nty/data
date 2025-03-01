// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_MSEDGEDE_COMMANDS_HWND_COMMAND_H_
#define TOOLS_WIN_MSEDGEDE_COMMANDS_HWND_COMMAND_H_

#include "tools/win/msedgede/msedgede_command.h"

namespace tools {
namespace win {
namespace msedgede {

class HwndCommand : public MsedgedeCommand {
 public:
  HwndCommand();
  ~HwndCommand() override;
  HwndCommand(const HwndCommand&) = delete;
  HwndCommand& operator=(const HwndCommand&) = delete;
 protected:
  HRESULT Execute() override;
};

}  // namespace msedgede
}  // namespace win
}  // namespace tools

#endif  // TOOLS_WIN_MSEDGEDE_COMMANDS_HWND_COMMAND_H_
