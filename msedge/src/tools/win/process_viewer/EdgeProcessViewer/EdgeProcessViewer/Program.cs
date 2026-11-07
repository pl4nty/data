// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Windows.Forms;

namespace EdgeProcessViewer {
  static class Program {
    [STAThread]
    static void Main() {
      // A non-elevated instance of the app may launch an elevated instance with a command-line
      // argument to perform an operation that requires elevation. The elevated instance should
      // exit after completing the operation.
      if (Utility.IsElevated && !ProcessCommandLine()) {
        return;
      }

      NativeMethods.InitializeEdgeDataProvider();

      Application.EnableVisualStyles();
      Application.SetCompatibleTextRenderingDefault(false);
      Application.Run(new MainForm());

      NativeMethods.UninitializeEdgeDataProvider();
    }

    // Handles any command line arguments and returns whether to continue execution of the program.
    static bool ProcessCommandLine() {
      return PostmortemDebuggerCommands.ProcessCommandLine(
          Environment.GetCommandLineArgs(),
          () => DebugSettings.GetDebuggerPath(Properties.Settings.Default.DebuggerPath),
          DebugSettings.SetPostmortemDebugger,
          message => {
            Environment.ExitCode = 1;
            MessageBox.Show(message, "Postmortem debugger", MessageBoxButtons.OK, MessageBoxIcon.Error);
          });
    }
  }
}
