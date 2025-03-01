// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Forms;

namespace EdgeProcessViewer {
  public partial class SetDebuggerDialog : Form, INotifyPropertyChanged {
    public SetDebuggerDialog() {
      InitializeComponent();
      commandLineTextBox.DataBindings.Add("Text", this, "Path", false, DataSourceUpdateMode.OnPropertyChanged);
      onLaunchDebuggerPathTextBox.DataBindings.Add("Text", this, "OnLaunchPath", false, DataSourceUpdateMode.OnPropertyChanged);
      onLaunchDebuggerArgumentsTextBox.DataBindings.Add("Text", this, "OnLaunchArguments", false, DataSourceUpdateMode.OnPropertyChanged);
      commandLineTextBox.Focus();
    }

    public string Path {
      get { return path_; }
      set {
        path_ = value;
        NotifyPropertyChanged();
      }
    }

    public string OnLaunchPath {
      get { return onLaunchPath_; }
      set {
        onLaunchPath_ = value;
        NotifyPropertyChanged();
      }
    }

    public string OnLaunchArguments {
      get { return onLaunchArgs_; }
      set {
        onLaunchArgs_ = value;
        NotifyPropertyChanged();
      }
    }

    public event PropertyChangedEventHandler PropertyChanged;

    private void NotifyPropertyChanged([CallerMemberName] String propertyName = "") {
      if (PropertyChanged != null) {
        PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
      }
    }

    private void okButton_Click(object sender, EventArgs e) {
      try {
        // Try to validate the OnLaunchArguments to ensure the template parameters are being 
        // used correctly so we don't fail later when we try yo use them
        String.Format(OnLaunchArguments, 0);
        DialogResult = DialogResult.OK;

      } catch (Exception ex) {
        MessageBox.Show("On launch debugger arguments are incorrectly formatted:\n" +
                            ex.Message, Text, MessageBoxButtons.OK);
      }
    }

    private void browseButton_Click(object sender, EventArgs e) {
      using (var openFileDialog = new OpenFileDialog()) {
        openFileDialog.InitialDirectory = Environment.ExpandEnvironmentVariables("%systemdrive%");
        openFileDialog.Filter = "Programs (*.exe;*.pif;*.com;*.bat;*.cmd)|" +
                                "*.exe;*.pif;*.com;*.bat;*.cmd|All files (*.*)|*.*";
        openFileDialog.FilterIndex = 1;
        openFileDialog.Title = "Browse";
        if (openFileDialog.ShowDialog() == DialogResult.OK) {
          Path = openFileDialog.FileName;
        }
      }
    }
    private void onLaunchDebuggerPathBrowserBtn_Click(object sender, EventArgs e) {
      using (var openFileDialog = new OpenFileDialog()) {
        openFileDialog.InitialDirectory = Environment.ExpandEnvironmentVariables("%systemdrive%");
        openFileDialog.Filter = "Programs (*.exe;*.pif;*.com;*.bat;*.cmd)|" +
                                "*.exe;*.pif;*.com;*.bat;*.cmd|All files (*.*)|*.*";
        openFileDialog.FilterIndex = 1;
        openFileDialog.Title = "Browse";
        if (openFileDialog.ShowDialog() == DialogResult.OK) {
          OnLaunchPath = openFileDialog.FileName;
        }
      }
    }

    private string path_;
    private string onLaunchPath_;
    private string onLaunchArgs_;

  }
}
