// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.InteropServices;

namespace EdgeProcessViewer {
  // This class takes in lists of processes and Edge items (e.g. tabs) and converts them to a
  // single BindingList of Tasks in a form suitable for display.
  class EdgeTaskList {
    public event EventHandler<NewTaskEventArgs> RaiseNewTaskEvent;

    public BindingList<Task> Tasks { get; } = new BindingList<Task>();

    public bool ShowArgumentsInTable;

    public void NotifyTasksShowArgumentInTableChanged(object sender, bool showArgumentsInTable) {
      ShowArgumentsInTable = showArgumentsInTable;

      foreach (Task task in Tasks) {
        task.ShowArgumentsInTable = showArgumentsInTable;
      }
    }

    // Refreshes the BindingList based on the data passed in.
    public void Refresh(List<Process> processes, Dictionary<int, List<ChildItem>> childItems) {
      List<Task> refreshedTasks = GetTasks(processes, childItems);

      // In order to avoid flickering and resetting the selection state, we need to update the
      // tasks in place, rather than simply clearing the list and adding all tasks from scratch.
      // First remove any tasks that no longer exist.
      for (int i = 0; i < Tasks.Count; i++) {
        if (!refreshedTasks.Contains(Tasks[i])) {
          Tasks.RemoveAt(i--);
        }
      }

      // Add any new tasks and update existing tasks.
      for (int i = 0; i < refreshedTasks.Count; i++) {
        if (i >= Tasks.Count || !Tasks[i].Equals(refreshedTasks[i])) {
          Tasks.Insert(i, refreshedTasks[i]);
          RaiseNewTaskEvent?.Invoke(this, new NewTaskEventArgs(refreshedTasks[i]));
        } else {
          Tasks[i].CopyFrom(refreshedTasks[i]);
        }
      }

      // Remove any leftover tasks since they no longer exist.
      while (Tasks.Count > refreshedTasks.Count) {
        Tasks.RemoveAt(Tasks.Count - 1);
      }
    }

    private List<Task> GetTasks(List<Process> processes,
                                Dictionary<int, List<ChildItem>> allChildItems) {
      // For each Edge browser or IE manager process, add it as a task followed by its child
      // process tasks.
      var tasks = new List<Task>();
      foreach (Process topLevelProcess in processes.Where(p => IsTopLevelProcess(p))) {
        // Ignore any IE manager processes that are not being hosted by Edge.
        if (topLevelProcess.Type == NativeMethods.ProcessType.IEManager &&
            !IsDualEngineIEManager(topLevelProcess)) {
          continue;
        }

        int treeDepth = 0;
        var topLevelTask = new Task(topLevelProcess, treeDepth, null, ShowArgumentsInTable);
        tasks.Add(topLevelTask);

        List<ChildItem> childItems;
        if (topLevelProcess.Type == NativeMethods.ProcessType.Browser) {
          allChildItems.TryGetValue(topLevelProcess.ProcessId, out childItems);
        } else {
          allChildItems.TryGetValue(0, out childItems);
        }
        
        GetChildProcessTasks(topLevelProcess.ProcessId, topLevelTask, treeDepth + 1,
                             processes, childItems, tasks);
      }
      return tasks;
    }

    private void GetChildProcessTasks(
        int parentProcessId, Task parentTask, int treeDepth, List<Process> processes,
        List<ChildItem> childItems, List<Task> tasks) {
      // For each child process, add it as a task followed by any items in that process.
      foreach (Process childProcess in
                  processes.Where(p => !IsTopLevelProcess(p) &&
                                       p.ParentProcessId == parentProcessId)) {
        var childProcessTask = new Task(childProcess, treeDepth, parentTask, ShowArgumentsInTable);
        tasks.Add(childProcessTask);
        GetChildItemsInProcess(childProcess.ProcessId, childProcessTask, treeDepth + 1, processes,
                               childItems, tasks);
      }
    }

    private void GetChildItemsInProcess(
        int processId, Task parentTask, int treeDepth, List<Process> processes,
        List<ChildItem> childItems, List<Task> tasks) {
      if (childItems == null) {
        return;
      }
      foreach (ChildItem childItem in
                  childItems.Where(i => i.ProcessId == processId)) {
        tasks.Add(new Task(childItem, treeDepth, parentTask));
      }

      parentTask.UpdateParentTaskProperties();
    }

    private bool IsTopLevelProcess(Process process) {
      return process.Type == NativeMethods.ProcessType.Browser ||
             process.Type == NativeMethods.ProcessType.IEManager;
    }

    private bool IsDualEngineIEManager(Process process) {
      return process.Type == NativeMethods.ProcessType.IEManager &&
             process.CommandLine.IndexOf("-DualEngineAdapter", StringComparison.OrdinalIgnoreCase) >= 0;
    }
  }
}
