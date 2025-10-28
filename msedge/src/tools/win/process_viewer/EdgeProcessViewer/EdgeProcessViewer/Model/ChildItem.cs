// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;

namespace EdgeProcessViewer {
  public class ChildItem {
    public ChildItem(NativeMethods.EdgeTask task) {
      ItemId = task.task_id;
      ProcessId = task.process_id;
      Title = Marshal.PtrToStringUni(task.title);
      AuxiliaryType = task.type;
    }

    public ChildItem(NativeMethods.IETask task) {
      ItemId = task.thread_id;
      ProcessId = task.process_id;
      Title = Marshal.PtrToStringUni(task.title);
      AuxiliaryType = NativeMethods.AuxiliaryType.kUnknown;
    }

    public long ItemId { get; set; }
    public int ProcessId { get; set; }
    public string Title { get; set; }

    public NativeMethods.AuxiliaryType AuxiliaryType { get; set; }

    public static List<ChildItem> GetChildItemsFromEdgeTaskSnapshot(IntPtr snapshotPtr) {
      var items = new List<ChildItem>();
      if (snapshotPtr != IntPtr.Zero) {
        var snapshot = Marshal.PtrToStructure<NativeMethods.EdgeTaskSnapshot>(snapshotPtr);
        IntPtr current = snapshot.tasks;
        for (int i = 0; i < snapshot.task_count; i++) {
          items.Add(new ChildItem(Marshal.PtrToStructure<NativeMethods.EdgeTask>(current)));
          current =
              new IntPtr(current.ToInt64() + Marshal.SizeOf<NativeMethods.EdgeTask>());
        }
      }
      return items;
    }

    public static List<ChildItem> GetChildItemsFromIETaskSnapshot(IntPtr snapshotPtr) {
      var items = new List<ChildItem>();
      if (snapshotPtr != IntPtr.Zero) {
        var snapshot = Marshal.PtrToStructure<NativeMethods.IETaskSnapshot>(snapshotPtr);
        IntPtr current = snapshot.tasks;
        for (int i = 0; i < snapshot.task_count; i++) {
          items.Add(new ChildItem(Marshal.PtrToStructure<NativeMethods.IETask>(current)));
          current =
              new IntPtr(current.ToInt64() + Marshal.SizeOf<NativeMethods.IETask>());
        }
      }
      return items;
    }
  }
}
