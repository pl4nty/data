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
      string[] commandLineArgs = Environment.GetCommandLineArgs();
      if (commandLineArgs.Length > 1) {
        foreach (string arg in commandLineArgs) {
          if (arg == "/postmortem:True") {
            string debugger =
                DebugSettings.GetDebuggerPath(Properties.Settings.Default.DebuggerPath);
            if (!String.IsNullOrEmpty(debugger)) {
              DebugSettings.SetPostmortemDebugger(debugger);
            }
            return false;
          } else if (arg == "/postmortem:False") {
            DebugSettings.SetPostmortemDebugger(null);
            return false;
          }
        }
      }
      return true;
    }
  }
}
