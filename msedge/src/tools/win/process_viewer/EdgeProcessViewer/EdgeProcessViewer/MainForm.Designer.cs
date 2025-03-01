
using EdgeProcessViewer.Controls;
using System.Windows.Forms;

namespace EdgeProcessViewer
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
      System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
      System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
      this.menuStrip = new System.Windows.Forms.MenuStrip();
      this.viewToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
      this.alwaysOnTopToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
      this.debugToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
      this.setDebuggerPathToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
      this.enablePostmortemDebuggerToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
      this.enableOnLaunchDebuggerToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
      this.launchEdgeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
      this.edgeSessionTypeControl = new EdgeSessionTypeControl();
      this.edgeCommandLineWatcher = new EdgeCommandLineWatcher();
      this.edgeGridViewPanel = new System.Windows.Forms.Panel();
      this.edgeGridView = new EdgeProcessViewer.Controls.EdgeGridView();
      this.dividerPanel = new System.Windows.Forms.Panel();
      this.buttonPanel = new System.Windows.Forms.Panel();
      this.debugButton = new System.Windows.Forms.Button();
      this.endProcessButton = new System.Windows.Forms.Button();
      this.menuStrip.SuspendLayout();
      this.edgeGridViewPanel.SuspendLayout();
      ((System.ComponentModel.ISupportInitialize)(this.edgeGridView)).BeginInit();
      this.buttonPanel.SuspendLayout();
      this.SuspendLayout();

      // EdgeGridView will load the Saved Columns which will include the watched args from the previous session
      this.edgeCommandLineWatcher.WatchedArgs = this.edgeGridView.WatchedArgs;
      // 
      // menuStrip
      // 
      this.menuStrip.GripMargin = new System.Windows.Forms.Padding(2, 2, 0, 2);
      this.menuStrip.ImageScalingSize = new System.Drawing.Size(24, 24);
      this.menuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.viewToolStripMenuItem,
            this.debugToolStripMenuItem,
            this.edgeSessionTypeControl,
            this.edgeCommandLineWatcher});
      this.menuStrip.Location = new System.Drawing.Point(0, 0);
      this.menuStrip.Name = "menuStrip";
      this.menuStrip.Size = new System.Drawing.Size(984, 33);
      this.menuStrip.TabIndex = 1;
      this.menuStrip.Text = "menuStrip";
      // 
      // viewToolStripMenuItem
      // 
      this.viewToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.alwaysOnTopToolStripMenuItem});
      this.viewToolStripMenuItem.Name = "viewToolStripMenuItem";
      this.viewToolStripMenuItem.Size = new System.Drawing.Size(65, 29);
      this.viewToolStripMenuItem.Text = "&View";
      // 
      // alwaysOnTopToolStripMenuItem
      // 
      this.alwaysOnTopToolStripMenuItem.CheckOnClick = true;
      this.alwaysOnTopToolStripMenuItem.Name = "alwaysOnTopToolStripMenuItem";
      this.alwaysOnTopToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
      this.alwaysOnTopToolStripMenuItem.Text = "&Always on top";
      this.alwaysOnTopToolStripMenuItem.Click += new System.EventHandler(this.alwaysOnTopToolStripMenuItem_Click);

      // 
      // debugToolStripMenuItem
      // 
      this.debugToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.setDebuggerPathToolStripMenuItem,
            this.enablePostmortemDebuggerToolStripMenuItem,
            this.enableOnLaunchDebuggerToolStripMenuItem,
            this.launchEdgeToolStripMenuItem});
      this.debugToolStripMenuItem.Name = "debugToolStripMenuItem";
      this.debugToolStripMenuItem.Size = new System.Drawing.Size(54, 20);
      this.debugToolStripMenuItem.Text = "&Debug";
      this.debugToolStripMenuItem.DropDownOpening += new System.EventHandler(this.debugToolStripMenuItem_DropDownOpening);
      // 
      // setDebuggerPathToolStripMenuItem
      // 
      this.setDebuggerPathToolStripMenuItem.Name = "setDebuggerPathToolStripMenuItem";
      this.setDebuggerPathToolStripMenuItem.Size = new System.Drawing.Size(354, 34);
      this.setDebuggerPathToolStripMenuItem.Text = "&Set debugger path";
      this.setDebuggerPathToolStripMenuItem.Click += new System.EventHandler(this.setDebuggerPathToolStripMenuItem_Click);
      // 
      // enablePostmortemDebuggerToolStripMenuItem
      // 
      this.enablePostmortemDebuggerToolStripMenuItem.Name = "enablePostmortemDebuggerToolStripMenuItem";
      this.enablePostmortemDebuggerToolStripMenuItem.Size = new System.Drawing.Size(354, 34);
      this.enablePostmortemDebuggerToolStripMenuItem.Text = "Enable &postmortem debugger";
      this.enablePostmortemDebuggerToolStripMenuItem.Click += new System.EventHandler(this.enablePostmortemDebuggerToolStripMenuItem_Click);
      // 
      // enableOnLaunchDebuggerToolStripMenuItem
      // 
      this.enableOnLaunchDebuggerToolStripMenuItem.Name = "enableOnLaunchDebuggerToolStripMenuItem";
      this.enableOnLaunchDebuggerToolStripMenuItem.Size = new System.Drawing.Size(354, 34);
      this.enableOnLaunchDebuggerToolStripMenuItem.Text = "Enable on launch debugger";
      this.enableOnLaunchDebuggerToolStripMenuItem.Click += new System.EventHandler(this.enableOnLaunchDebuggerToolStripMenuItem_Click);
      // 
      // launchEdgeToolStripMenuItem
      // 
      this.launchEdgeToolStripMenuItem.Name = "launchEdgeToolStripMenuItem";
      this.launchEdgeToolStripMenuItem.Size = new System.Drawing.Size(354, 34);
      this.launchEdgeToolStripMenuItem.Text = "Launch Edge";
      this.launchEdgeToolStripMenuItem.Click += new System.EventHandler(this.launchEdgeToolStripMenuItem_Click);
      // 
      // edgeSessionTypeControl
      // 
      this.edgeSessionTypeControl.InitializeComponent();
      // 
      // edgeCommandLineWatcher
      // 
      this.edgeCommandLineWatcher.InitializeComponent();
      // 
      // edgeGridViewPanel
      // 
      this.edgeGridViewPanel.Controls.Add(this.edgeGridView);
      this.edgeGridViewPanel.Controls.Add(this.dividerPanel);
      this.edgeGridViewPanel.Controls.Add(this.buttonPanel);
      this.edgeGridViewPanel.Dock = System.Windows.Forms.DockStyle.Fill;
      this.edgeGridViewPanel.Location = new System.Drawing.Point(0, 33);
      this.edgeGridViewPanel.Name = "edgeGridViewPanel";
      this.edgeGridViewPanel.Size = new System.Drawing.Size(984, 508);
      this.edgeGridViewPanel.TabIndex = 2;
      // 
      // edgeGridView
      // 
      this.edgeGridView.AllowUserToAddRows = false;
      this.edgeGridView.AllowUserToDeleteRows = false;
      this.edgeGridView.AllowUserToOrderColumns = true;
      this.edgeGridView.AllowUserToResizeRows = false;
      this.edgeGridView.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
      this.edgeGridView.BackgroundColor = System.Drawing.SystemColors.Window;
      this.edgeGridView.BorderStyle = System.Windows.Forms.BorderStyle.None;
      this.edgeGridView.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.None;
      this.edgeGridView.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
      dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
      dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
      dataGridViewCellStyle1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
      dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
      dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
      dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
      dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
      this.edgeGridView.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
      this.edgeGridView.ColumnHeadersHeight = 25;
      this.edgeGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
      this.edgeGridView.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
      this.edgeGridView.Location = new System.Drawing.Point(0, 0);
      this.edgeGridView.Margin = new System.Windows.Forms.Padding(0);
      this.edgeGridView.MultiSelect = false;
      this.edgeGridView.Name = "edgeGridView";
      this.edgeGridView.ReadOnly = true;
      this.edgeGridView.RowHeadersVisible = false;
      this.edgeGridView.RowHeadersWidth = 62;
      this.edgeGridView.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
      this.edgeGridView.ShowCellToolTips = false;
      this.edgeGridView.Size = new System.Drawing.Size(984, 470);
      this.edgeGridView.StandardTab = true;
      this.edgeGridView.TabIndex = 5;
      this.edgeGridView.SelectionChanged += new System.EventHandler(this.edgeGridView_SelectionChanged);
      // 
      // dividerPanel
      // 
      this.dividerPanel.BackColor = System.Drawing.SystemColors.ControlLight;
      this.dividerPanel.Dock = System.Windows.Forms.DockStyle.Bottom;
      this.dividerPanel.Location = new System.Drawing.Point(0, 472);
      this.dividerPanel.Margin = new System.Windows.Forms.Padding(0);
      this.dividerPanel.Name = "dividerPanel";
      this.dividerPanel.Size = new System.Drawing.Size(984, 1);
      this.dividerPanel.TabIndex = 4;
      // 
      // buttonPanel
      // 
      this.buttonPanel.Controls.Add(this.debugButton);
      this.buttonPanel.Controls.Add(this.endProcessButton);
      this.buttonPanel.Dock = System.Windows.Forms.DockStyle.Bottom;
      this.buttonPanel.Location = new System.Drawing.Point(0, 473);
      this.buttonPanel.Name = "buttonPanel";
      this.buttonPanel.Size = new System.Drawing.Size(984, 35);
      this.buttonPanel.TabIndex = 3;
      // 
      // debugButton
      // 
      this.debugButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
      this.debugButton.AutoSize = true;
      this.debugButton.Enabled = false;
      this.debugButton.Location = new System.Drawing.Point(766, 5);
      this.debugButton.Name = "debugButton";
      this.debugButton.Padding = new System.Windows.Forms.Padding(10, 0, 10, 0);
      this.debugButton.Size = new System.Drawing.Size(100, 35);
      this.debugButton.TabIndex = 1;
      this.debugButton.Text = "&Debug";
      this.debugButton.UseVisualStyleBackColor = true;
      this.debugButton.Click += new System.EventHandler(this.OnDebugInvoked);
      // 
      // endProcessButton
      // 
      this.endProcessButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
      this.endProcessButton.AutoSize = true;
      this.endProcessButton.Enabled = false;
      this.endProcessButton.Location = new System.Drawing.Point(854, 5);
      this.endProcessButton.Name = "endProcessButton";
      this.endProcessButton.Padding = new System.Windows.Forms.Padding(10, 0, 10, 0);
      this.endProcessButton.Size = new System.Drawing.Size(118, 35);
      this.endProcessButton.TabIndex = 0;
      this.endProcessButton.Text = "&Terminate";
      this.endProcessButton.UseVisualStyleBackColor = true;
      this.endProcessButton.Click += new System.EventHandler(this.OnEndProcessInvoked);
      // 
      // MainForm
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 25F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.BackColor = System.Drawing.SystemColors.Window;
      this.ClientSize = new System.Drawing.Size(984, 541);
      this.Controls.Add(this.edgeGridViewPanel);
      this.Controls.Add(this.menuStrip);
      this.DoubleBuffered = true;
      this.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
      this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
      this.KeyPreview = true;
      this.MainMenuStrip = this.menuStrip;
      this.Name = "MainForm";
      this.Text = "Edge Process Viewer";
      this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.MainForm_FormClosing);
      this.Load += new System.EventHandler(this.MainForm_Load);
      this.menuStrip.ResumeLayout(false);
      this.menuStrip.PerformLayout();
      this.edgeGridViewPanel.ResumeLayout(false);
      ((System.ComponentModel.ISupportInitialize)(this.edgeGridView)).EndInit();
      this.buttonPanel.ResumeLayout(false);
      this.buttonPanel.PerformLayout();
      this.ResumeLayout(false);
      this.PerformLayout();

    }

    #endregion

    private System.Windows.Forms.MenuStrip menuStrip;
    private System.Windows.Forms.Panel edgeGridViewPanel;
    private System.Windows.Forms.Panel buttonPanel;
    private System.Windows.Forms.Panel dividerPanel;
    private EdgeGridView edgeGridView;
    private System.Windows.Forms.Button debugButton;
    private System.Windows.Forms.Button endProcessButton;
    private System.Windows.Forms.ToolStripMenuItem viewToolStripMenuItem;
    private System.Windows.Forms.ToolStripMenuItem alwaysOnTopToolStripMenuItem;
    private System.Windows.Forms.ToolStripMenuItem debugToolStripMenuItem;
    private System.Windows.Forms.ToolStripMenuItem setDebuggerPathToolStripMenuItem;
    private System.Windows.Forms.ToolStripMenuItem enablePostmortemDebuggerToolStripMenuItem;
    private System.Windows.Forms.ToolStripMenuItem launchEdgeToolStripMenuItem;
    private System.Windows.Forms.ToolStripMenuItem enableOnLaunchDebuggerToolStripMenuItem;
    private EdgeSessionTypeControl edgeSessionTypeControl;
    private EdgeCommandLineWatcher edgeCommandLineWatcher;
  }
}

