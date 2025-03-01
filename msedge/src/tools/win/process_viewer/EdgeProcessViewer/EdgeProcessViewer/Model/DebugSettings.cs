// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.IO;
using Microsoft.Win32;

namespace EdgeProcessViewer {
  public static class DebugSettings {
    // Attempts to find the path of a debugger to use. Prefers in this order:
    //   1. The path supplied by the user (the input paramater).
    //   2. The path set as the postmortem debugger in the registry.
    //   3. The default path of a known debugger (WinDbgX or WinDbg).
    public static string GetDebuggerPath(string userDebugger) {
      if (!String.IsNullOrWhiteSpace(userDebugger)) {
        return userDebugger;
      }

      string postmortemDebugger = GetPostmortemDebugger();
      if (!String.IsNullOrEmpty(postmortemDebugger)) {
        return postmortemDebugger;
      }

      for (int i = 0; i < KnownDebuggers.Length; i++) {
        string debuggerListEntry = Environment.ExpandEnvironmentVariables(KnownDebuggers[i]);
        if (File.Exists(debuggerListEntry)) {
          return debuggerListEntry;
        }
      }
      return null;
    }

    // Returns true if a postmortem debugger is enabled in the registry.
    public static bool IsPostmortemDebuggerEnabled() {
      try {
        bool pathSet =
            Registry.GetValue(PostmortemDebuggerKeyName, PostmortemDebuggerValueName, null)
            as string != null;
        bool autoSet =
            Registry.GetValue(PostmortemDebuggerKeyName, PostmortemDebuggerAutoValueName, null)
            as string == "1";
        return pathSet && autoSet;
      } catch (Exception) {
        return false;
      }
    }

    // Sets registry keys to enable a postmortem debugger.
    public static void SetPostmortemDebugger(string debuggerPath) {
      string commandLine = null;
      string autoValue = null;
      if (!String.IsNullOrEmpty(debuggerPath)) {
        commandLine = debuggerPath + " -p %ld -e %ld -g";
        autoValue = "1";
      }
      SetRegistryString(Registry.LocalMachine, PostmortemDebuggerSubkeyName,
                        PostmortemDebuggerValueName, commandLine);
      SetRegistryString(Registry.LocalMachine, PostmortemDebuggerSubkeyName,
                        PostmortemDebuggerAutoValueName, autoValue);
    }

    // Checks to see if the given process is begine debugged
    public static bool CheckDebuggerPresent(int processId)
    {
      bool isDebuggerPresent = false;
      using (var process = System.Diagnostics.Process.GetProcessById(processId))
      {
        NativeMethods.CheckRemoteDebuggerPresent(process.Handle, ref isDebuggerPresent);
      }
      return isDebuggerPresent;
    }

          // Gets the path of the postmortem debugger set in the registry, if any. Attempts to remove
          // any command line arguments in the registry value and return only the exe path.
          private static string GetPostmortemDebugger() {
      try {
        string commandLine =
            Registry.GetValue(PostmortemDebuggerKeyName, PostmortemDebuggerValueName, null)
            as string;
        if (String.IsNullOrWhiteSpace(commandLine)) {
          return null;
        }

        // Find the substring ending at the first space, or if the first character is a quote, the
        // substring between that and the next quote.
        commandLine = commandLine.Trim();
        int start = 0;
        int end = -1;
        if (commandLine[0] == '"') {
          start = 1;
          end = commandLine.IndexOf('"', start);
        } else {
          end = commandLine.IndexOf(' ');
        }

        int length = (end == -1) ? (commandLine.Length - start) : (end - start);

        return commandLine.Substring(start, length);
      } catch (Exception) {
        return null;
      }
    }

    // Sets a string value in the registry, or deletes it if the passed-in value is null.
    private static void SetRegistryString(RegistryKey rootKey, string subkeyName, string valueName,
                                          string value) {
      if (String.IsNullOrEmpty(value)) {
        DeleteRegistryValue(rootKey, subkeyName, valueName);
      } else {
        string keyName = $@"{rootKey.Name}\{subkeyName}";
        Registry.SetValue(keyName, valueName, value, RegistryValueKind.String);
      }
    }

    // Deletes a value in the registry.
    private static void DeleteRegistryValue(RegistryKey rootKey, string subkeyName,
                                            string valueName) {
      using (RegistryKey key = rootKey.OpenSubKey(subkeyName, writable: true)) {
        if (key != null) {
          key.DeleteValue(valueName, throwOnMissingValue: false);
        }
      }
    }

    private const string IEFOSubkeyName =
        @"SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options";
    private const string IEFODebuggerValueName = "Debugger";
    private static readonly string DebugEdgeSubkeyName =
        DebugSettings.IEFOSubkeyName + @"\msedge.exe";
    private static readonly string DebugEdgeKeyName =
        $@"{Registry.LocalMachine.Name}\{DebugSettings.DebugEdgeSubkeyName}";

    private const string PostmortemDebuggerSubkeyName =
        @"SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug";
    private const string PostmortemDebuggerValueName = "Debugger";
    private const string PostmortemDebuggerAutoValueName = "Auto";
    private static readonly string PostmortemDebuggerKeyName =
        $@"{Registry.LocalMachine.Name}\{DebugSettings.PostmortemDebuggerSubkeyName}";

    private const string DebuggerSwitches = " -p %ld";
    private static readonly string[] KnownDebuggers = {
      @"%localappdata%\DBG\UI\WinDbgX.exe",
      @"%systemdrive%\Debuggers\windbg.exe",
      @"%programfiles%\Debugging Tools for Windows\windbg.exe",
    };
  }
}
