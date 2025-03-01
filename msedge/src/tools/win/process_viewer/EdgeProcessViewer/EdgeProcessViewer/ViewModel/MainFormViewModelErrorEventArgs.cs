// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

namespace EdgeProcessViewer {
  class MainFormViewModelErrorEventArgs {
    public MainFormViewModelErrorEventArgs(string errorMessage) {
      ErrorMessage = errorMessage;
    }

    public string ErrorMessage { get; private set; }
  }
}
