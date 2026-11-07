// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;

namespace EdgeProcessViewer {
  internal static class PostmortemDebuggerCommands {
    internal static bool ProcessCommandLine(
        string[] commandLineArgs, Func<string> getDebugger, Action<string> register,
        Action<string> showError) {
      if (commandLineArgs.Length > 1) {
        foreach (string arg in commandLineArgs) {
          if (arg == "/postmortem:True" || arg == "/postmortem:False") {
            try {
              Register(arg == "/postmortem:True", getDebugger, register);
            } catch (Exception error) {
              showError("Failed to change postmortem debugger:\n" + error.Message);
            }
            return false;
          }
        }
      }
      return true;
    }

    internal static void EnableFromUI(
        bool enable, bool elevated, Func<string> getDebugger, Action<string> register,
        Action<string> elevate, Action<string> showError) {
      try {
        if (elevated) {
          Register(enable, getDebugger, register);
        } else {
          // Discovery is only a usability check here; the elevated helper resolves and
          // authorizes its own target rather than trusting this process's result.
          if (enable) {
            RequireDebugger(getDebugger());
          }
          elevate($"/postmortem:{enable}");
        }
      } catch (Exception error) {
        showError("Failed to change postmortem debugger:\n" + error.Message);
      }
    }

    private static void Register(bool enable, Func<string> getDebugger, Action<string> register) {
      string debugger = enable ? getDebugger() : null;
      if (enable) {
        RequireDebugger(debugger);
      }
      register(debugger);
    }

    private static void RequireDebugger(string debugger) {
      if (String.IsNullOrWhiteSpace(debugger)) {
        throw new InvalidOperationException(
            "No debugger is set. Go to the Debug menu and select \"Set debugger path\".");
      }
    }
  }
}
