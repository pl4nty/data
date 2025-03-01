using EdgeProcessViewer.Properties;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EdgeProcessViewer {
  public partial class LaunchEdgeDialog : Form, INotifyPropertyChanged {
    public LaunchEdgeDialog() {
      InitializeComponent();
      edgePathTextBox.DataBindings.Add("Text", this, "EdgePath", false, DataSourceUpdateMode.OnPropertyChanged);
      edgeArgumentsTextBox.DataBindings.Add("Text", this, "EdgeArguments", false, DataSourceUpdateMode.OnPropertyChanged);
    }
    private void edgeBrowseButton_Click(object sender, EventArgs e) {
      using (var openFileDialog = new OpenFileDialog()) {
        openFileDialog.InitialDirectory = Environment.ExpandEnvironmentVariables("%systemdrive%");
        openFileDialog.Filter = "Microsoft Edge (msedge.exe)|msedge.exe|All files (*.*)|*.*";
        openFileDialog.FilterIndex = 1;
        openFileDialog.Title = "Browse";
        if (openFileDialog.ShowDialog() == DialogResult.OK) {
          edgePathTextBox.Text = openFileDialog.FileName;
        }
      }
    }

    private string edgePath_;
    private string edgeArgs_;

    private void NotifyPropertyChanged([CallerMemberName] String propertyName = "") {
      if (PropertyChanged != null) {
        PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
      }
    }

    public event PropertyChangedEventHandler PropertyChanged;

    #region Properties
    public string EdgePath {
      get {
        return edgePath_;
      }
      set {
        edgePath_ = value;
        NotifyPropertyChanged();
      }
    }

    public string EdgeArguments {
      get {
        return edgeArgs_;
      }
      set {
        edgeArgs_ = value;
        NotifyPropertyChanged();
      }
    }
    #endregion Properties

    private void okButton_Click(object sender, EventArgs e) {
      DialogResult = DialogResult.OK;
    }
  }
}
