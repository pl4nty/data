// Copyright 2017 The Chromium Authors. All rights reserved.
// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <dbgeng.h>
#include <wrl/client.h>

#include "tools/win/msedgede/commands/crash_info_command.h"
#include "tools/win/msedgede/commands/gwp_asan_command.h"
#include "tools/win/msedgede/commands/hwnd_command.h"
#include "tools/win/msedgede/msedgede_command.h"

namespace {
using Microsoft::WRL::ComPtr;
}  // namespace

HRESULT CALLBACK DebugExtensionInitialize(ULONG* version, ULONG* flags) {
  *version = DEBUG_EXTENSION_VERSION(0, 1);
  *flags = 0;
  return S_OK;
}

void CALLBACK DebugExtensionUninitialize() {}

HRESULT CALLBACK help(IDebugClient* client, PCSTR args) {
  ComPtr<IDebugControl> debug_control;
  HRESULT hr = client->QueryInterface(IID_PPV_ARGS(&debug_control));
  if (FAILED(hr)) {
    return hr;
  }

  debug_control->Output(DEBUG_OUTPUT_NORMAL, "MS Edge Debugger Extension\n");
  debug_control->Output(DEBUG_OUTPUT_NORMAL,
                        "hwnd - Displays basic hwnd info.\n");
  debug_control->Output(DEBUG_OUTPUT_NORMAL,
                        "crashinfo - Displays info from a crashpad dump.\n");
  debug_control->Output(
      DEBUG_OUTPUT_NORMAL,
      "gwpasan - Displays info from a GWP-ASan dump.\n Usage: gwpasan "
      "\"[<msedge binary path>;<llvm-symbolizer path>]\"");
  return S_OK;
}

HRESULT CALLBACK RunCrashInfoCommand(IDebugClient* client, PCSTR args) {
  return tools::win::msedgede::MsedgedeCommand::Run<
      tools::win::msedgede::CrashInfoCommand>(client, args);
}

HRESULT CALLBACK RunHwndCommand(IDebugClient* client, PCSTR args) {
  return tools::win::msedgede::MsedgedeCommand::Run<
      tools::win::msedgede::HwndCommand>(client, args);
}

HRESULT CALLBACK RunGwpAsanCommand(IDebugClient* client, PCSTR args) {
  return tools::win::msedgede::MsedgedeCommand::Run<
      tools::win::msedgede::GwpAsanCommand>(client, args);
}
