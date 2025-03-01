// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;

namespace EdgeProcessViewer {
  public class Process {
    public Process(NativeMethods.ProcessData process) {
      ProcessId = process.process_id;
      CreateTime = process.create_time;
      ParentProcessId = process.parent_process_id;
      FullImageName = Marshal.PtrToStringUni(process.full_image_name);
      CommandLine = Marshal.PtrToStringUni(process.command_line);
      Type = process.type;
      IntegrityLevel = process.integrity_level;
      SignaturePolicy = process.signature_policy;
      DynamicCodePolicy = process.dynamic_code_policy;
      CpuUsage = process.cpu_usage;
      MemoryUsage = process.memory_usage;
      SessionType = process.session_type;

      if (process.enterprise_id_count > 0 && process.enterprise_ids != IntPtr.Zero) {
        EnterpriseIds = new string[process.enterprise_id_count];
        for (int i = 0; i < process.enterprise_id_count; i++) {
          IntPtr current = new IntPtr(process.enterprise_ids.ToInt64() + i * IntPtr.Size);
          EnterpriseIds[i] = Marshal.PtrToStringUni(current);
        }
      } else {
        EnterpriseIds = null;
      }
    }

    public int ProcessId { get; set; }
    public long CreateTime { get; set; }
    public int ParentProcessId { get; set; }
    public string FullImageName { get; set; }
    public string CommandLine { get; set; }
    public NativeMethods.ProcessType Type { get; set; }
    public NativeMethods.IntegrityLevel IntegrityLevel { get; set; }
    public NativeMethods.SignaturePolicy SignaturePolicy { get; set; }
    public NativeMethods.DynamicCodePolicy DynamicCodePolicy { get; set; }
    public string[] EnterpriseIds { get; set; }
    public int CpuUsage { get; set; }
    public long MemoryUsage { get; set; }

    public NativeMethods.SessionType SessionType { get; set; }
  }

  public class ProcessDataProvider : IDisposable {
    public ProcessDataProvider() {
      processDataProvider_ = NativeMethods.CreateProcessDataProvider();
    }

    ~ProcessDataProvider() {
      Dispose(false);
    }

    public void Dispose() {
      Dispose(true);
      GC.SuppressFinalize(this);
    }

    protected virtual void Dispose(bool disposing) {
      if (processDataProvider_ != IntPtr.Zero) {
        NativeMethods.DestroyProcessDataProvider(processDataProvider_);
        processDataProvider_ = IntPtr.Zero;
      }
    }
    public List<Process> GetProcesses(NativeMethods.SessionType sessionFilter) {
      NativeMethods.RefreshProcessData(processDataProvider_);
      NativeMethods.GetProcessSnapshot(processDataProvider_, out IntPtr snapshotPtr);

      try {
        var processes = new List<Process>();
        var snapshot = Marshal.PtrToStructure<NativeMethods.ProcessSnapshot>(snapshotPtr);
        IntPtr current = snapshot.processes;
        for (int i = 0; i < snapshot.process_count; i++) {
          Process process = new Process(Marshal.PtrToStructure<NativeMethods.ProcessData>(current));
          if (sessionFilter.HasFlag(process.SessionType)) {
            processes.Add(process);
          }
          current = new IntPtr(current.ToInt64() + Marshal.SizeOf<NativeMethods.ProcessData>());
        }
        return processes;
      } finally {
        NativeMethods.DestroyProcessSnapshot(snapshotPtr);
      }
    }

    private IntPtr processDataProvider_;
  }
}