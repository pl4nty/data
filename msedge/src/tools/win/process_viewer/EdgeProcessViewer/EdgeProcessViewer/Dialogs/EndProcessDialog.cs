// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Drawing;
using System.Windows.Forms;

namespace EdgeProcessViewer {
  public partial class EndProcessDialog : Form {
    public EndProcessDialog(string type, string id) {
      InitializeComponent();
      headingLabel.ForeColor = Color.FromArgb(0x00, 0x30, 0x9C);
      headingLabel.MaximumSize = new Size(Size.Width - (headingLabel.Left * 2), Size.Height);
      headingLabel.Text = $"Do you want to terminate {type} process {id}?";
      endProcessButton.Focus();
    }

    private void endProcessButton_Click(object sender, EventArgs e) {
      DialogResult = DialogResult.OK;
    }
  }
}
