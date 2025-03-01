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
  public abstract class TaskGridView : DataGridView {
    public TaskGridView() {
      AllowUserToAddRows = false;
      AllowUserToDeleteRows = false;
      AllowUserToResizeRows = false;
      AllowUserToOrderColumns = true;
      AutoGenerateColumns = false;
      BackgroundColor = SystemColors.Window;
      BorderStyle = BorderStyle.None;
      CellBorderStyle = DataGridViewCellBorderStyle.None;
      ColumnHeadersBorderStyle = DataGridViewHeaderBorderStyle.None;
      ColumnHeadersHeight = 25;
      ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
      ColumnHeadersDefaultCellStyle.WrapMode = DataGridViewTriState.False;
      DoubleBuffered = true;
      EditMode = DataGridViewEditMode.EditProgrammatically;
      MultiSelect = false;
      ReadOnly = true;
      RowHeadersVisible = false;
      SelectionMode = DataGridViewSelectionMode.FullRowSelect;
      ShowCellToolTips = false;
      StandardTab = true;

      CellContextMenuStripNeeded += OnCellContextMenuStripNeeded;
      CellMouseDown += OnCellMouseDown;
      ColumnHeaderMouseClick += OnColumnHeaderMouseClick;
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
    public abstract void SaveSettings();

    #endregion Public methods

    #region Event handlers

    protected virtual void OnDataSourceChanged(object sender, EventArgs e) {
      SetupColumns();

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

    protected virtual void OnColumnHeaderMouseClick(object sender,
                                                    DataGridViewCellMouseEventArgs e) {
      // Show the header context menu when the "..." header is left-clicked.
      if (e.Button == MouseButtons.Left && Columns[e.ColumnIndex].Name == MoreColumnsName) {
        Rectangle displayRect = GetCellDisplayRectangle(e.ColumnIndex, e.RowIndex,
                                                        cutOverflow: false);
        Point location = displayRect.Location;
        location.Offset(0, displayRect.Height);
        headerContextMenuStrip_.Show(this, location);
      }
    }

    private void headerContextMenuStrip_Opening(object sender, CancelEventArgs e) {
      // Set the checked state of each menu item based on the corresponding column's visibility.
      foreach (ToolStripItem item in headerContextMenuStrip_.Items) {
        if (item.Name != String.Empty) {
          ToolStripMenuItem menuItem = (ToolStripMenuItem)item;
          menuItem.Checked = Columns[item.Name].Visible;
        }
      }
    }

    protected abstract void RemoveColumn(DataGridViewColumn column);

    private void headerContextMenuStrip_ItemClicked(object sender,
                                                    ToolStripItemClickedEventArgs e) {
      if (e.ClickedItem.Text == ResetColumnsText) {
        ResetColumns();
      } else {
        // Toggle the visibility of the chosen column.
        DataGridViewColumn column = Columns[e.ClickedItem.Name];
        if (column.Name.Contains(CommandLineArg.WATCHED_ARG_PREFIX)) {
          RemoveColumn(column);
          headerContextMenuStrip_.Items.Remove(e.ClickedItem);
          resetIndex_--;
        } else {
          column.Visible = !column.Visible;
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

    protected void AddColumn(string name, string label) {
      // Add column to the DataGridView.
      ColumnSetting columnSetting = GetStoredColumnSetting(name, label);
      string columnName = columnSetting.Name;
      string columnLabel = columnSetting.Label;
      int columnIndex = Columns.Add(columnName, columnLabel);
      Columns[columnIndex].DataPropertyName = columnName;
      Columns[columnIndex].Width = columnSetting.Width;
      Columns[columnIndex].Visible = columnSetting.Visible;
      Columns[columnIndex].HeaderCell.ContextMenuStrip = headerContextMenuStrip_;

      AddHeaderContextMenuStripItem(name, label);
    }

    protected void AddHeaderContextMenuStripItem(string name, string label) {
      // Add column visibility toggle to the header context menu.
      var menuItem = new ToolStripMenuItem() {
        Name = name,
        Text = label
      };

      // This logic will keep the reset item as the last item.
      if (resetIndex_ > 0) {
        headerContextMenuStrip_.Items.Insert(resetIndex_, menuItem);
        resetIndex_++;
      } else {
        headerContextMenuStrip_.Items.Add(menuItem);
      }
    }
     
    // Adds the columns to the DataGridView and binds them to the data source, and creates the
    // column header context menu.
    protected virtual void SetupColumns() {
      Columns.Clear();
      headerContextMenuStrip_ = new ContextMenuStrip();

      foreach (var columnDefinition in ColumnDefinitions) {
        AddColumn(columnDefinition.Name, columnDefinition.Label);
      }

      int moreColumnIndex = Columns.Add(MoreColumnsName, "...");
      Columns[moreColumnIndex].Width = 25;

      headerContextMenuStrip_.Items.Add("-");
      resetIndex_ = headerContextMenuStrip_.Items.Count - 1;
      headerContextMenuStrip_.Items.Add(ResetColumnsText);
      headerContextMenuStrip_.Opening += headerContextMenuStrip_Opening;
      headerContextMenuStrip_.ItemClicked += headerContextMenuStrip_ItemClicked;
    }

    public ColumnSetting GetStoredColumnSetting(string name, string label) {
      if (StoredColumnSettings != null) {
        foreach (var columnSetting in StoredColumnSettings) {
          if (columnSetting.Label == label && columnSetting.Name == name) {
            return columnSetting;
          }
        }
      }
      return GetDefaultColumnSetting(name, label);
    }

    // Gets the default settings for a column if it's not in the |ColumnSettings|.
    protected abstract ColumnSetting GetDefaultColumnSetting(string name, string label);

    // Resets all columns to their default settings.
    protected virtual void ResetColumns() {
      StoredColumnSettings = null;
      SetupColumns();
    }

    // Gets the current column settings from the DataGridView.
    protected ColumnSettingList GetCurrentColumnSettings() {
      var columnSettings = new ColumnSettingList();
      DataGridViewColumn column = Columns.GetFirstColumn(DataGridViewElementStates.None);
      while (column != null) {
        var columnSetting = new ColumnSetting(column.Name, column.HeaderText, column.Width, column.Visible);
        columnSettings.Add(columnSetting);
        column = Columns.GetNextColumn(column, DataGridViewElementStates.None,
                                       DataGridViewElementStates.None);
      }
      return columnSettings;
    }

    // List of column definitions in display order.
    protected List<ColumnDefinition> ColumnDefinitions { get; set; }

    // Column settings to use when adding columns to the DataGridView.
    protected ColumnSettingList StoredColumnSettings { get; set; }

    private const string MoreColumnsName = "MoreColumns";
    private const string ResetColumnsText = "Reset columns";
    private int resetIndex_ = 0;

    private ContextMenuStrip headerContextMenuStrip_;
    private ContextMenuStrip cellContextMenuStrip_;
  }
}
