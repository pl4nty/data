// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System.ComponentModel;

namespace EdgeProcessViewer {
  public class RequestEndProcessEventArgs : CancelEventArgs {
    public RequestEndProcessEventArgs(string processType, string processId) {
      ProcessType = processType;
      ProcessId = processId;
    }

    public string ProcessType { get; private set; }

    public string ProcessId { get; private set; }
  }
}
