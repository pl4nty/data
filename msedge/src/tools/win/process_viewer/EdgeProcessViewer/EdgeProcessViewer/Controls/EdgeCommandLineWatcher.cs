using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EdgeProcessViewer.Controls {
  class EdgeCommandLineWatcher: ToolStripMenuItem {
    public EdgeCommandLineWatcher() {
      this.watchedArgs_ = new List<CommandLineArg>();
    }

    public event EventHandler<bool> ShowArgumentInTableChanged;
    public event EventHandler<WatchedArgumentsChangedEventArgs> WatchedArgumentsChanged;

    public void InitializeComponent() {
      this.editCommandLineArgsWatcherToolStripMenuItem = new ToolStripMenuItem();
      this.showArgumentInTableToolStripMenuItem = new ToolStripMenuItem();

      // commandLineArgsSettingsToolStripMenuItem
      this.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
        this.editCommandLineArgsWatcherToolStripMenuItem,
        this.showArgumentInTableToolStripMenuItem});
      this.Name = "edgeCommandLineWatcher";
      this.Size = new System.Drawing.Size(54, 20);
      this.Text = "&Command Line Watcher";

      // 
      // showArgumentInTableToolStripMenuItem
      // 
      this.showArgumentInTableToolStripMenuItem.CheckOnClick = true;
      this.showArgumentInTableToolStripMenuItem.Name = "showArgumentInTableToolStripMenuItem";
      this.showArgumentInTableToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
      this.showArgumentInTableToolStripMenuItem.Text = "&Show Argument In Table";
      this.showArgumentInTableToolStripMenuItem.Click += new System.EventHandler(this.showArgumentInTableToolStripMenuItem_Click);

      // 
      // editCommandLineArgsWatcherToolStripMenuItem
      // 
      this.editCommandLineArgsWatcherToolStripMenuItem.Name = "editCommandLineArgsWatcherToolStripMenuItem";
      this.editCommandLineArgsWatcherToolStripMenuItem.Size = new System.Drawing.Size(232, 22);
      this.editCommandLineArgsWatcherToolStripMenuItem.Text = "&Edit Command Line Args";
      this.editCommandLineArgsWatcherToolStripMenuItem.Click += new System.EventHandler(this.editCommandLineArgsWatcherToolStripMenuItem_Click);
    }

    private void editCommandLineArgsWatcherToolStripMenuItem_Click(object sender, EventArgs e) {
      using (EditCommandLineArgWatcherDialog dialog = new EditCommandLineArgWatcherDialog()) {
        dialog.WatchedArguments = watchedArgs_;
        if (dialog.ShowDialog() == DialogResult.OK) {
          if (dialog.WatchedArguments != watchedArgs_) {
            WatchedArgumentsChangedEventArgs eventArgs = new WatchedArgumentsChangedEventArgs(dialog.WatchedArguments);
            watchedArgs_ = dialog.WatchedArguments;
            WatchedArgumentsChanged?.Invoke(this, eventArgs);
          }
        }
      }
    }

    private void showArgumentInTableToolStripMenuItem_Click(object sender, EventArgs e) {
      ShowArgumentInTableChanged?.Invoke(sender, showArgumentInTableToolStripMenuItem.Checked);
    }

    public List<CommandLineArg> WatchedArgs {
      get {
        return watchedArgs_;
      }
      set {
        watchedArgs_ = value;
      }
    }

    private List<CommandLineArg> watchedArgs_;
    private ToolStripMenuItem editCommandLineArgsWatcherToolStripMenuItem;
    private ToolStripMenuItem showArgumentInTableToolStripMenuItem;
  }
}
