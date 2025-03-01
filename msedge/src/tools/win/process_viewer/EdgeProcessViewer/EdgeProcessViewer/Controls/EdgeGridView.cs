// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;

namespace EdgeProcessViewer.Controls {
  // Do not change or reorder these enum values because they get serialized to the settings XML.
  // Add new values to the end.
  // The value name must match the name of a corresponding property of the data source type (Task).
  public enum EdgeGridViewPredefinedColumns {
    TaskType = 1,
    ProcessId,
    ProcessIdHex,
    IntegrityLevel,
    CpuUsage,
    MemoryUsage,
    FullCommandLine,
    SignaturePolicy,
    DynamicCodePolicy,
    IsEDP,
    EnterpriseIds
  }

  // This class is a TaskGridView for displaying Edge tasks.
  public class EdgeGridView : TaskGridView {
    public EdgeGridView() {
      var cellContextMenuStrip = new ContextMenuStrip();
      cellContextMenuStrip.Items.Add(DebugMenuItemName);
      cellContextMenuStrip.Items.Add(EndProcessMenuItemName);
      cellContextMenuStrip.Items.Add(OpenFileLocationMenuItemName);
      cellContextMenuStrip.ItemClicked += cellContextMenuStrip_ItemClicked;
      SetCellContextMenu(cellContextMenuStrip);

      StoredColumnSettings = Properties.Settings.Default.EdgeGridViewColumns;
      PopulateWatchedArgsFromSettings();
      ColumnDefinitions = EdgeGridViewPredefinedColumnDefinitions;
      ColumnDefinitions.AddRange(watchedArgs_);

      CellFormatting += OnCellFormatting;
    }

    private void PopulateWatchedArgsFromSettings() {
      watchedArgs_ = new List<CommandLineArg>();
      if (StoredColumnSettings != null) {
        foreach (ColumnSetting setting in StoredColumnSettings) {
          if (setting.Name != null && setting.Name.Contains(CommandLineArg.WATCHED_ARG_PREFIX)) {
            watchedArgs_.Add(new CommandLineArg(setting.Label));
          }
        }
      }
    }

    public event EventHandler DebugInvoked;

    public event EventHandler EndProcessInvoked;

    public event EventHandler OpenFileLocationInvoked;

    /// <summary>
    /// The list of currently watched arguments
    /// </summary>
    public List<CommandLineArg> WatchedArgs {
      get {
        return watchedArgs_;
      }
    }

     protected override void RemoveColumn(DataGridViewColumn column) {
      CommandLineArg arg = new CommandLineArg(column.HeaderText);
      watchedArgs_.Remove(arg);
      Columns.Remove(column);
    }

    public void OnWatchedArgumentsChanged(object sender, WatchedArgumentsChangedEventArgs args) {
      // Remove columns that should no longer exist
      for (int i = 0; i < watchedArgs_.Count; i++) {
        if (!args.WatchedArguments.Contains(watchedArgs_[i])) {
          Columns.Remove(watchedArgs_[i].Name);
          watchedArgs_.RemoveAt(i--);
        }
      }
      
      // Add columns that are new
      for (int i = 0; i < args.WatchedArguments.Count; i++) {
        if (!watchedArgs_.Contains(args.WatchedArguments[i])) {
          AddColumn(args.WatchedArguments[i].Name, args.WatchedArguments[i].Label);
          watchedArgs_.Add(args.WatchedArguments[i]);
        }
      }
    }

    public void OnShowArgumentsInTable(object sender, bool showArguments) {
      foreach(CommandLineArg argument in watchedArgs_) {
        var column = this.Columns[argument.Name];
        if (column != null) {
          // This will force the column to be repainted, thus requerying the values in OnCellFormatting
          InvalidateColumn(Columns.IndexOf(column));
        }
      }
    }

    public Task GetSelectedTask() {
      if (SelectedRows.Count == 1) {
        return (Task)SelectedRows[0].DataBoundItem;
      } else {
        return null;
      }
    }

    public override void SaveSettings() {
      Properties.Settings.Default.EdgeGridViewColumns = GetCurrentColumnSettings();
    }

    private void OnCellFormatting(object sender, DataGridViewCellFormattingEventArgs e) {
      Task task = (Task)Rows[e.RowIndex].DataBoundItem;

      // Indent based on tree depth.
      Padding padding = e.CellStyle.Padding;
      padding.Left = 4 + (task.TreeDepth * 8);
      e.CellStyle.Padding = padding;

      // Set background color based on tree depth.
      switch (task.TreeDepth) {
        case 0:
          e.CellStyle.BackColor = Color.Lavender;
          break;
        case 1:
          e.CellStyle.BackColor = Color.MistyRose;
          break;
        case 2:
          e.CellStyle.BackColor = Color.OldLace;
          break;
        default:
          break;
      }

      // GridDataView doesn't support "Nested" property values, so some properties need to be
      // manually queried
      if (Columns[e.ColumnIndex].DataPropertyName.Contains(CommandLineArg.WATCHED_ARG_PREFIX)) {
        e.Value = task.RequestArgument(Columns[e.ColumnIndex].HeaderText);
      }
    }

