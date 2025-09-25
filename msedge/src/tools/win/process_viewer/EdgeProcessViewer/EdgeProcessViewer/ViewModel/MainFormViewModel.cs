// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace EdgeProcessViewer {
  class MainFormViewModel {
    public MainFormViewModel(IntPtr windowHandle) {
      EdgeTasks = edgeTaskList_.Tasks;
      refreshTimer_.Tick += (o, e) => { RefreshData(); };
      refreshTimer_.Interval = 1000;
      windowHandle_ = windowHandle;
      IsOnLaunchDebuggerEnabled = false;
      edgeTaskList_.ShowArgumentsInTable = Properties.Settings.Default.ShowArgumentsInTable;
    }

    #region Events

    public event EventHandler SelectedTaskReset;

    public event EventHandler<MainFormViewModelErrorEventArgs> MainFormViewModelError;

    public event EventHandler<RequestSetDebuggerPathEventArgs> RequestSetDebuggerPath;

    public event EventHandler<RequestEndProcessEventArgs> RequestEndProcess;

    public event EventHandler<RequestLaunchEdgeEventArgs> RequestLaunchEdge;

    #endregion Events

    #region Properties

    public BindingList<Task> EdgeTasks { get; private set; }

    public bool IsOnLaunchDebuggerEnabled { get; private set; }

    #endregion Properties

    #region Event handlers

    public void OnFormLoaded() {
      // Use the EdgeWatcherClient if possible, otherwise fall back to the TaskManagerClient.
      edgeWatcherClient_ = new EdgeWatcherClient();
      if (!edgeWatcherClient_.Connect()) {
        edgeWatcherClient_.Dispose();
        edgeWatcherClient_ = null;
        edgeInstances_ = new Dictionary<int, EdgeInstance>();
      }

      RefreshData();
      refreshTimer_.Start();
    }

    public void OnFormClosing() {
      refreshTimer_.Stop();
      if (edgeWatcherClient_ != null) {
        edgeWatcherClient_.Dispose();
        edgeWatcherClient_ = null;
      }
      if (edgeInstances_ != null) {
        foreach (EdgeInstance edgeInstance in edgeInstances_.Values) {
          edgeInstance.Timer.Stop();
          edgeInstance.TaskManagerClient.Dispose();
        }
        edgeInstances_ = null;
      }
    }

    #endregion Event handlers

    #region Commands

    public void OnSetDebuggerPath() {
      string debuggerPath =
          DebugSettings.GetDebuggerPath(Properties.Settings.Default.DebuggerPath);
      string onLaunchDebuggerPath = DebugSettings.GetDebuggerPath(Properties.Settings.Default.OnLaunchDebuggerPath);
      string onLaunchDebuggerArgs = Properties.Settings.Default.OnLaunchDebuggerArguments;
      var eventArgs = new RequestSetDebuggerPathEventArgs(debuggerPath, onLaunchDebuggerPath, onLaunchDebuggerArgs);
      RequestSetDebuggerPath?.Invoke(this, eventArgs);

      if (!eventArgs.Cancel) {
        Properties.Settings.Default.DebuggerPath =
          String.IsNullOrWhiteSpace(eventArgs.DebuggerPath) ? String.Empty : eventArgs.DebuggerPath;
        Properties.Settings.Default.OnLaunchDebuggerPath =
          String.IsNullOrWhiteSpace(eventArgs.OnLaunchDebuggerPath) ? String.Empty : eventArgs.OnLaunchDebuggerPath;
        Properties.Settings.Default.OnLaunchDebuggerArguments =
          String.IsNullOrWhiteSpace(eventArgs.OnLaunchDebuggerArguments) ? String.Empty : eventArgs.OnLaunchDebuggerArguments;
        Properties.Settings.Default.Save();
      }
    }

    public void OnEnablePostmortemDebugger(bool enable) {
      string debugger = null;
      if (enable) {
        debugger = DebugSettings.GetDebuggerPath(Properties.Settings.Default.DebuggerPath);
        if (!IsValidDebuggerPath(debugger)) {
          return;
        }
      }

      if (Utility.IsElevated) {
        DebugSettings.SetPostmortemDebugger(enable ? debugger : null);
      } else {
        LaunchElevated($"/postmortem:{enable}");
      }
    }

    public void OnEnableOnLaunchDebugger(bool enable) {
      IsOnLaunchDebuggerEnabled = enable;
      if (IsOnLaunchDebuggerEnabled) {
        edgeTaskList_.RaiseNewTaskEvent += OnNewTaskAttachDebugger;
      } else {
        edgeTaskList_.RaiseNewTaskEvent -= OnNewTaskAttachDebugger;
      }
    }

    void OnNewTaskAttachDebugger(object sender, NewTaskEventArgs e) {
      string debuggerPath = Properties.Settings.Default.OnLaunchDebuggerPath;
      if (!String.IsNullOrEmpty(debuggerPath)) {
        string commandLine = String.IsNullOrEmpty(e.Task.Process?.CommandLine) ? "" : e.Task.Process?.CommandLine;
        Regex debuggerRegex = new Regex(@"(?<=\s)--wait-for-debugger(?=$|\s)", RegexOptions.IgnoreCase);
        if (debuggerRegex.IsMatch(commandLine) == true) {
          try {
            if (!DebugSettings.CheckDebuggerPresent(e.Task.Process.ProcessId)) {
              string debuggerArgs = String.Format(Properties.Settings.Default.OnLaunchDebuggerArguments, e.Task.Process.ProcessId);
              try {
                using (var debugProcess = System.Diagnostics.Process.Start(Properties.Settings.Default.OnLaunchDebuggerPath, debuggerArgs)) {
                }
              } catch {
                // Silently fail since this could fail multiple times in quick succession during startup 
                // if something is wrong with the set and we wouldn't want to spam the user
              }
            }
          } catch { }
        }
      }
    }

    public void OnLaunchEdge() {
      string edgePath = Properties.Settings.Default.EdgePath;
      string edgeArgs = Properties.Settings.Default.EdgeArguments;
      var eventArgs = new RequestLaunchEdgeEventArgs(edgePath, edgeArgs);
      RequestLaunchEdge?.Invoke(this, eventArgs);

      if (!eventArgs.Cancel) {
        Properties.Settings.Default.EdgePath =
          String.IsNullOrWhiteSpace(eventArgs.EdgePath) ? String.Empty : eventArgs.EdgePath;
        Properties.Settings.Default.EdgeArguments =
          String.IsNullOrWhiteSpace(eventArgs.EdgeArguments) ? String.Empty : eventArgs.EdgeArguments;

        Properties.Settings.Default.Save();

        edgePath = Properties.Settings.Default.EdgePath;
        if (!String.IsNullOrEmpty(edgePath)) {
          edgeArgs = Properties.Settings.Default.EdgeArguments;
          try {
            using (var process = System.Diagnostics.Process.Start(edgePath, edgeArgs)) { }
          } catch (Exception ex) {
            ShowErrorMessage(
                $"Failed to start Edge:\n{ex.Message}\n\nEdge path:\n{edgePath}");
          }
        }
      }
    }

    public void OnDebug(Task task) {
      string debuggerPath =
          DebugSettings.GetDebuggerPath(Properties.Settings.Default.DebuggerPath);
      if (IsValidDebuggerPath(debuggerPath)) {
        string arguments = $"-p {task.GetProcessTask().ProcessId}";
        try {
          using (var process = System.Diagnostics.Process.Start(debuggerPath, arguments)) { }
        } catch (Exception ex) {
          ShowErrorMessage(
              $"Failed to start debugger:\n{ex.Message}\n\nDebugger path:\n{debuggerPath}");
        }
      }
    }

    public void OnEndProcess(Task task) {
      Task processTask = task.GetProcessTask();
      if (processTask != null) {
        var eventArgs = new RequestEndProcessEventArgs(processTask.TaskType.ToLower(),
                                                       processTask.ProcessId);
        RequestEndProcess?.Invoke(this, eventArgs);
        if (!eventArgs.Cancel) {
          try {
            using (var process =
                      System.Diagnostics.Process.GetProcessById(processTask.Process.ProcessId)) {
              process.Kill();
            }
          } catch (ArgumentException e) {
            ShowEndProcessErrorMessage(e.Message);
          } catch (Win32Exception e) {
            ShowEndProcessErrorMessage(e.Message);
          }

          RefreshDataAndResetTimer();
          SelectedTaskReset?.Invoke(this, EventArgs.Empty);
        }
      }
    }

    public void OnOpenFileLocation(Task task) {
      Task processTask = task.GetProcessTask();
      if (processTask != null) {
        System.Threading.Tasks.Task.Run(() => OpenFileLocation(processTask.Process.FullImageName));
      }
    }

    static private void OpenFileLocation(string filePath) {
      IntPtr pidl;
      int hr = NativeMethods.SHParseDisplayName(filePath, IntPtr.Zero, out pidl, 0, IntPtr.Zero);
      if (hr != NativeMethods.S_OK) {
        return;
      }
      try {
        NativeMethods.SHOpenFolderAndSelectItems(pidl, 0, IntPtr.Zero, 0);
      } finally {
        Marshal.FreeCoTaskMem(pidl);
      }
    }

    public void OnSessionFilterChanged(object sender, NativeMethods.SessionType sessionFilter) {
     sessionFilter_ = sessionFilter;
     RefreshData();
    }

    public void OnShowArgumentInTableChanged(object sender, bool showArgument) {
      Properties.Settings.Default.ShowArgumentsInTable = showArgument;
      edgeTaskList_.NotifyTasksShowArgumentInTableChanged(sender, showArgument);
    }

    #endregion Commands

    public bool IsPostmortemDebuggerEnabled() {
      return DebugSettings.IsPostmortemDebuggerEnabled();
    }

    private void RefreshDataAndResetTimer() {
      refreshTimer_.Stop();
      RefreshData();
      refreshTimer_.Start();
    }

    private void RefreshData() {
      // Refresh the task list using the current set of processes, and the most recent list of
      // ChildItems for each instance.
      List<Process> processes = processDataProvider_.GetProcesses(sessionFilter_);
      var browserProcessIds = processes.Where(p => p.Type == NativeMethods.ProcessType.Browser)
                                       .Select(p => p.ProcessId);

      Dictionary<int, List<ChildItem>> edgeChildItems;
      if (edgeWatcherClient_ != null) {
        // Use the EdgeWatcherClient to get the list of ChildItems from shared memory.
        edgeChildItems = new Dictionary<int, List<ChildItem>>();
        foreach (int browserProcessId in browserProcessIds) {
          edgeChildItems[browserProcessId] = edgeWatcherClient_.GetItems(browserProcessId);
        }
      } else if (edgeInstances_ != null) {
        // Get the last-received list of ChildItems for each instance.
        edgeChildItems = edgeInstances_.ToDictionary(x => x.Key, x => x.Value.Items);
        UpdateEdgeInstances(browserProcessIds);
      } else {
        edgeChildItems = new Dictionary<int, List<ChildItem>>();
      }

      // The IE child items are not sorted by parent PID, so as a special case we put them all
      // under PID 0 which will never be used as a parent PID.
      edgeChildItems[0]= ieChildItemProvider_.GetItems();

      edgeTaskList_.Refresh(processes, edgeChildItems);
    }

    private void UpdateEdgeInstances(IEnumerable<int> browserProcessIds) {
      // Remove EdgeInstance for any instances that are no longer running (i.e. are not in the
      // process list).
      var endedProcessIds =
          edgeInstances_.Keys.Where(id => !browserProcessIds.Contains(id)).ToList();
      foreach (int endedProcessId in endedProcessIds) {
        edgeInstances_.Remove(endedProcessId);
      }

      // Create EdgeInstance for any new instances (i.e. are in the process list but we don't have
      // a matching EdgeInstance). Each EdgeInstance will communicate with its associated browser
      // process on a worker thread to refresh its list of ChildItems on a recurring basis.
      foreach (int processId in browserProcessIds) {
        if (processId == 0) {
          // Verify that we don't have a process with PID 0 (which should never happen), because we
          // use that value as a placeholder parent for IE child items.
          throw new ApplicationException("Unexpectedly found browser process with PID 0.");
        }
        if (!edgeInstances_.TryGetValue(processId, out EdgeInstance edgeInstance)) {
          edgeInstance = new EdgeInstance(processId);
          edgeInstance.Timer.Tick += (o, e) => { RefreshChildItems(edgeInstance); };
          edgeInstance.Timer.Interval = 1000;
          edgeInstance.Timer.Start();
          edgeInstances_[processId] = edgeInstance;
        }
      }
    }

    private async void RefreshChildItems(EdgeInstance edgeInstance) {
      edgeInstance.Timer.Stop();

      // Communicate with the browser process on a worker thread without blocking the UI thread.
      int processId = edgeInstance.ProcessId;
      EdgeTaskManagerClient edgeTaskManagerClient = edgeInstance.TaskManagerClient;
      List<ChildItem> childItems = await System.Threading.Tasks.Task.Run(
                                       () => GetChildItemsAsync(processId, edgeTaskManagerClient));

      // Only refresh the list if the communication was successful. Otherwise just keep the
      // previous list.
      if (childItems != null) {
        edgeInstance.Items = childItems;
      }

      // If the instance is still running, schedule another refresh.
      if (edgeInstances_ != null && edgeInstances_.ContainsKey(edgeInstance.ProcessId)) {
        edgeInstance.Timer.Start();
      } else {
        edgeInstance.TaskManagerClient.Dispose();
      }
    }

    private List<ChildItem> GetChildItemsAsync(int processId,
                                               EdgeTaskManagerClient edgeTaskManagerClient) {
      if (!edgeTaskManagerClient.IsConnected) {
        edgeTaskManagerClient.Connect(processId);
      }
      if (edgeTaskManagerClient.IsConnected) {
        return edgeTaskManagerClient.GetItems();
      } else {
        return null;
      }
    }

    private void LaunchElevated(string argument) {
      try {
        using (var elevatedProcess =
                  LaunchProcessElevated(Assembly.GetExecutingAssembly().Location, argument)) { }
      } catch (Win32Exception e) {
        // Show an error message unless the "error" is that the user chose to cancel the elevation.
        if (e.NativeErrorCode != CanceledByUserErrorCode) {
          ShowErrorMessage(e.Message);
        }
      }
    }

    private bool IsValidDebuggerPath(string path) {
      if (String.IsNullOrEmpty(path)) {
        ShowErrorMessage(
            "No debugger is set. Go to the Debug menu and select \"Set debugger path\".");
        return false;
      }
      return true;
    }

    private void ShowEndProcessErrorMessage(string innerMessage) {
      ShowErrorMessage($"Failed to end process: {innerMessage}");
    }

    private void ShowErrorMessage(string message) {
      MainFormViewModelError?.Invoke(this, new MainFormViewModelErrorEventArgs(message));
    }

    private System.Diagnostics.Process LaunchProcessElevated(string fileName, string arguments) {
      var startInfo = new System.Diagnostics.ProcessStartInfo {
        FileName = fileName,
        Arguments = arguments,
        UseShellExecute = true,
        Verb = "runas",
        ErrorDialog = true,
        ErrorDialogParentHandle = windowHandle_
      };
      return System.Diagnostics.Process.Start(startInfo);
    }

    private class EdgeInstance {
      public EdgeInstance(int processId) {
        ProcessId = processId;
        TaskManagerClient = new EdgeTaskManagerClient();
        Timer = new Timer();
        Items = new List<ChildItem>();
      }

      public int ProcessId { get; }
      public EdgeTaskManagerClient TaskManagerClient { get; }
      public Timer Timer { get; }
      public List<ChildItem> Items { get; set; }
    }

    private const int CanceledByUserErrorCode = 1223;

    private EdgeTaskList edgeTaskList_ = new EdgeTaskList();
    private ProcessDataProvider processDataProvider_ = new ProcessDataProvider();
    private IEChildItemProvider ieChildItemProvider_ = new IEChildItemProvider();
    private EdgeWatcherClient edgeWatcherClient_;
    private Dictionary<int, EdgeInstance> edgeInstances_;
    private Timer refreshTimer_ = new Timer();
    private IntPtr windowHandle_;
    private NativeMethods.SessionType sessionFilter_;
  }
}
