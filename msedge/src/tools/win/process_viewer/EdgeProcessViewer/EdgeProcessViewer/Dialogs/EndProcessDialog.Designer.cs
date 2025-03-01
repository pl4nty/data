namespace EdgeProcessViewer
{
    partial class EndProcessDialog
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
      System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(EndProcessDialog));
      this.cancelButton = new System.Windows.Forms.Button();
      this.endProcessButton = new System.Windows.Forms.Button();
      this.headingLabel = new System.Windows.Forms.Label();
      this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
      this.panel1 = new System.Windows.Forms.Panel();
      this.panel2 = new System.Windows.Forms.Panel();
      this.tableLayoutPanel1.SuspendLayout();
      this.panel1.SuspendLayout();
      this.panel2.SuspendLayout();
      this.SuspendLayout();
      // 
      // cancelButton
      // 
      this.cancelButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
      this.cancelButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
      this.cancelButton.Location = new System.Drawing.Point(255, 27);
      this.cancelButton.Name = "cancelButton";
      this.cancelButton.Size = new System.Drawing.Size(87, 27);
      this.cancelButton.TabIndex = 1;
      this.cancelButton.Text = "Cancel";
      this.cancelButton.UseVisualStyleBackColor = true;
      // 
      // endProcessButton
      // 
      this.endProcessButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
      this.endProcessButton.Location = new System.Drawing.Point(138, 27);
      this.endProcessButton.Name = "endProcessButton";
      this.endProcessButton.Size = new System.Drawing.Size(111, 27);
      this.endProcessButton.TabIndex = 0;
      this.endProcessButton.Text = "Terminate";
      this.endProcessButton.UseVisualStyleBackColor = true;
      this.endProcessButton.Click += new System.EventHandler(this.endProcessButton_Click);
      // 
      // headingLabel
      // 
      this.headingLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
      this.headingLabel.AutoSize = true;
      this.headingLabel.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
      this.headingLabel.Location = new System.Drawing.Point(9, 12);
      this.headingLabel.Margin = new System.Windows.Forms.Padding(0);
      this.headingLabel.Name = "headingLabel";
      this.headingLabel.Size = new System.Drawing.Size(280, 21);
      this.headingLabel.TabIndex = 2;
      this.headingLabel.Text = "Do you want to terminate this process?";
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
      this.tableLayoutPanel1.Size = new System.Drawing.Size(354, 96);
      this.tableLayoutPanel1.TabIndex = 3;
      // 
      // panel1
      // 
      this.panel1.AutoSize = true;
      this.panel1.Controls.Add(this.headingLabel);
      this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
      this.panel1.Location = new System.Drawing.Point(0, 0);
      this.panel1.Margin = new System.Windows.Forms.Padding(0);
      this.panel1.Name = "panel1";
      this.panel1.Size = new System.Drawing.Size(354, 33);
      this.panel1.TabIndex = 3;
      // 
      // panel2
      // 
      this.panel2.AutoSize = true;
      this.panel2.Controls.Add(this.cancelButton);
      this.panel2.Controls.Add(this.endProcessButton);
      this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
      this.panel2.Location = new System.Drawing.Point(0, 33);
      this.panel2.Margin = new System.Windows.Forms.Padding(0);
      this.panel2.Name = "panel2";
      this.panel2.Size = new System.Drawing.Size(354, 66);
      this.panel2.TabIndex = 4;
      // 
      // EndProcessDialog
      // 
      this.AcceptButton = this.endProcessButton;
      this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.AutoSize = true;
      this.BackColor = System.Drawing.SystemColors.Window;
      this.CancelButton = this.cancelButton;
      this.ClientSize = new System.Drawing.Size(354, 96);
      this.Controls.Add(this.tableLayoutPanel1);
      this.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
      this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
      this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
      this.MaximizeBox = false;
      this.MinimizeBox = false;
      this.Name = "EndProcessDialog";
      this.ShowInTaskbar = false;
      this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
      this.Text = "Edge Process Viewer";
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
        private System.Windows.Forms.Button endProcessButton;
        private System.Windows.Forms.Label headingLabel;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
    }
}