    private void cellContextMenuStrip_ItemClicked(object sender, ToolStripItemClickedEventArgs e) {
      switch (e.ClickedItem.Text) {
        case DebugMenuItemName:
          DebugInvoked?.Invoke(this, EventArgs.Empty);
          break;
        case EndProcessMenuItemName:
          EndProcessInvoked?.Invoke(this, EventArgs.Empty);
          break;
        case OpenFileLocationMenuItemName:
          OpenFileLocationInvoked?.Invoke(this, EventArgs.Empty);
          break;
        default:
          break;
      }
    }

    protected override void SetupColumns() {
      base.SetupColumns();

      Columns[EdgeGridViewPredefinedColumns.FullCommandLine.ToString()].AutoSizeMode =
          DataGridViewAutoSizeColumnMode.Fill;
    }

    protected override ColumnSetting GetDefaultColumnSetting(string name, string label) {
      if (Enum.IsDefined(typeof(EdgeGridViewPredefinedColumns), name)) {
        var columnId = Enum.Parse(typeof(EdgeGridViewPredefinedColumns), name);
        switch (columnId) {
          case EdgeGridViewPredefinedColumns.TaskType:
            return new ColumnSetting(name, label, 81, visible: true);
          case EdgeGridViewPredefinedColumns.ProcessId:
            return new ColumnSetting(name, label, 50, visible: true);
          case EdgeGridViewPredefinedColumns.ProcessIdHex:
            return new ColumnSetting(name, label, 60, visible: false);
          case EdgeGridViewPredefinedColumns.IntegrityLevel:
            return new ColumnSetting(name, label, 93, visible: true);
          case EdgeGridViewPredefinedColumns.CpuUsage:
            return new ColumnSetting(name, label, 40, visible: true);
          case EdgeGridViewPredefinedColumns.MemoryUsage:
            return new ColumnSetting(name, label, 75, visible: true);
          case EdgeGridViewPredefinedColumns.FullCommandLine:
            return new ColumnSetting(name, label, 447, visible: true);
          case EdgeGridViewPredefinedColumns.SignaturePolicy:
            return new ColumnSetting(name, label, 150, visible: false);
          case EdgeGridViewPredefinedColumns.DynamicCodePolicy:
            return new ColumnSetting(name, label, 160, visible: false);
          case EdgeGridViewPredefinedColumns.IsEDP:
            return new ColumnSetting(name, label, 40, visible: false);
          case EdgeGridViewPredefinedColumns.EnterpriseIds:
            return new ColumnSetting(name, label, 100, visible: false);
          default:
            throw new ArgumentOutOfRangeException();
        }
      }

      // If it doesn't exist yet, we'll return a default version at the end of the list.
      return new ColumnSetting(name, label, 100, true);
    }

    private const string DebugMenuItemName = "&Debug";
    private const string EndProcessMenuItemName = "&Terminate";
    private const string OpenFileLocationMenuItemName = "&Open file location";

    private static readonly List<ColumnDefinition> EdgeGridViewPredefinedColumnDefinitions =
        new List<ColumnDefinition> {
          new ColumnDefinition(EdgeGridViewPredefinedColumns.TaskType.ToString(), "Task"),
          new ColumnDefinition(EdgeGridViewPredefinedColumns.ProcessId.ToString(), "PID"),
          new ColumnDefinition(EdgeGridViewPredefinedColumns.ProcessIdHex.ToString(), "PID (hex)"),
          new ColumnDefinition(EdgeGridViewPredefinedColumns.IntegrityLevel.ToString(), "Integrity"),
          new ColumnDefinition(EdgeGridViewPredefinedColumns.SignaturePolicy.ToString(), "Signature Policy"),
          new ColumnDefinition(EdgeGridViewPredefinedColumns.DynamicCodePolicy.ToString(), "Dynamic Code Policy"),
          new ColumnDefinition(EdgeGridViewPredefinedColumns.IsEDP.ToString(), "EDP"),
          new ColumnDefinition(EdgeGridViewPredefinedColumns.EnterpriseIds.ToString(), "Enterprise ID"),
          new ColumnDefinition(EdgeGridViewPredefinedColumns.CpuUsage.ToString(), "CPU"),
          new ColumnDefinition(EdgeGridViewPredefinedColumns.MemoryUsage.ToString(), "Memory"),
          new ColumnDefinition(EdgeGridViewPredefinedColumns.FullCommandLine.ToString(), "Command Line / Title"),
        };

    private List<CommandLineArg> watchedArgs_;
  }
}
