// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using EdgeProcessViewer.Controls;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.Web;
using static EdgeProcessViewer.NativeMethods;

namespace EdgeProcessViewer {
  // This class represents a task in a general form that can serve as a databinding source. The
  // task could be a process, a tab, etc.
  public class Task : INotifyPropertyChanged {
    public Task(Process process, int treeDepth, Task parent, bool showArgumentsInTable) {
      baseTaskType_ = DisplayStrings.GetProcessType(process.Type);
      taskType_ = baseTaskType_;
      ProcessId = DisplayStrings.GetProcessId(process.ProcessId);
      ProcessIdHex = DisplayStrings.GetProcessIdHex(process.ProcessId);
      integrityLevel_ = DisplayStrings.GetIntegrityLevel(process.IntegrityLevel);
      cpuUsage_ = DisplayStrings.GetCpuUsage(process.CpuUsage);
      memoryUsage_ = DisplayStrings.GetMemoryUsage(process.MemoryUsage);
      fullCommandLine_ = DisplayStrings.GetCommandLine(process.CommandLine);
      ParseCommandLine();
      signaturePolicy_ = process.SignaturePolicy.ToString();
      dynamicCodePolicy_ = process.DynamicCodePolicy.ToString();
      isEDP_ = DisplayStrings.GetEDP(process.EnterpriseIds);
      enterpriseIds_ = DisplayStrings.GetEnterpriseIds(process.EnterpriseIds);
      treeDepth_ = treeDepth;
      parent_ = parent;
      process_ = process;
      showArgumentsInTable_ = showArgumentsInTable;
    }

    private void ParseCommandLine() {
      string[] parsedCommandLine_ = fullCommandLine_.Split(
        CommandLineArg.COMMAND_LINE_DELIMITERS,
        StringSplitOptions.RemoveEmptyEntries);
      commandLineArguments_ = new List<string>(parsedCommandLine_);
      commandLineArguments_.RemoveAt(0);
    }

    public Task(ChildItem childItem, int treeDepth, Task parent) {
      TaskId = childItem.ItemId;
      fullCommandLine_ = DisplayStrings.GetTitle(parent.Process.Type, childItem.Title);
      treeDepth_ = treeDepth;
      parent_ = parent;
      childItem_ = childItem;
      if (parent_ != null && childItem_ != null && childItem_.AuxiliaryType != AuxiliaryType.kUnknown) {
        parent_.AuxiliaryTypes.Add(childItem_.AuxiliaryType);
      }
    }

    public event PropertyChangedEventHandler PropertyChanged;

    #region Visible properties

    public string BaseTaskType {
      get { return baseTaskType_; }
      set { baseTaskType_ = value; }
    }

    public string TaskType {
      get { return taskType_; }
      private set { SetProperty(ref taskType_, value); }
    }

    // The Process ID is part of the task's identity and thus is immutable.
    public string ProcessId { get; } = String.Empty;

    public string ProcessIdHex { get; } = String.Empty;

    public string IntegrityLevel {
      get { return integrityLevel_; }
      private set { SetProperty(ref integrityLevel_, value); }
    }

    public string CpuUsage {
      get { return cpuUsage_; }
      private set { SetProperty(ref cpuUsage_, value); }
    }

    public string MemoryUsage {
      get { return memoryUsage_; }
      private set { SetProperty(ref memoryUsage_, value); }
    }

    public string FullCommandLine {
      get { return fullCommandLine_; }
      private set { SetProperty(ref fullCommandLine_, value); }
    }

    public string SignaturePolicy {
      get { return signaturePolicy_; }
      private set { SetProperty(ref signaturePolicy_, value); }
    }

    public string DynamicCodePolicy {
      get { return dynamicCodePolicy_; }
      private set { SetProperty(ref dynamicCodePolicy_, value); }
    }

    public string IsEDP {
      get { return isEDP_; }
      private set { SetProperty(ref isEDP_, value); }
    }

    public string EnterpriseIds {
      get { return enterpriseIds_; }
      private set { SetProperty(ref enterpriseIds_, value); }
    }

    public List<AuxiliaryType> AuxiliaryTypes {
      get { return auxiliaryTypes; }
    }

    public bool ShowArgumentsInTable {
      get {
        return showArgumentsInTable_;
      }

      set {
        showArgumentsInTable_ = value;
      }
    }

