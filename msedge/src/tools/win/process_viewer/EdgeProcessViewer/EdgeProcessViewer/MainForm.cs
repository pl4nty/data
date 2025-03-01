// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace EdgeProcessViewer {
  public partial class MainForm : Form {
    public MainForm() {
      InitializeComponent();

      if (!Utility.IsElevated) {
        Bitmap shieldIcon = GetElevationShieldIcon();
        if (shieldIcon != null) {
          enablePostmortemDebuggerToolStripMenuItem.Image = shieldIcon;
        }
      }

      viewModel_ = new MainFormViewModel(Handle);
      viewModel_.SelectedTaskReset += OnSelectedTaskReset;
      viewModel_.MainFormViewModelError += OnViewModelError;
      viewModel_.RequestEndProcess += OnRequestEndProcess;
      viewModel_.RequestSetDebuggerPath += OnRequestSetDebuggerPath;
      viewModel_.RequestLaunchEdge += OnRequestLaunchEdge;

      edgeGridView.DataSource = new BindingSource(viewModel_.EdgeTasks, "");
      edgeGridView.DebugInvoked += OnDebugInvoked;
      edgeGridView.EndProcessInvoked += OnEndProcessInvoked;
      edgeGridView.OpenFileLocationInvoked += OnOpenFileLocationInvoked;

      edgeSessionTypeControl.SessionFilterChanged += viewModel_.OnSessionFilterChanged;
      edgeCommandLineWatcher.WatchedArgumentsChanged += OnWatchedArgumentsChanged;
      edgeCommandLineWatcher.ShowArgumentInTableChanged += OnShowArgumentInTableChanged;
    }

    protected override bool ProcessCmdKey(ref Message msg, Keys keyData) {
      switch (keyData) {
        case Keys.Escape:
          Close();
          return true;
        case Keys.Delete:
          DoActionOnSelectedTask(viewModel_.OnEndProcess);
          return true;
        case Keys.Up:
          edgeGridView.GoUp();
          return true;
        case Keys.Down:
          edgeGridView.GoDown();
          return true;
        case Keys.Home:
          edgeGridView.GoHome();
          return true;
        case Keys.End:
          edgeGridView.GoEnd();
          return true;
        default:
          return base.ProcessCmdKey(ref msg, keyData);
      }
    }

    #region Event handlers

    private void OnShowArgumentInTableChanged(object sender, bool showArgument) {
      viewModel_.OnShowArgumentInTableChanged(sender, showArgument);
      edgeGridView.OnShowArgumentsInTable(sender, showArgument);
    }

    private void OnWatchedArgumentsChanged(object sender, WatchedArgumentsChangedEventArgs args) {
      edgeGridView.OnWatchedArgumentsChanged(sender, args);
    }

    private void MainForm_Load(object sender, EventArgs e) {
      LoadSettings();
      viewModel_.OnFormLoaded();
    }

    private void MainForm_FormClosing(object sender, FormClosingEventArgs e) {
      viewModel_.OnFormClosing();
      SaveSettings();
    }

    private void edgeGridView_SelectionChanged(object sender, EventArgs e) {
      Task selectedTask = edgeGridView.GetSelectedTask();
      bool enableButtons = (selectedTask != null);
      endProcessButton.Enabled = enableButtons;
      debugButton.Enabled = enableButtons;
    }

    private void alwaysOnTopToolStripMenuItem_Click(object sender, EventArgs e) {
      TopMost = alwaysOnTopToolStripMenuItem.Checked;
    }

    private void debugToolStripMenuItem_DropDownOpening(object sender, EventArgs e) {
      enablePostmortemDebuggerToolStripMenuItem.Checked = viewModel_.IsPostmortemDebuggerEnabled();
      enableOnLaunchDebuggerToolStripMenuItem.Checked = viewModel_.IsOnLaunchDebuggerEnabled;
    }

    private void setDebuggerPathToolStripMenuItem_Click(object sender, EventArgs e) {
      viewModel_.OnSetDebuggerPath();
    }

    private void enablePostmortemDebuggerToolStripMenuItem_Click(object sender, EventArgs e) {
      bool enable = !enablePostmortemDebuggerToolStripMenuItem.Checked;
      viewModel_.OnEnablePostmortemDebugger(enable);
    }

    private void enableOnLaunchDebuggerToolStripMenuItem_Click(object sender, EventArgs e)
    {
      bool enable = !enableOnLaunchDebuggerToolStripMenuItem.Checked;
      viewModel_.OnEnableOnLaunchDebugger(enable);
    }

    private void launchEdgeToolStripMenuItem_Click(object sender, EventArgs e) {
        viewModel_.OnLaunchEdge();
    }

    private void OnDebugInvoked(object sender, EventArgs e) {
      DoActionOnSelectedTask(viewModel_.OnDebug);
    }

    private void OnEndProcessInvoked(object sender, EventArgs e) {
      DoActionOnSelectedTask(viewModel_.OnEndProcess);
    }

    private void OnOpenFileLocationInvoked(object sender, EventArgs e) {
      DoActionOnSelectedTask(viewModel_.OnOpenFileLocation);
    }

    private void OnSelectedTaskReset(object sender, EventArgs e) {
      edgeGridView.ClearSelection();
    }

    private void OnViewModelError(object sender, MainFormViewModelErrorEventArgs e) {
      MessageBox.Show(e.ErrorMessage, Text, MessageBoxButtons.OK);
    }

    private void OnRequestEndProcess(object sender, RequestEndProcessEventArgs e) {
      using (EndProcessDialog dialog = new EndProcessDialog(e.ProcessType, e.ProcessId)) {
        dialog.TopMost = TopMost;
        if (dialog.ShowDialog() != DialogResult.OK) {
          e.Cancel = true;
        }
      }
    }

    private void OnRequestSetDebuggerPath(object sender, RequestSetDebuggerPathEventArgs e) {
      using (SetDebuggerDialog dialog = new SetDebuggerDialog()) {
        dialog.Path = e.DebuggerPath;
        dialog.OnLaunchPath = e.OnLaunchDebuggerPath;
        dialog.OnLaunchArguments = e.OnLaunchDebuggerArguments;
        dialog.TopMost = TopMost;
        if (dialog.ShowDialog() == DialogResult.OK) {
          e.DebuggerPath = dialog.Path;
          e.OnLaunchDebuggerPath = dialog.OnLaunchPath;
          e.OnLaunchDebuggerArguments = dialog.OnLaunchArguments;
        } else {
          e.Cancel = true;
        }
      }
    }

    private void OnRequestLaunchEdge(object sender, RequestLaunchEdgeEventArgs e)
    {
      using (LaunchEdgeDialog dialog = new LaunchEdgeDialog())
      {
        dialog.EdgePath = e.EdgePath;
        dialog.EdgeArguments = e.EdgeArguments;
        dialog.TopMost = TopMost;
        if (dialog.ShowDialog() == DialogResult.OK)
        {
          e.EdgePath = dialog.EdgePath;
          e.EdgeArguments = dialog.EdgeArguments;
        }
        else
        {
          e.Cancel = true;
        }
      }
    }
      #endregion Event handlers

    private void LoadSettings() {
      Location = Properties.Settings.Default.WindowLocation;
      Size = Properties.Settings.Default.WindowSize;

      PreventOffscreenWindow();

      if (Properties.Settings.Default.WindowState != FormWindowState.Minimized) {
        WindowState = Properties.Settings.Default.WindowState;
      }

      TopMost = Properties.Settings.Default.TopMost;
      alwaysOnTopToolStripMenuItem.Checked = TopMost;
      edgeSessionTypeControl.SessionFilter = (NativeMethods.SessionType)Properties.Settings.Default.EdgeSessionFilter;
    }

    private void SaveSettings() {
      if (WindowState == FormWindowState.Normal) {
        Properties.Settings.Default.WindowLocation = Location;
        Properties.Settings.Default.WindowSize = Size;
      } else {
        Properties.Settings.Default.WindowLocation = RestoreBounds.Location;
        Properties.Settings.Default.WindowSize = RestoreBounds.Size;
      }

      if (WindowState != FormWindowState.Minimized) {
        Properties.Settings.Default.WindowState = WindowState;
      }

      Properties.Settings.Default.TopMost = TopMost;
      Properties.Settings.Default.EdgeSessionFilter = (uint)edgeSessionTypeControl.SessionFilter;

      edgeGridView.SaveSettings();
      Properties.Settings.Default.Save();
    }

    private void PreventOffscreenWindow() {
      // Make sure the window is not completely off screen: if the top-left point is not on screen,
      // reset to default location.
      foreach (Screen screen in Screen.AllScreens) {
        if (screen.Bounds.Contains(Location)) {
          return;
        }
      }
      Location = new Point(50, 25);
    }

    private void DoActionOnSelectedTask(Action<Task> action) {
      Task task = edgeGridView.GetSelectedTask();
      if (task != null) {
        action(task);
      }
    }

    private Bitmap GetElevationShieldIcon() {
      NativeMethods.SHSTOCKICONINFO iconInfo = new NativeMethods.SHSTOCKICONINFO();
      iconInfo.cbSize = Marshal.SizeOf(iconInfo);
      NativeMethods.SHGSI flags =
          NativeMethods.SHGSI.SHGSI_ICON | NativeMethods.SHGSI.SHGSI_SMALLICON;
      int hr = NativeMethods.SHGetStockIconInfo(NativeMethods.SHSTOCKICONID.SIID_SHIELD, flags,
                                                ref iconInfo);
      if (hr != NativeMethods.S_OK) {
        return null;
      }

      try {
        return Icon.FromHandle(iconInfo.hIcon).ToBitmap();
      } finally {
        NativeMethods.DestroyIcon(iconInfo.hIcon);
      }
    }

    private MainFormViewModel viewModel_;

  }
}
