// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Forms;
using EdgeProcessViewer.Controls;

namespace EdgeProcessViewer {
  public partial class EditCommandLineArgWatcherDialog : Form, INotifyPropertyChanged {
    public EditCommandLineArgWatcherDialog() {
      InitializeComponent();
    }

    public event PropertyChangedEventHandler PropertyChanged;

    private void NotifyPropertyChanged([CallerMemberName] String propertyName = "") {
      if (PropertyChanged != null) {
        PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
      }
    }

    private void removeButton_Click(object sender, EventArgs e) {
      this.commandLineArgsGridView.RemoveSelected();
    }

    private void addArgumentButton_Click(object sender, EventArgs e) {
      if (!String.IsNullOrWhiteSpace(this.addArgumentTextbox.Text)) {
        this.commandLineArgsGridView.TryAddArgument(new CommandLineArg(this.addArgumentTextbox.Text));
        this.addArgumentTextbox.Clear();
      }
    }

    private void okButton_Click(object sender, EventArgs e) {
      commandLineArgs_ = this.commandLineArgsGridView.WatchedArguments;
      DialogResult = DialogResult.OK;
    }

    public List<CommandLineArg> WatchedArguments {
      get {
        return commandLineArgs_;
      }

      set {
        commandLineArgs_ = value;
        foreach (CommandLineArg argument in commandLineArgs_) {
          this.commandLineArgsGridView.TryAddArgument(argument);
        }
      }
    }

    public List<CommandLineArg> commandLineArgs_;

  }
}
