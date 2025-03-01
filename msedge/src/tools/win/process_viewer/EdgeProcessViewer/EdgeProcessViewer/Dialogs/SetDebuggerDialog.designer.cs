namespace EdgeProcessViewer
{
    partial class SetDebuggerDialog
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
      System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SetDebuggerDialog));
      this.cancelButton = new System.Windows.Forms.Button();
      this.okButton = new System.Windows.Forms.Button();
      this.commandLineLabel = new System.Windows.Forms.Label();
      this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
      this.panel1 = new System.Windows.Forms.Panel();
      this.browseButton = new System.Windows.Forms.Button();
      this.commandLineTextBox = new System.Windows.Forms.TextBox();
      this.panel2 = new System.Windows.Forms.Panel();
      this.onLaunchDebuggerArgumentsTextBox = new System.Windows.Forms.TextBox();
      this.onLaunchDebuggerArgumentsLabel = new System.Windows.Forms.Label();
      this.onLaunchDebuggerPathLabel = new System.Windows.Forms.Label();
      this.onLaunchDebuggerPathTextBox = new System.Windows.Forms.TextBox();
      this.onLaunchDebuggerPathBrowserBtn = new System.Windows.Forms.Button();
      this.tableLayoutPanel1.SuspendLayout();
      this.panel1.SuspendLayout();
      this.panel2.SuspendLayout();
      this.SuspendLayout();
      // 
      // cancelButton
      // 
      this.cancelButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
      this.cancelButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
      this.cancelButton.Location = new System.Drawing.Point(431, 11);
      this.cancelButton.Name = "cancelButton";
      this.cancelButton.Size = new System.Drawing.Size(87, 27);
      this.cancelButton.TabIndex = 1;
      this.cancelButton.Text = "Cancel";
      this.cancelButton.UseVisualStyleBackColor = true;
      // 
      // okButton
      // 
      this.okButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
      this.okButton.Location = new System.Drawing.Point(338, 11);
      this.okButton.Name = "okButton";
      this.okButton.Size = new System.Drawing.Size(87, 27);
      this.okButton.TabIndex = 0;
      this.okButton.Text = "OK";
      this.okButton.UseVisualStyleBackColor = true;
      this.okButton.Click += new System.EventHandler(this.okButton_Click);
      // 
      // commandLineLabel
      // 
      this.commandLineLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
      this.commandLineLabel.AutoSize = true;
      this.commandLineLabel.Font = new System.Drawing.Font("Segoe UI", 9F);
      this.commandLineLabel.Location = new System.Drawing.Point(9, 12);
      this.commandLineLabel.Margin = new System.Windows.Forms.Padding(0);
      this.commandLineLabel.Name = "commandLineLabel";
      this.commandLineLabel.Size = new System.Drawing.Size(89, 15);
      this.commandLineLabel.TabIndex = 2;
      this.commandLineLabel.Text = "Debugger path:";
      // 
      // tableLayoutPanel1
      // 
      this.tableLayoutPanel1.AutoSize = true;
      this.tableLayoutPanel1.ColumnCount = 1;
      this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
      this.tableLayoutPanel1.Controls.Add(this.panel1, 0, 0);
      this.tableLayoutPanel1.Controls.Add(this.panel2, 0, 1);
      this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
      this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
      this.tableLayoutPanel1.Margin = new System.Windows.Forms.Padding(0);
      this.tableLayoutPanel1.Name = "tableLayoutPanel1";
      this.tableLayoutPanel1.RowCount = 2;
      this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
      this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
      this.tableLayoutPanel1.Size = new System.Drawing.Size(530, 208);
      this.tableLayoutPanel1.TabIndex = 3;
      // 
      // panel1
      // 
      this.panel1.AutoSize = true;
      this.panel1.Controls.Add(this.onLaunchDebuggerPathBrowserBtn);
      this.panel1.Controls.Add(this.onLaunchDebuggerPathTextBox);
      this.panel1.Controls.Add(this.onLaunchDebuggerArgumentsTextBox);
      this.panel1.Controls.Add(this.onLaunchDebuggerArgumentsLabel);
      this.panel1.Controls.Add(this.onLaunchDebuggerPathLabel);
      this.panel1.Controls.Add(this.browseButton);
      this.panel1.Controls.Add(this.commandLineTextBox);
      this.panel1.Controls.Add(this.commandLineLabel);
      this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
      this.panel1.Location = new System.Drawing.Point(0, 0);
      this.panel1.Margin = new System.Windows.Forms.Padding(0);
      this.panel1.Name = "panel1";
      this.panel1.Size = new System.Drawing.Size(530, 160);
      this.panel1.TabIndex = 3;
      // 
      // browseButton
      // 
      this.browseButton.Location = new System.Drawing.Point(443, 30);
      this.browseButton.Name = "browseButton";
      this.browseButton.Size = new System.Drawing.Size(75, 23);
      this.browseButton.TabIndex = 4;
      this.browseButton.Text = "&Browse...";
      this.browseButton.UseVisualStyleBackColor = true;
      this.browseButton.Click += new System.EventHandler(this.browseButton_Click);
      // 
      // commandLineTextBox
      // 
      this.commandLineTextBox.Location = new System.Drawing.Point(12, 30);
      this.commandLineTextBox.Name = "commandLineTextBox";
      this.commandLineTextBox.Size = new System.Drawing.Size(425, 23);
      this.commandLineTextBox.TabIndex = 3;
      // 
      // panel2
      // 
      this.panel2.AutoSize = true;
      this.panel2.Controls.Add(this.cancelButton);
      this.panel2.Controls.Add(this.okButton);
      this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
      this.panel2.Location = new System.Drawing.Point(0, 160);
      this.panel2.Margin = new System.Windows.Forms.Padding(0);
      this.panel2.Name = "panel2";
      this.panel2.Size = new System.Drawing.Size(530, 50);
      this.panel2.TabIndex = 4;
      // 
      // onLaunchDebuggerArgumentsTextBox
      // 
      this.onLaunchDebuggerArgumentsTextBox.Location = new System.Drawing.Point(12, 117);
      this.onLaunchDebuggerArgumentsTextBox.Multiline = true;
      this.onLaunchDebuggerArgumentsTextBox.Name = "onLaunchDebuggerArgumentsTextBox";
      this.onLaunchDebuggerArgumentsTextBox.Size = new System.Drawing.Size(506, 40);
      this.onLaunchDebuggerArgumentsTextBox.TabIndex = 9;
      // 
      // onLaunchDebuggerArgumentsLabel
      // 
      this.onLaunchDebuggerArgumentsLabel.AutoSize = true;
      this.onLaunchDebuggerArgumentsLabel.Location = new System.Drawing.Point(9, 99);
      this.onLaunchDebuggerArgumentsLabel.Name = "onLaunchDebuggerArgumentsLabel";
      this.onLaunchDebuggerArgumentsLabel.Size = new System.Drawing.Size(179, 15);
      this.onLaunchDebuggerArgumentsLabel.TabIndex = 8;
      this.onLaunchDebuggerArgumentsLabel.Text = "On launch debugger arguments:";
      // 
      // onLaunchDebuggerPathLabel
      // 
      this.onLaunchDebuggerPathLabel.AutoSize = true;
      this.onLaunchDebuggerPathLabel.Location = new System.Drawing.Point(9, 56);
      this.onLaunchDebuggerPathLabel.Name = "onLaunchDebuggerPathLabel";
      this.onLaunchDebuggerPathLabel.Size = new System.Drawing.Size(146, 15);
      this.onLaunchDebuggerPathLabel.TabIndex = 5;
      this.onLaunchDebuggerPathLabel.Text = "On launch debugger path:";
      // 
      // onLaunchDebuggerPathTextBox
      // 
      this.onLaunchDebuggerPathTextBox.Location = new System.Drawing.Point(12, 70);
      this.onLaunchDebuggerPathTextBox.Name = "onLaunchDebuggerPathTextBox";
      this.onLaunchDebuggerPathTextBox.Size = new System.Drawing.Size(425, 23);
      this.onLaunchDebuggerPathTextBox.TabIndex = 10;
      // 
      // onLaunchDebuggerPathBrowserBtn
      // 
      this.onLaunchDebuggerPathBrowserBtn.Location = new System.Drawing.Point(443, 70);
      this.onLaunchDebuggerPathBrowserBtn.Name = "onLaunchDebuggerPathBrowserBtn";
      this.onLaunchDebuggerPathBrowserBtn.Size = new System.Drawing.Size(75, 23);
      this.onLaunchDebuggerPathBrowserBtn.TabIndex = 11;
      this.onLaunchDebuggerPathBrowserBtn.Text = "&Browse...";
      this.onLaunchDebuggerPathBrowserBtn.UseVisualStyleBackColor = true;
      this.onLaunchDebuggerPathBrowserBtn.Click += new System.EventHandler(this.onLaunchDebuggerPathBrowserBtn_Click);
      // 
      // SetDebuggerDialog
      // 
      this.AcceptButton = this.okButton;
      this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.AutoSize = true;
      this.BackColor = System.Drawing.SystemColors.Window;
      this.CancelButton = this.cancelButton;
      this.ClientSize = new System.Drawing.Size(530, 208);
      this.Controls.Add(this.tableLayoutPanel1);
      this.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
      this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
      this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
      this.MaximizeBox = false;
      this.MinimizeBox = false;
      this.Name = "SetDebuggerDialog";
      this.ShowInTaskbar = false;
      this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
      this.Text = "Set Debugger";
      this.tableLayoutPanel1.ResumeLayout(false);
      this.tableLayoutPanel1.PerformLayout();
      this.panel1.ResumeLayout(false);
      this.panel1.PerformLayout();
      this.panel2.ResumeLayout(false);
      this.ResumeLayout(false);
      this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button cancelButton;
        private System.Windows.Forms.Button okButton;
        private System.Windows.Forms.Label commandLineLabel;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Button browseButton;
        private System.Windows.Forms.TextBox commandLineTextBox;
    private System.Windows.Forms.Button onLaunchDebuggerPathBrowserBtn;
    private System.Windows.Forms.TextBox onLaunchDebuggerPathTextBox;
    private System.Windows.Forms.TextBox onLaunchDebuggerArgumentsTextBox;
    private System.Windows.Forms.Label onLaunchDebuggerArgumentsLabel;
    private System.Windows.Forms.Label onLaunchDebuggerPathLabel;
  }
}