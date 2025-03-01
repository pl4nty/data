using EdgeProcessViewer.Controls;

namespace EdgeProcessViewer
{
    partial class EditCommandLineArgWatcherDialog
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
      this.components = new System.ComponentModel.Container();
      System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
      System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(EditCommandLineArgWatcherDialog));
      this.dialogSplitContainer = new System.Windows.Forms.SplitContainer();
      this.okButton = new System.Windows.Forms.Button();
      this.cancelButton = new System.Windows.Forms.Button();
      this.commandLineArgsGridView = new EdgeProcessViewer.Controls.CommandLineArgGridView();
      this.addArgumentTextbox = new System.Windows.Forms.TextBox();
      this.removeSelected = new System.Windows.Forms.Button();
      this.addArgumentButton = new System.Windows.Forms.Button();
      this.editWatchedArguments = new System.Windows.Forms.Label();
      ((System.ComponentModel.ISupportInitialize)(this.dialogSplitContainer)).BeginInit();
      this.dialogSplitContainer.Panel1.SuspendLayout();
      this.dialogSplitContainer.Panel2.SuspendLayout();
      this.dialogSplitContainer.SuspendLayout();
      ((System.ComponentModel.ISupportInitialize)(this.commandLineArgsGridView)).BeginInit();
      this.SuspendLayout();

      // 
      // dialogSplitContainer
      // 
      this.dialogSplitContainer.Dock = System.Windows.Forms.DockStyle.Fill;
      this.dialogSplitContainer.Location = new System.Drawing.Point(0, 0);
      this.dialogSplitContainer.Name = "dialogSplitContainer";
      this.dialogSplitContainer.Orientation = System.Windows.Forms.Orientation.Horizontal;
      // 
      // dialogSplitContainer.Panel1
      // 
      this.dialogSplitContainer.Panel1.BackColor = System.Drawing.SystemColors.Menu;
      this.dialogSplitContainer.Panel1.Controls.Add(this.editWatchedArguments);
      this.dialogSplitContainer.Panel1.Controls.Add(this.addArgumentButton);
      this.dialogSplitContainer.Panel1.Controls.Add(this.removeSelected);
      this.dialogSplitContainer.Panel1.Controls.Add(this.addArgumentTextbox);
      this.dialogSplitContainer.Panel1.Controls.Add(this.commandLineArgsGridView);
      // 
      // dialogSplitContainer.Panel2
      // 
      this.dialogSplitContainer.Panel2.BackColor = System.Drawing.SystemColors.Menu;
      this.dialogSplitContainer.Panel2.Controls.Add(this.okButton);
      this.dialogSplitContainer.Panel2.Controls.Add(this.cancelButton);
      this.dialogSplitContainer.Size = new System.Drawing.Size(530, 208);
      this.dialogSplitContainer.SplitterDistance = 176;
      this.dialogSplitContainer.TabIndex = 0;
      // 
      // okButton
      // 
      this.okButton.Location = new System.Drawing.Point(352, 5);
      this.okButton.Name = "okButton";
      this.okButton.Size = new System.Drawing.Size(75, 23);
      this.okButton.TabIndex = 1;
      this.okButton.Text = "Ok";
      this.okButton.UseVisualStyleBackColor = true;
      this.okButton.Click += new System.EventHandler(this.okButton_Click);
      // 
      // cancelButton
      // 
      this.cancelButton.Location = new System.Drawing.Point(442, 5);
      this.cancelButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
      this.cancelButton.Name = "cancelButton";
      this.cancelButton.Size = new System.Drawing.Size(75, 23);
      this.cancelButton.TabIndex = 0;
      this.cancelButton.Text = "Cancel";
      this.cancelButton.UseVisualStyleBackColor = true;
      // 
      // commandLineArgsGridView
      // 

      this.commandLineArgsGridView.Location = new System.Drawing.Point(12, 12);
      this.commandLineArgsGridView.Name = "commandLineArgsGridView";
      this.commandLineArgsGridView.Size = new System.Drawing.Size(274, 149);
      this.commandLineArgsGridView.TabIndex = 0;
      // 
      // addArgumentTextbox
      // 
      this.addArgumentTextbox.Location = new System.Drawing.Point(311, 40);
      this.addArgumentTextbox.Name = "addArgumentTextbox";
      this.addArgumentTextbox.Size = new System.Drawing.Size(164, 31);
      this.addArgumentTextbox.TabIndex = 1;
      // 
      // removeSelected
      // 
      this.removeSelected.Location = new System.Drawing.Point(311, 127);
      this.removeSelected.Name = "removeSelected";
      this.removeSelected.Size = new System.Drawing.Size(166, 34);
      this.removeSelected.TabIndex = 2;
      this.removeSelected.Text = "Remove Selected";
      this.removeSelected.UseVisualStyleBackColor = true;
      this.removeSelected.Click += new System.EventHandler(this.removeButton_Click);
      // 
      // addArgumentButton
      // 
      this.addArgumentButton.Location = new System.Drawing.Point(311, 83);
      this.addArgumentButton.Name = "addArgumentButton";
      this.addArgumentButton.Size = new System.Drawing.Size(166, 32);
      this.addArgumentButton.TabIndex = 3;
      this.addArgumentButton.Text = "Add Argument";
      this.addArgumentButton.UseVisualStyleBackColor = true;
      this.addArgumentButton.Click += new System.EventHandler(this.addArgumentButton_Click);
      // 
      // editWatchedArguments
      // 
      this.editWatchedArguments.AutoSize = true;
      this.editWatchedArguments.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
      this.editWatchedArguments.Location = new System.Drawing.Point(294, 12);
      this.editWatchedArguments.Name = "editWatchedArguments";
      this.editWatchedArguments.Size = new System.Drawing.Size(224, 25);
      this.editWatchedArguments.TabIndex = 4;
      this.editWatchedArguments.Text = "Edit Watched Arguments";
      // 
      // EditCommandLineArgWatcherDialog
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 25F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.AutoSize = true;
      this.BackColor = System.Drawing.SystemColors.Window;
      this.ClientSize = new System.Drawing.Size(530, 208);
      this.Controls.Add(this.dialogSplitContainer);
      this.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
      this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
      this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
      this.MaximizeBox = false;
      this.MinimizeBox = false;
      this.Name = "EditCommandLineArgWatcherDialog";
      this.ShowInTaskbar = false;
      this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
      this.Text = "Edit Command Line Arg Watcher";
      this.dialogSplitContainer.Panel1.ResumeLayout(false);
      this.dialogSplitContainer.Panel1.PerformLayout();
      this.dialogSplitContainer.Panel2.ResumeLayout(false);
      ((System.ComponentModel.ISupportInitialize)(this.dialogSplitContainer)).EndInit();
      this.dialogSplitContainer.ResumeLayout(false);
      ((System.ComponentModel.ISupportInitialize)(this.commandLineArgsGridView)).EndInit();
      this.ResumeLayout(false);

        }

    #endregion
    private System.Windows.Forms.SplitContainer dialogSplitContainer;
    private System.Windows.Forms.Button okButton;
    private System.Windows.Forms.Button cancelButton;
    private System.Windows.Forms.Label editWatchedArguments;
    private System.Windows.Forms.Button addArgumentButton;
    private System.Windows.Forms.Button removeSelected;
    private System.Windows.Forms.TextBox addArgumentTextbox;
    private CommandLineArgGridView commandLineArgsGridView;
  }
}