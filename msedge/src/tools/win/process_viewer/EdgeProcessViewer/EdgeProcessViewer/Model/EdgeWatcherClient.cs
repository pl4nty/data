// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;

namespace EdgeProcessViewer {
  public class EdgeWatcherClient : IDisposable {
    public EdgeWatcherClient() {
      edgeWatcherClient_ = NativeMethods.CreateEdgeWatcherClient();
      if (edgeWatcherClient_ == null) {
        throw new ApplicationException("Failed to create EdgeWatcherClient.");
      }
    }

    ~EdgeWatcherClient() {
      Dispose(false);
    }

    public void Dispose() {
      Dispose(true);
      GC.SuppressFinalize(this);
    }

    protected virtual void Dispose(bool disposing) {
      if (edgeWatcherClient_ != IntPtr.Zero) {
        NativeMethods.DestroyEdgeWatcherClient(edgeWatcherClient_);
        edgeWatcherClient_ = IntPtr.Zero;
        IsConnected = false;
      }
    }

    public bool IsConnected { get; set; } = false;

    public bool Connect() {
      if (edgeWatcherClient_ == IntPtr.Zero) {
        throw new ObjectDisposedException(null);
      }
      if (!IsConnected) {
        IsConnected = NativeMethods.ConnectToEdgeWatcherServer(edgeWatcherClient_);
      }
      return IsConnected;
    }

    public List<ChildItem> GetItems(int processId) {
      if (edgeWatcherClient_ == IntPtr.Zero) {
        throw new ObjectDisposedException(null);
      }

      if (!NativeMethods.GetEdgeWatcherMonitoredTasks(edgeWatcherClient_, processId,
                                                      out IntPtr snapshotPtr)) {
        return null;
      }

      try {
        return ChildItem.GetChildItemsFromEdgeTaskSnapshot(snapshotPtr);
      } finally {
        NativeMethods.DestroyEdgeTaskSnapshot(snapshotPtr);
      }
    }

    private IntPtr edgeWatcherClient_;
  }
}
