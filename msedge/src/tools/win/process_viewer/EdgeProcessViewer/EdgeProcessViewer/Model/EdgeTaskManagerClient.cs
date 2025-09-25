// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Collections.Generic;

namespace EdgeProcessViewer {
  public class EdgeTaskManagerClient : IDisposable {
    public EdgeTaskManagerClient() {
      taskManagerClient_ = NativeMethods.CreateTaskManagerClient();
      if (taskManagerClient_ == null) {
        throw new ApplicationException("Failed to create EdgeTaskManagerClient.");
      }
    }

    ~EdgeTaskManagerClient() {
      Dispose(false);
    }

    public void Dispose() {
      Dispose(true);
      GC.SuppressFinalize(this);
    }

    protected virtual void Dispose(bool disposing) {
      if (taskManagerClient_ != IntPtr.Zero) {
        NativeMethods.DestroyTaskManagerClient(taskManagerClient_);
        taskManagerClient_ = IntPtr.Zero;
        IsConnected = false;
      }
    }

    public bool IsConnected { get; set; } = false;

    public bool Connect(int processId) {
      if (taskManagerClient_ == IntPtr.Zero) {
        throw new ObjectDisposedException(null);
      }
      if (!IsConnected) {
        IsConnected = NativeMethods.ConnectToTaskManagerServer(taskManagerClient_, processId,
                                                               ServerTimeout);
      }
      return IsConnected;
    }

    public List<ChildItem> GetItems() {
      if (taskManagerClient_ == IntPtr.Zero) {
        throw new ObjectDisposedException(null);
      }

      if (!NativeMethods.GetTaskManagerMonitoredTasks(taskManagerClient_, out IntPtr snapshotPtr)) {
        return null;
      }

      try {
        return ChildItem.GetChildItemsFromEdgeTaskSnapshot(snapshotPtr);
      } finally {
        NativeMethods.DestroyEdgeTaskSnapshot(snapshotPtr);
      }
    }

    private const int ServerTimeout = 5000;

    private IntPtr taskManagerClient_;
  }
}
