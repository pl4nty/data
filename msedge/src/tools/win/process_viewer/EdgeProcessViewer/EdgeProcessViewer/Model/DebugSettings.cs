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
      return GetDebuggerPath(userDebugger, GetPostmortemDebugger, File.Exists,
                             Environment.ExpandEnvironmentVariables);
    }

    internal static string GetDebuggerPath(
        string userDebugger, Func<string> getPostmortemDebugger, Func<string, bool> exists,
        Func<string, string> expandVariables) {
      if (!String.IsNullOrWhiteSpace(userDebugger)) {
        return userDebugger;
      }

      string postmortemDebugger = getPostmortemDebugger();
      if (!String.IsNullOrEmpty(postmortemDebugger)) {
        return postmortemDebugger;
      }

      for (int i = 0; i < KnownDebuggers.Length; i++) {
        string debuggerListEntry = expandVariables(KnownDebuggers[i]);
        if (exists(debuggerListEntry)) {
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
      SetPostmortemDebugger(debuggerPath, enable => new PostmortemRegistry(enable));
    }

    internal static void SetPostmortemDebugger(
        string debuggerPath, Func<bool, IPostmortemRegistry> openRegistry) {
      // Only null means disable. Missing or malformed enable targets must not delete values.
      using (PostmortemDebuggerTarget target =
                 debuggerPath == null ? null : PostmortemDebuggerTarget.Open(debuggerPath)) {
        string commandLine = target == null ? null : "\"" + target.Path + "\" -p %ld -e %ld -g";
        using (IPostmortemRegistry registry = openRegistry(target != null)) {
          RegistryValue debugger = registry.Read(PostmortemDebuggerValueName);
          RegistryValue auto = registry.Read(PostmortemDebuggerAutoValueName);
          try {
            registry.Write(PostmortemDebuggerValueName, new RegistryValue(commandLine));
            registry.Write(PostmortemDebuggerAutoValueName,
                           new RegistryValue(target == null ? null : "1"));
          } catch (Exception writeError) {
            try {
              registry.Write(PostmortemDebuggerValueName, debugger);
              registry.Write(PostmortemDebuggerAutoValueName, auto);
            } catch (Exception restoreError) {
              throw new AggregateException(
                  "Postmortem registration failed and the original settings could not be restored.",
                  writeError, restoreError);
            }
            throw new InvalidOperationException(
                "Postmortem registration failed; the original settings were restored.", writeError);
          }
        }
      }
    }

    internal sealed class RegistryValue {
      internal RegistryValue(object value, RegistryValueKind kind = RegistryValueKind.String) {
        Value = value;
        Kind = kind;
      }
      internal object Value { get; private set; }
      internal RegistryValueKind Kind { get; private set; }
    }

    internal interface IPostmortemRegistry : IDisposable {
      RegistryValue Read(string name);
      void Write(string name, RegistryValue value);
    }

    private sealed class PostmortemRegistry : IPostmortemRegistry {
      internal PostmortemRegistry(bool enable) {
        key_ = enable ? Registry.LocalMachine.CreateSubKey(PostmortemDebuggerSubkeyName)
                      : Registry.LocalMachine.OpenSubKey(PostmortemDebuggerSubkeyName, true);
      }

      public RegistryValue Read(string name) {
        object value = key_ == null ? null :
            key_.GetValue(name, null, RegistryValueOptions.DoNotExpandEnvironmentNames);
        return new RegistryValue(value, value == null ? RegistryValueKind.String :
                                                       key_.GetValueKind(name));
      }

      public void Write(string name, RegistryValue value) {
        if (value.Value == null) {
          if (key_ != null) {
            key_.DeleteValue(name, false);
          }
        } else {
          key_.SetValue(name, value.Value, value.Kind);
        }
      }

      public void Dispose() {
        if (key_ != null) {
          key_.Dispose();
        }
      }

      private readonly RegistryKey key_;
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

    // Gets the executable path of the postmortem debugger set in the registry, if any.
    private static string GetPostmortemDebugger() {
      try {
        string commandLine =
            Registry.GetValue(PostmortemDebuggerKeyName, PostmortemDebuggerValueName, null)
            as string;
        return ParsePostmortemDebugger(commandLine);
      } catch (Exception) {
        return null;
      }
    }

    internal static string ParsePostmortemDebugger(string commandLine) {
      if (String.IsNullOrWhiteSpace(commandLine)) {
        return null;
      }
      commandLine = commandLine.Trim();
      int start = 0;
      int end;
      if (commandLine[0] == '"') {
        start = 1;
        end = commandLine.IndexOf('"', start);
      } else {
        end = commandLine.IndexOf(' ');
      }
      int length = end == -1 ? commandLine.Length - start : end - start;
      return commandLine.Substring(start, length);
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
