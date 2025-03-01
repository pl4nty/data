// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System.ComponentModel;

namespace EdgeProcessViewer {
  public class RequestLaunchEdgeEventArgs : CancelEventArgs {
    public RequestLaunchEdgeEventArgs(string edgePath, string edgeArgs) {
      EdgePath = edgePath;
      EdgeArguments = edgeArgs;
    }

    public string EdgePath { get; set; }
    public string EdgeArguments { get; set; }
  }
}