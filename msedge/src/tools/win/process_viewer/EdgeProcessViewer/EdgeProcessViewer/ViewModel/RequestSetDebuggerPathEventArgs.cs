// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System.ComponentModel;

namespace EdgeProcessViewer {
  public class RequestSetDebuggerPathEventArgs : CancelEventArgs {
    public RequestSetDebuggerPathEventArgs(string debuggerPath, string onLaunchDebuggerPath, string onLaunchDebuggerArguments) {
      DebuggerPath = debuggerPath;
      OnLaunchDebuggerPath = onLaunchDebuggerPath;
      OnLaunchDebuggerArguments = onLaunchDebuggerArguments;
    }

    public string DebuggerPath { get; set; }
    public string OnLaunchDebuggerPath { get; set; }
    public string OnLaunchDebuggerArguments { get; set; }
  }
}
