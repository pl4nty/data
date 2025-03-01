// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Runtime.InteropServices;

namespace EdgeProcessViewer {
  public static class NativeMethods {
    public const int S_OK = 0;

    #region process_viewer_data.dll

    public enum ProcessType {
      Unknown = 0,
      Browser,
      CrashpadHandler,
      Watcher,
      Gpu,
      Utility,
      Plugin,
      PluginBroker,
      Extension,
      Renderer,
      IEManager,
      IEContent,
    }

    public enum IntegrityLevel {
      Unknown = 0,
      System,
      High,
      Medium,
      Low,
      Untrusted,
      AppContainer,
    }

    [Flags]
    public enum SignaturePolicy {
      None = 0,
      MicrosoftSignedOnly = 0x1,
      StoreSignedOnly = 0x2,
      MitigationOptIn = 0x4,
    };

    [Flags]
    public enum DynamicCodePolicy {
      None = 0x0,
      ProhibitDynamicCode = 0x1,
      AllowThreadOptOut = 0x2,
      AllowRemoteDowngrade = 0x4,
    };

    [Flags]
    public enum SessionType {
      Unknown = 0x0,
      CanaryChannel = 0x1,
      DeveloperChannel = 0x2,
      BetaChannel = 0x4,
      StableChannel = 0x10,
      LocalBuild = 0x20,
      IEProcess = 0x40,
      Webview = 0x80,
    };

    [StructLayout(LayoutKind.Sequential)]
    public struct ProcessData {
      public int process_id;
      public long create_time;
      public int parent_process_id;
      public IntPtr full_image_name;
      public IntPtr command_line;
      public ProcessType type;
      public IntegrityLevel integrity_level;
      public SignaturePolicy signature_policy;
      public DynamicCodePolicy dynamic_code_policy;
      public int enterprise_id_count;
      public IntPtr enterprise_ids;
      public int cpu_usage;
      public long memory_usage;
      public SessionType session_type;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct ProcessSnapshot {
      public int process_count;
      public IntPtr processes;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct EdgeTask {
      public long task_id;
      public int process_id;
      public IntPtr title;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct EdgeTaskSnapshot {
      public int task_count;
      public IntPtr tasks;
    };

    [StructLayout(LayoutKind.Sequential)]
    public struct IETask {
      public int process_id;
      public int thread_id;
      public IntPtr title;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct IETaskSnapshot {
      public int task_count;
      public IntPtr tasks;
    };

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    [return: MarshalAs(UnmanagedType.I1)]
    public static extern bool InitializeEdgeDataProvider();

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    public static extern void UninitializeEdgeDataProvider();

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    public static extern IntPtr CreateProcessDataProvider();

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    public static extern void DestroyProcessDataProvider(IntPtr dataProvider);

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    [return: MarshalAs(UnmanagedType.I1)]
    public static extern bool RefreshProcessData(IntPtr dataProvider);

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    [return: MarshalAs(UnmanagedType.I1)]
    public static extern bool GetProcessSnapshot(IntPtr dataProvider,
                                                 out IntPtr snapshotPtr);

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    [return: MarshalAs(UnmanagedType.I1)]
    public static extern bool DestroyProcessSnapshot(IntPtr snapshotPtr);

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    public static extern IntPtr CreateTaskManagerClient();

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    public static extern void DestroyTaskManagerClient(IntPtr task_manager_client);

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    public static extern void DestroyEdgeTaskSnapshot(IntPtr snapshot);

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    [return: MarshalAs(UnmanagedType.I1)]
    public static extern bool ConnectToTaskManagerServer(IntPtr task_manager_client,
                                                         int process_id, long timeout_ms);

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    public static extern bool StartTaskManagerMonitoring(IntPtr task_manager_client);

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    public static extern bool StopTaskManagerMonitoring(IntPtr task_manager_client);

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    [return: MarshalAs(UnmanagedType.I1)]
    public static extern bool GetTaskManagerMonitoredTasks(IntPtr task_manager_client,
                                                           out IntPtr snapshot);

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    public static extern IntPtr CreateEdgeWatcherClient();

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    public static extern void DestroyEdgeWatcherClient(IntPtr edge_watcher_client);

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    [return: MarshalAs(UnmanagedType.I1)]
    public static extern bool ConnectToEdgeWatcherServer(IntPtr edge_watcher_client);

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    [return: MarshalAs(UnmanagedType.I1)]
    public static extern bool GetEdgeWatcherMonitoredTasks(IntPtr edge_watcher_client,
                                                           int process_id, out IntPtr snapshot);

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    public static extern IntPtr CreateIETaskProvider();

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    public static extern void DestroyIETaskProvider(IntPtr ie_task_provider);

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    public static extern void DestroyIETaskSnapshot(IntPtr snapshot);

    [DllImport("process_viewer_data.dll", CallingConvention = CallingConvention.Cdecl)]
    [return: MarshalAs(UnmanagedType.I1)]
    public static extern bool GetIETaskProviderTasks(IntPtr ie_task_provider,
                                                     out IntPtr snapshot);

    #endregion process_viewer_data.dll

    #region shell32.dll

    public enum SHSTOCKICONID {
      SIID_SHIELD = 77,
    }

    [Flags]
    public enum SHGSI {
      SHGSI_SMALLICON = 0x000000001,
      SHGSI_ICON      = 0x000000100,
    }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct SHSTOCKICONINFO {
      public int cbSize;
      public IntPtr hIcon;
      public int iSysIconIndex;
      public int iIcon;

      [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 260)]
      public string szPath;
    }

    [DllImport("shell32.dll")]
    public static extern int SHGetStockIconInfo(SHSTOCKICONID siid, SHGSI uFlags,
                                                ref SHSTOCKICONINFO psii);

    [DllImport("shell32.dll", CharSet = CharSet.Unicode)]
    public static extern int SHOpenFolderAndSelectItems(IntPtr pidlFolder, int cidl, IntPtr apidl,
                                                        int dwFlags);

    [DllImport("shell32.dll", CharSet = CharSet.Unicode)]
    public static extern int SHParseDisplayName(string pszName, IntPtr pbc, out IntPtr ppidl,
                                                int sfgaoIn, IntPtr psfgaoOut);

    #endregion shell32.dll

    #region user32.dll

    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool DestroyIcon(IntPtr hIcon);

    #endregion user32.dll

    #region kernel32.dll
    [DllImport("Kernel32.dll", SetLastError = true, ExactSpelling = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool CheckRemoteDebuggerPresent(IntPtr hProcess, [MarshalAs(UnmanagedType.Bool)]ref bool isDebuggerPresent);
    #endregion kernel32.dll
  }
}
