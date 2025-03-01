namespace EdgeProcessViewer
{
    partial class LaunchEdgeDialog
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
      System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(LaunchEdgeDialog));
      this.panel1 = new System.Windows.Forms.Panel();
      this.cancelButton = new System.Windows.Forms.Button();
      this.okButton = new System.Windows.Forms.Button();
      this.edgeArgumentsTextBox = new System.Windows.Forms.TextBox();
      this.edgeArgumentsLabel = new System.Windows.Forms.Label();
      this.edgeBrowseButton = new System.Windows.Forms.Button();
      this.edgePathTextBox = new System.Windows.Forms.TextBox();
      this.edgePathLabel = new System.Windows.Forms.Label();
      this.panel1.SuspendLayout();
      this.SuspendLayout();
      // 
      // panel1
      // 
      this.panel1.AutoSize = true;
      this.panel1.BackColor = System.Drawing.SystemColors.Window;
      this.panel1.Controls.Add(this.cancelButton);
      this.panel1.Controls.Add(this.okButton);
      this.panel1.Controls.Add(this.edgeArgumentsTextBox);
      this.panel1.Controls.Add(this.edgeArgumentsLabel);
      this.panel1.Controls.Add(this.edgeBrowseButton);
      this.panel1.Controls.Add(this.edgePathTextBox);
      this.panel1.Controls.Add(this.edgePathLabel);
      this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
      this.panel1.Location = new System.Drawing.Point(0, 0);
      this.panel1.Margin = new System.Windows.Forms.Padding(0);
      this.panel1.Name = "panel1";
      this.panel1.Size = new System.Drawing.Size(531, 161);
      this.panel1.TabIndex = 0;
      // 
      // cancelButton
      // 
      this.cancelButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
      this.cancelButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
      this.cancelButton.Location = new System.Drawing.Point(435, 122);
      this.cancelButton.Name = "cancelButton";
      this.cancelButton.Size = new System.Drawing.Size(87, 27);
      this.cancelButton.TabIndex = 7;
      this.cancelButton.Text = "Cancel";
      this.cancelButton.UseVisualStyleBackColor = true;
      // 
      // okButton
      // 
      this.okButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
      this.okButton.Location = new System.Drawing.Point(342, 122);
      this.okButton.Name = "okButton";
      this.okButton.Size = new System.Drawing.Size(87, 27);
      this.okButton.TabIndex = 6;
      this.okButton.Text = "OK";
      this.okButton.UseVisualStyleBackColor = true;
      this.okButton.Click += new System.EventHandler(this.okButton_Click);
      // 
      // edgeArgumentsTextBox
      // 
      this.edgeArgumentsTextBox.Location = new System.Drawing.Point(16, 74);
      this.edgeArgumentsTextBox.Multiline = true;
      this.edgeArgumentsTextBox.Name = "edgeArgumentsTextBox";
      this.edgeArgumentsTextBox.Size = new System.Drawing.Size(506, 40);
      this.edgeArgumentsTextBox.TabIndex = 4;
      // 
      // edgeArgumentsLabel
      // 
      this.edgeArgumentsLabel.AutoSize = true;
      this.edgeArgumentsLabel.Location = new System.Drawing.Point(16, 57);
      this.edgeArgumentsLabel.Name = "edgeArgumentsLabel";
      this.edgeArgumentsLabel.Size = new System.Drawing.Size(87, 13);
      this.edgeArgumentsLabel.TabIndex = 3;
      this.edgeArgumentsLabel.Text = "Edge arguments:";
      // 
      // edgeBrowseButton
      // 
      this.edgeBrowseButton.Location = new System.Drawing.Point(447, 27);
      this.edgeBrowseButton.Name = "edgeBrowseButton";
      this.edgeBrowseButton.Size = new System.Drawing.Size(75, 23);
      this.edgeBrowseButton.TabIndex = 2;
      this.edgeBrowseButton.Text = "&Browse...";
      this.edgeBrowseButton.UseVisualStyleBackColor = true;
      this.edgeBrowseButton.Click += new System.EventHandler(this.edgeBrowseButton_Click);
      // 
      // edgePathTextBox
      // 
      this.edgePathTextBox.Location = new System.Drawing.Point(16, 30);
      this.edgePathTextBox.Name = "edgePathTextBox";
      this.edgePathTextBox.Size = new System.Drawing.Size(425, 20);
      this.edgePathTextBox.TabIndex = 1;
      this.edgePathTextBox.Text = global::EdgeProcessViewer.Properties.Settings.Default.EdgePath;
      // 
      // edgePathLabel
      // 
      this.edgePathLabel.AutoSize = true;
      this.edgePathLabel.Location = new System.Drawing.Point(13, 13);
      this.edgePathLabel.Name = "edgePathLabel";
      this.edgePathLabel.Size = new System.Drawing.Size(59, 13);
      this.edgePathLabel.TabIndex = 0;
      this.edgePathLabel.Text = "Edge path:";
      // 
      // LaunchEdgeDialog
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(531, 161);
      this.Controls.Add(this.panel1);
      this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
      this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
      this.MaximizeBox = false;
      this.MinimizeBox = false;
      this.Name = "LaunchEdgeDialog";
      this.Text = "Launch Edge";
      this.panel1.ResumeLayout(false);
      this.panel1.PerformLayout();
      this.ResumeLayout(false);
      this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label edgePathLabel;
        private System.Windows.Forms.TextBox edgePathTextBox;
        private System.Windows.Forms.Button edgeBrowseButton;
    private System.Windows.Forms.TextBox edgeArgumentsTextBox;
    private System.Windows.Forms.Label edgeArgumentsLabel;
    private System.Windows.Forms.Button cancelButton;
    private System.Windows.Forms.Button okButton;
  }
}