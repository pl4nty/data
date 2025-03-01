// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Collections.Generic;

namespace EdgeProcessViewer {
  public class IEChildItemProvider : IDisposable {
    public IEChildItemProvider() {
      ieTaskProvider_ = NativeMethods.CreateIETaskProvider();
      if (ieTaskProvider_ == null) {
        throw new ApplicationException("Failed to create IEChildItemProvider.");
      }
    }

    ~IEChildItemProvider() {
      Dispose(false);
    }

    public void Dispose() {
      Dispose(true);
      GC.SuppressFinalize(this);
    }

    protected virtual void Dispose(bool disposing) {
      if (ieTaskProvider_ != IntPtr.Zero) {
        NativeMethods.DestroyIETaskProvider(ieTaskProvider_);
        ieTaskProvider_ = IntPtr.Zero;
      }
    }

    public List<ChildItem> GetItems() {
      if (ieTaskProvider_ == IntPtr.Zero) {
        throw new ObjectDisposedException(null);
      }

      if (!NativeMethods.GetIETaskProviderTasks(ieTaskProvider_, out IntPtr snapshotPtr)) {
        return null;
      }

      try {
        return ChildItem.GetChildItemsFromIETaskSnapshot(snapshotPtr);
      } finally {
        NativeMethods.DestroyIETaskSnapshot(snapshotPtr);
      }
    }

    private IntPtr ieTaskProvider_;
  }
}
