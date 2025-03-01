// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Windows.Forms;
using static EdgeProcessViewer.NativeMethods;

namespace EdgeProcessViewer
{
  class EdgeSessionTypeControl : System.Windows.Forms.ToolStripMenuItem {
    public EdgeSessionTypeControl() {
      new System.Windows.Forms.ToolStripMenuItem();
      this.showCanaryChannelMenuItem = new System.Windows.Forms.ToolStripMenuItem();
      this.showBetaChannelMenuItem = new System.Windows.Forms.ToolStripMenuItem();
      this.showDeveloperChannelMenuItem = new System.Windows.Forms.ToolStripMenuItem();
      this.showStableChannelMenuItem = new System.Windows.Forms.ToolStripMenuItem();
      this.showLocalBuildMenuItem = new System.Windows.Forms.ToolStripMenuItem();
      this.showIEProcessMenuItem = new System.Windows.Forms.ToolStripMenuItem();
      this.showWebviewProcessMenuItem = new System.Windows.Forms.ToolStripMenuItem();
    }

    public event EventHandler<NativeMethods.SessionType> SessionFilterChanged;

    public void OnUpdateSessionFilter(bool enable, SessionType filter) {
      if (enable) {
        SessionFilter = SessionFilter | filter;
      } else {
        SessionFilter = SessionFilter & ~filter;
      }
    }

    public SessionType SessionFilter {
      get {
        return sessionFilter_;
      }
      set {
        SessionType old_filter = sessionFilter_;
        sessionFilter_ = value;
        if (sessionFilter_ != old_filter) {
          SessionFilterChanged?.Invoke(this, sessionFilter_);
        }
      }
    }

    private SessionType sessionFilter_;

    public void InitializeComponent() {
      // processToolStripMenuItem
      this.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
        this.showCanaryChannelMenuItem,
        this.showDeveloperChannelMenuItem,
        this.showBetaChannelMenuItem,
        this.showStableChannelMenuItem,
        this.showLocalBuildMenuItem,
        this.showIEProcessMenuItem,
        this.showWebviewProcessMenuItem});
      this.Name = "edgeSessionTypesToolStripMenuItem";
      this.Size = new System.Drawing.Size(54, 20);
      this.Text = "&Edge Session Types";
      this.DropDownOpening += new System.EventHandler(this.edgeSessionTypesToolStripMenuItem_DropDownOpening);

      // showCanaryChannelMenuItem
      this.showCanaryChannelMenuItem.CheckOnClick = true;
      this.showCanaryChannelMenuItem.Name = "showCanaryChannelMenuItem";
      this.showCanaryChannelMenuItem.Size = new System.Drawing.Size(149, 22);
      this.showCanaryChannelMenuItem.Text = "&Canary Channel Processes";
      this.showCanaryChannelMenuItem.Click += new System.EventHandler(this.showCanaryChannelMenuItem_Click);

      // showDeveloperChannelMenuItem
      this.showDeveloperChannelMenuItem.CheckOnClick = true;
      this.showDeveloperChannelMenuItem.Name = "showDeveloperChannelMenuItem";
      this.showDeveloperChannelMenuItem.Size = new System.Drawing.Size(149, 22);
      this.showDeveloperChannelMenuItem.Text = "&Developer Channel Processes";
      this.showDeveloperChannelMenuItem.Click += new System.EventHandler(this.showDeveloperChannelMenuItem_Click);

      // showBetaChannelMenuItem
      this.showBetaChannelMenuItem.CheckOnClick = true;
      this.showBetaChannelMenuItem.Name = "showBetaChannelMenuItem";
      this.showBetaChannelMenuItem.Size = new System.Drawing.Size(149, 22);
      this.showBetaChannelMenuItem.Text = "&Beta Channel Processes";
      this.showBetaChannelMenuItem.Click += new System.EventHandler(this.showBetaChannelMenuItem_Click);

      // showStableChannelMenuItem
      this.showStableChannelMenuItem.CheckOnClick = true;
      this.showStableChannelMenuItem.Name = "showStableChannelMenuItem";
      this.showStableChannelMenuItem.Size = new System.Drawing.Size(149, 22);
      this.showStableChannelMenuItem.Text = "&Stable Channel Processes";
      this.showStableChannelMenuItem.Click += new System.EventHandler(this.showStableChannelMenuItem_Click);

