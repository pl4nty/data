// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/msedgede/msedgede_command.h"

#include "base/check.h"
#include "base/logging.h"

namespace tools {
namespace win {
namespace msedgede {

MsedgedeCommand::~MsedgedeCommand() = default;

MsedgedeCommand::MsedgedeCommand() = default;

HRESULT MsedgedeCommand::Initialize(IDebugClient* debug_client,
                                    const char* args) {
  DCHECK(debug_client);
  DCHECK(args);
  args_ = args;

  // Query for IDebugClient5 so the commands can use APIs added after
  // IDebugClient.
  HRESULT hr = debug_client->QueryInterface(IID_PPV_ARGS(&debug_client_));
  if (FAILED(hr)) {
    return hr;
  }
  hr = debug_client_->QueryInterface(IID_PPV_ARGS(&debug_control_));
  if (FAILED(hr)) {
    return hr;
  }
  return S_OK;
}

HRESULT MsedgedeCommand::Printf(const char* format, ...) {
  va_list ap;
  va_start(ap, format);
  HRESULT hr = PrintV(format, ap);
  va_end(ap);
  return hr;
}

HRESULT MsedgedeCommand::PrintfWithIndent(int indent_level,
                                          const char* format,
                                          ...) {
  for (int i = 0; i < indent_level; i++) {
    Printf("  ");
  }

  va_list ap;
  va_start(ap, format);
  HRESULT hr = PrintV(format, ap);
  va_end(ap);
  return hr;
}

HRESULT MsedgedeCommand::PrintV(const char* format, va_list ap) {
  return debug_control_->OutputVaList(DEBUG_OUTPUT_NORMAL, format, ap);
}

HRESULT MsedgedeCommand::PrintErrorf(const char* format, ...) {
  va_list ap;
  va_start(ap, format);
  HRESULT hr = PrintErrorV(format, ap);
  va_end(ap);
  return hr;
}

HRESULT MsedgedeCommand::PrintErrorV(const char* format, va_list ap) {
  return debug_control_->OutputVaList(DEBUG_OUTPUT_ERROR, format, ap);
}

}  // namespace msedgede
}  // namespace win
}  // namespace tools
