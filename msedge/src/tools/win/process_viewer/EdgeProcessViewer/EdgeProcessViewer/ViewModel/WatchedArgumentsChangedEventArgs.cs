// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Collections.Generic;
using EdgeProcessViewer.Controls;

namespace EdgeProcessViewer {
  public class WatchedArgumentsChangedEventArgs : EventArgs {
    public WatchedArgumentsChangedEventArgs(List<CommandLineArg> arguments) {
      WatchedArguments = arguments;
    }

    public List<CommandLineArg> WatchedArguments { get; set; }
  }
}