      // showLocalBuildMenuItem
      this.showLocalBuildMenuItem.CheckOnClick = true;
      this.showLocalBuildMenuItem.Name = "showLocalBuildMenuItem";
      this.showLocalBuildMenuItem.Size = new System.Drawing.Size(149, 22);
      this.showLocalBuildMenuItem.Text = "&Local Build Processes";
      this.showLocalBuildMenuItem.Click += new System.EventHandler(this.showLocalBuildMenuItem_Click);

      // showIEProcessMenuItem
      this.showIEProcessMenuItem.CheckOnClick = true;
      this.showIEProcessMenuItem.Name = "showIEProcessMenuItem";
      this.showIEProcessMenuItem.Size = new System.Drawing.Size(149, 22);
      this.showIEProcessMenuItem.Text = "&IE Processes";
      this.showIEProcessMenuItem.Click += new System.EventHandler(this.showIEProcessMenuItem_Click);

      // showWebviewProcessMenuItem
      this.showWebviewProcessMenuItem.CheckOnClick = true;
      this.showWebviewProcessMenuItem.Name = "showWebviewProcessMenuItem";
      this.showWebviewProcessMenuItem.Size = new System.Drawing.Size(149, 22);
      this.showWebviewProcessMenuItem.Text = "&Webview Processes";
      this.showWebviewProcessMenuItem.Click += new System.EventHandler(this.showWebviewProcessMenuItem_Click);
    }

    private void edgeSessionTypesToolStripMenuItem_DropDownOpening(object sender, EventArgs e) {
      this.showCanaryChannelMenuItem.Checked = SessionFilter.HasFlag(NativeMethods.SessionType.CanaryChannel);
      this.showDeveloperChannelMenuItem.Checked = SessionFilter.HasFlag(NativeMethods.SessionType.DeveloperChannel);
      this.showBetaChannelMenuItem.Checked = SessionFilter.HasFlag(NativeMethods.SessionType.BetaChannel);
      this.showStableChannelMenuItem.Checked = SessionFilter.HasFlag(NativeMethods.SessionType.StableChannel);
      this.showLocalBuildMenuItem.Checked = SessionFilter.HasFlag(NativeMethods.SessionType.LocalBuild);
      this.showIEProcessMenuItem.Checked = SessionFilter.HasFlag(NativeMethods.SessionType.IEProcess);
      this.showWebviewProcessMenuItem.Checked = SessionFilter.HasFlag(NativeMethods.SessionType.Webview);
    }

    private void showCanaryChannelMenuItem_Click(object sender, EventArgs e) {
      OnUpdateSessionFilter(this.showCanaryChannelMenuItem.Checked, NativeMethods.SessionType.CanaryChannel);
    }

    private void showDeveloperChannelMenuItem_Click(object sender, EventArgs e) {
      OnUpdateSessionFilter(this.showDeveloperChannelMenuItem.Checked, NativeMethods.SessionType.DeveloperChannel);
    }

    private void showBetaChannelMenuItem_Click(object sender, EventArgs e) {
      OnUpdateSessionFilter(this.showBetaChannelMenuItem.Checked, NativeMethods.SessionType.BetaChannel);
    }

    private void showStableChannelMenuItem_Click(object sender, EventArgs e) {
      OnUpdateSessionFilter(this.showStableChannelMenuItem.Checked, NativeMethods.SessionType.StableChannel);
    }

    private void showLocalBuildMenuItem_Click(object sender, EventArgs e) {
      OnUpdateSessionFilter(this.showLocalBuildMenuItem.Checked, NativeMethods.SessionType.LocalBuild);
    }

    private void showIEProcessMenuItem_Click(object sender, EventArgs e) {
      OnUpdateSessionFilter(this.showIEProcessMenuItem.Checked, NativeMethods.SessionType.IEProcess);
    }

    private void showWebviewProcessMenuItem_Click(object sender, EventArgs e) {
      OnUpdateSessionFilter(this.showWebviewProcessMenuItem.Checked, NativeMethods.SessionType.Webview);
    }

    private System.Windows.Forms.ToolStripMenuItem showWebviewProcessMenuItem;
    private System.Windows.Forms.ToolStripMenuItem showCanaryChannelMenuItem;
    private System.Windows.Forms.ToolStripMenuItem showDeveloperChannelMenuItem;
    private System.Windows.Forms.ToolStripMenuItem showBetaChannelMenuItem;
    private System.Windows.Forms.ToolStripMenuItem showStableChannelMenuItem;
    private System.Windows.Forms.ToolStripMenuItem showLocalBuildMenuItem;
    private System.Windows.Forms.ToolStripMenuItem showIEProcessMenuItem;
  }
}