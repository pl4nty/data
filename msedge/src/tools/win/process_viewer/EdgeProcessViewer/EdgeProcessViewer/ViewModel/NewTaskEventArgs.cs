// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;

namespace EdgeProcessViewer {
  public class NewTaskEventArgs : EventArgs {
    public NewTaskEventArgs(Task task) {
      Task = task;
    }

    public Task Task { get; set; }
  }
}