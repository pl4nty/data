// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace EdgeProcessViewer.Controls {
  // This class is a DataGridView which is customized for displaying read-only rows of data, and
  // which allows the user to choose which columns are shown.
  public class CommandLineArgGridView : DataGridView {
    public CommandLineArgGridView() {
      AllowUserToAddRows = false;
      AllowUserToDeleteRows = false;
      AllowUserToResizeRows = false;
      AllowUserToOrderColumns = true;
      AutoGenerateColumns = false;
      BorderStyle = BorderStyle.Fixed3D;
      BackgroundColor = SystemColors.Menu;
      CellBorderStyle = DataGridViewCellBorderStyle.SingleHorizontal;
      DoubleBuffered = true;
      EditMode = DataGridViewEditMode.EditProgrammatically;
      MultiSelect = false;
      ReadOnly = true;
      RowHeadersVisible = false;
      ColumnHeadersVisible = false;
      SelectionMode = DataGridViewSelectionMode.FullRowSelect;
      ShowCellToolTips = false;
      StandardTab = true;
      commandLineArgs_ = new BindingList<CommandLineArg>();

      DataSource = new BindingSource(commandLineArgs_, "");
      this.argumentColumn_ = new DataGridViewTextBoxColumn();
      this.argumentColumn_.DataPropertyName = "Label";
      this.argumentColumn_.Name = "labelColumn";
      this.argumentColumn_.ReadOnly = true;
      this.argumentColumn_.Width = this.Width;
      this.Columns.AddRange(new DataGridViewColumn[] {
            this.argumentColumn_});

      ClearSelection();
      CellContextMenuStripNeeded += OnCellContextMenuStripNeeded;
      CellMouseDown += OnCellMouseDown;
      DataSourceChanged += OnDataSourceChanged;
      RowPrePaint += OnRowPrePaint;
    }

    #region Public methods

    // Selects the row above the currently selected row, or the first row if none is selected.
    public void GoUp() {
      if (SelectedRows.Count > 0) {
        int newIndex = SelectedRows[0].Index - 1;
        if (newIndex >= 0) {
          Rows[newIndex].Selected = true;
        }
      } else if (Rows.Count > 0) {
        Rows[0].Selected = true;
      }
    }

    // Selects the row below the currently selected row, or the first row if none is selected.
    public void GoDown() {
      if (SelectedRows.Count > 0) {
        int newIndex = SelectedRows[0].Index + 1;
        if (newIndex < Rows.Count) {
          Rows[newIndex].Selected = true;
        }
      } else if (Rows.Count > 0) {
        Rows[0].Selected = true;
      }
    }

    // Selects the first row.
    public void GoHome() {
      if (Rows.Count > 0) {
        Rows[0].Selected = true;
      }
    }

    // Selects the last row.
    public void GoEnd() {
      if (Rows.Count > 0) {
        Rows[Rows.Count - 1].Selected = true;
      }
    }

    // Saves the current settings for the TaskGridView.
    //public abstract void SaveSettings();

    #endregion Public methods

    #region Event handlers
    protected override void OnResize(EventArgs e) {
      base.OnResize(e);
      this.argumentColumn_.Width = this.Width;
    }


    protected virtual void OnDataSourceChanged(object sender, EventArgs e) {
      // The first row in the DataGridView will automatically be selected after this method
      // returns, so set an immediate timer to clear the selection.
      var clearSelectionTimer = new Timer();
      clearSelectionTimer.Tick += (o, t) => {
        ClearSelection();
        clearSelectionTimer.Stop();
      };
      clearSelectionTimer.Interval = 1;
      clearSelectionTimer.Start();
    }

    protected virtual void OnRowPrePaint(object sender, DataGridViewRowPrePaintEventArgs e) {
      // Don't show focus rect on grid cells.
      e.PaintParts &= ~DataGridViewPaintParts.Focus;
    }

    protected virtual void OnCellContextMenuStripNeeded(
        object sender, DataGridViewCellContextMenuStripNeededEventArgs e) {
      // Only use this context menu on a cell in the DataGridView, not on column headers.
      if (e.ColumnIndex != -1 && e.RowIndex != -1) {
        e.ContextMenuStrip = cellContextMenuStrip_;
      }
    }

    protected virtual void OnCellMouseDown(object sender, DataGridViewCellMouseEventArgs e) {
      // By default, right-clicking on a row doesn't select it, but we want the row to be selected
      // so that the context menu behaves as expected.
      if (e.Button == MouseButtons.Right && e.ColumnIndex != -1 && e.RowIndex != -1) {
        DataGridViewCell cell = this[e.ColumnIndex, e.RowIndex];
        if (!cell.Selected) {
          ClearSelection();
          CurrentCell = cell;
          cell.Selected = true;
        }
      }
    }

    #endregion Event handlers

    protected override bool ProcessCmdKey(ref Message msg, Keys keyData) {
      if (keyData == Keys.Up) {
        GoUp();
        return true;
      }
      if (keyData == Keys.Down) {
        GoDown();
        return true;
      }
      if (keyData == Keys.Home) {
        GoHome();
        return true;
      }
      if (keyData == Keys.End) {
        GoEnd();
        return true;
      }
      if (keyData == Keys.Apps || keyData == (Keys.Shift | Keys.F10)) {
        // If a row is currently selected, show the cell context menu.
        if (cellContextMenuStrip_ != null && SelectedRows.Count == 1) {
          Rectangle displayRect = GetCellDisplayRectangle(0, SelectedRows[0].Index,
                                                          cutOverflow: false);
          Point point = new Point() {
            X = displayRect.X + displayRect.Width / 4,
            Y = displayRect.Y + displayRect.Height / 2
          };
          cellContextMenuStrip_.Show(this, point);
          return true;
        }
      }
      return base.ProcessCmdKey(ref msg, keyData);
    }

    protected void SetCellContextMenu(ContextMenuStrip contextMenuStrip) {
      cellContextMenuStrip_ = contextMenuStrip;
    }

    public void TryAddArgument(CommandLineArg argument) {
      if (!commandLineArgs_.Contains(argument)) {
        commandLineArgs_.Add(argument);
      }
    }

    public void RemoveSelected() {
        commandLineArgs_.RemoveAt(SelectedCells[0].RowIndex);
    }

    private void SetCommandLineArgList(List<string> arguments) {
      commandLineArgs_.Clear();
      foreach (string arg in arguments) {
        commandLineArgs_.Add(new CommandLineArg(arg));
      }
    }

    public List<CommandLineArg> WatchedArguments {
      get {
        return new List<CommandLineArg>(commandLineArgs_);
      }
      set {
        commandLineArgs_ = new BindingList<CommandLineArg>(value);
      }
    }

    private ContextMenuStrip cellContextMenuStrip_;
    private BindingList<CommandLineArg> commandLineArgs_;
    private DataGridViewTextBoxColumn argumentColumn_;
  }
}
