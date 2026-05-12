// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/edge_data_provider/ipc_thread.h"

#include "mojo/core/embedder/embedder.h"
#include "testing/gtest/include/gtest/gtest.h"

namespace process_viewer {
namespace {

class IpcThreadTest : public testing::Test {
 public:
  static void SetUpTestSuite() {
    mojo::core::EnableMojoIpcz();
    mojo::core::Init({.is_broker_process = true});
  }
};

// Verify that an IpcThread can be constructed and destroyed without errors.
// This also validates the DataProviderWrapper usage in main_export.cc, which
// manages IpcThread via std::optional (emplace/reset are guaranteed by the
// C++ standard to construct/destroy the contained object).
TEST_F(IpcThreadTest, ConstructAndDestruct) {
  IpcThread ipc_thread;
}

}  // namespace
}  // namespace process_viewer