    public string RequestArgument(string name) {
      for (int j = 0; j < commandLineArguments_.Count; j++) {
        if (commandLineArguments_[j].Contains(name)) {
          if (ShowArgumentsInTable) {
            return commandLineArguments_[j];
          } else {
            CommandLineArg arg = new CommandLineArg(name);
            string strippedArg = arg.StripCommandLineArgument(commandLineArguments_[j]);
            if (strippedArg == "") {
              // Some args are just a flag, so this will say whether the flag is present
              return "true";
            }
            return strippedArg;
          }
        }
      }

      return null;
    }
    #endregion Visible properties

    #region Hidden properties

    public int TreeDepth {
      get { return treeDepth_; }
      private set { SetProperty(ref treeDepth_, value); }
    }

    // The Task ID is part of the task's identity and thus is immutable.
    public long TaskId { get; } = 0;

    public Task Parent {
      get { return parent_; }
      private set { SetProperty(ref parent_, value); }
    }

    public Process Process {
      get { return process_; }
      private set { SetProperty(ref process_, value); }
    }

    public ChildItem ChildItem {
      get { return childItem_; }
      private set { SetProperty(ref childItem_, value); }
    }

    public AuxiliaryType AuxiliaryType {
      get { 
        if (ChildItem != null) {
          return ChildItem.AuxiliaryType;
        } else if (AuxiliaryTypes.Count > 0) {
          // Return the last of the list because that will decide the type
          return AuxiliaryTypes.Last();
        }

        return AuxiliaryType.kUnknown;
      }
    }

    #endregion Hidden properties

    public void UpdateParentTaskProperties() {
      if (TreeDepth == 1) {
        if (AuxiliaryType != AuxiliaryType.kUnknown) {
          TaskType = GetTaskTypeStringPrefix() + BaseTaskType;
        }
      }
    }

    string GetTaskTypeStringPrefix() {
      string prefix = "";

      if (AuxiliaryTypes.Contains(AuxiliaryType.kSpareRenderer)) {
        if (AuxiliaryTypes.Count > 1) {
          prefix += " * Used Spare * ";
        } else {
          prefix += " * Spare * ";
        }
      }

      if (AuxiliaryTypes.Contains(AuxiliaryType.kTopChrome)) {
        prefix += " * Top Chrome * ";
      }

      return prefix;
    }

    public void CopyFrom(Task task) {
      IntegrityLevel = task.IntegrityLevel;
      CpuUsage = task.CpuUsage;
      MemoryUsage = task.MemoryUsage;
      FullCommandLine = task.FullCommandLine;
      TreeDepth = task.TreeDepth;
      Parent = task.Parent;
      Process = task.Process;
      ChildItem = task.ChildItem;
      BaseTaskType = task.BaseTaskType;
      TaskType = task.TaskType;
      AuxiliaryTypes.UnionWith(task.AuxiliaryTypes);
      UpdateParentTaskProperties();
    }

    public Task GetProcessTask() {
      if (Process == null) {
        // A non-process task must have a process task as its parent.
        return Parent;
      } else {
        return this;
      }
    }

    public override bool Equals(object o) {
      if (o is Task other) {
        if (Process != null && other.Process != null) {
          return (Process.ProcessId == other.Process.ProcessId);
        }
        if (ChildItem != null && other.ChildItem != null) {
          return (ChildItem.ProcessId == other.ChildItem.ProcessId &&
                  ChildItem.ItemId == other.ChildItem.ItemId);
        }
      }
      return false;
    }

    public override int GetHashCode() {
      int hash = 17;
      hash = hash * 67 + ProcessId.GetHashCode();
      hash = hash * 67 + TaskId.GetHashCode();
      return hash;
    }

    private void SetProperty<T>(ref T member, T value,
                                [CallerMemberName] string propertyName = "") {
      if (!Object.Equals(member, value)) {
        member = value;
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
      }
    }

    private void SetCommandLineProperty(string value) {
      if (!Object.Equals(fullCommandLine_, value)) {
        fullCommandLine_ = value;
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs("FullCommandLine"));
      }
    }

    private List<AuxiliaryType> auxiliaryTypes = new List<AuxiliaryType>();
    private string taskType_ = String.Empty;
    private string baseTaskType_ = String.Empty;
    private string integrityLevel_ = String.Empty;
    private string cpuUsage_ = String.Empty;
    private string memoryUsage_ = String.Empty;
    private string fullCommandLine_ = String.Empty;
    private List<string> commandLineArguments_ = new List<string>();
    private string signaturePolicy_ = String.Empty;
    private string dynamicCodePolicy_ = String.Empty;
    private string isEDP_ = String.Empty;
    private string enterpriseIds_ = String.Empty;
    private int treeDepth_ = 0;
    private Task parent_ = null;
    private Process process_ = null;
    private ChildItem childItem_ = null;
    private bool showArgumentsInTable_ = false;
  }
}
