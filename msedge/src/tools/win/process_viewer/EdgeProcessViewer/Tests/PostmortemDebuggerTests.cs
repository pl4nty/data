// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Collections.Generic;
using System.IO;
using System.Security.AccessControl;
using System.Security.Principal;
using Microsoft.Win32;

[assembly: System.Runtime.Versioning.TargetFramework(".NETFramework,Version=v4.8")]

namespace EdgeProcessViewer {
  internal static class PostmortemDebuggerTests {
    private static int Main(string[] args) {
      string protectedExe = args[0];
      string temporaryDirectory = System.IO.Path.Combine(
          System.IO.Path.GetTempPath(), "EdgeProcessViewer-" + Guid.NewGuid().ToString("N"));
      Directory.CreateDirectory(temporaryDirectory);
      string userExe = System.IO.Path.Combine(temporaryDirectory, "windbg.exe");
      File.WriteAllText(userExe, "Disposable test data; never executed.");
      try {
        Run("reject user-owned executable before opening registry", () => Reject(userExe));
        foreach (string invalid in new[] {
            "", " ", "windbg.exe", @"C:windbg.exe", @"\\server\share\windbg.exe",
            "\"" + protectedExe + "\"", protectedExe + " -p 123", protectedExe + ":stream.exe",
            @"%localappdata%\DBG\UI\WinDbgX.exe", protectedExe + "\n",
            @"\\?\UNC\server\share\windbg.exe", @"\\?\Volume{invalid}\windbg.exe"
        }) {
          string value = invalid;
          Run("reject malformed path: " + value.Replace("\n", "\\n"), () => Reject(value));
        }
        Run("reject missing executable", () => Reject(
            System.IO.Path.Combine(temporaryDirectory, "missing.exe")));
        Run("discovery preserves interactive user debugger", () => {
          Equal(userExe, DebugSettings.GetDebuggerPath(userExe));
          Reject(DebugSettings.GetDebuggerPath(userExe));
        });
        Run("per-user fallback remains interactive-only", () => {
          string discovered = DebugSettings.GetDebuggerPath(
              null, () => null, path => path == userExe,
              path => path.Contains("localappdata") ? userExe : path);
          Equal(userExe, discovered);
          Reject(discovered);
        });
        Run("protected executable with spaces is quoted and pinned", () => {
          True(protectedExe.Contains(" "), "The positive control must contain a space.");
          var registry = new MemoryRegistry();
          DebugSettings.SetPostmortemDebugger(protectedExe, enable => registry);
          string command = (string)registry.Values["Debugger"].Value;
          True(command.StartsWith("\"\\\\?\\Volume{"), "Expected a volume-bound executable.");
          True(command.EndsWith("\" -p %ld -e %ld -g"), "Unexpected debugger arguments.");
          Equal("1", registry.Values["Auto"].Value);
          string executable = DebugSettings.ParsePostmortemDebugger(command);
          True(File.Exists(executable), "The registered executable must exist.");
          DebugSettings.SetPostmortemDebugger(executable, enable => registry);
          Equal(command, registry.Values["Debugger"].Value);
        });
        Run("disable deletes both values without resolving a target", () => {
          var registry = new MemoryRegistry();
          DebugSettings.SetPostmortemDebugger(null, enable => {
            True(!enable, "Disable must not create the registry key.");
            return registry;
          });
          Equal(0, registry.Values.Count);
        });
        Run("second-write failure restores both values and kinds", () => {
          var registry = new MemoryRegistry { FailWrite = 2 };
          registry.Values["Auto"] = new DebugSettings.RegistryValue(7, RegistryValueKind.DWord);
          Throws(() => DebugSettings.SetPostmortemDebugger(protectedExe, enable => registry));
          Equal(4, registry.Writes);
          Equal("original", registry.Values["Debugger"].Value);
          Equal(7, registry.Values["Auto"].Value);
          Equal(RegistryValueKind.DWord, registry.Values["Auto"].Kind);
        });
        Run("first-write failure preserves both values", () => {
          var registry = new MemoryRegistry { FailWrite = 1 };
          Throws(() => DebugSettings.SetPostmortemDebugger(protectedExe, enable => registry));
          Equal(3, registry.Writes);
          Equal("original", registry.Values["Debugger"].Value);
          Equal("0", registry.Values["Auto"].Value);
        });
        Run("rollback failure is explicit", () => {
          var registry = new MemoryRegistry { FailWrite = 2, FailRestore = true };
          Exception error = Throws(
              () => DebugSettings.SetPostmortemDebugger(protectedExe, enable => registry));
          True(error is AggregateException, "Restoration failure must be distinguishable.");
        });
        TestSecurityDescriptors();
        TestEntryPoints(userExe, protectedExe);
        TestTaskCopy();
      } finally {
        File.Delete(userExe);
        Directory.Delete(temporaryDirectory);
      }
      Console.WriteLine("{0} passed; {1} failed", passed_, failed_);
      return failed_ == 0 ? 0 : 1;
    }

    private static void TestSecurityDescriptors() {
      Run("trusted file owner and read-only users", () => Check(
          "O:SYG:SYD:(A;;FA;;;SY)(A;;FA;;;BA)(A;;FRFX;;;BU)", false));
      Run("directory permits sibling creation but not replacement", () => Check(
          "O:BAG:SYD:(A;;FA;;;BA)(A;;LC;;;AU)(A;OICIIO;GA;;;CO)", true));
      Run("Windows servicing ownership is trusted", () => Check(
          "O:S-1-5-80-956008885-3418522649-1831038044-1853292631-2271478464G:SYD:(A;;FA;;;SY)",
          false));
      Run("individual administrator account is not trusted ownership", () =>
          Throws(() => Check("O:S-1-5-21-1-2-3-1000G:SYD:(A;;FA;;;BA)", false)));
      Run("null DACL fails closed", () =>
          Throws(() => PostmortemDebuggerTarget.CheckSecurity(
              new RawSecurityDescriptor(ControlFlags.None,
                  new SecurityIdentifier(WellKnownSidType.LocalSystemSid, null), null,
                  null, null), false)));
      foreach (bool directory in new[] { false, true }) {
        foreach (int rights in new[] { 2, 0x10, 0x100, 0x10000, 0x40000, 0x80000,
                                       0x40000000, 0x10000000 }) {
          int mask = rights;
          bool isDirectory = directory;
          Run("reject unsafe grant " + mask + " directory=" + isDirectory, () =>
              Throws(() => Check("O:SYG:SYD:(A;;FA;;;SY)(A;;0x" +
                                  mask.ToString("x") + ";;;BU)", isDirectory)));
        }
      }
      Run("file append is unsafe", () =>
          Throws(() => Check("O:SYG:SYD:(A;;0x4;;;BU)", false)));
      Run("parent delete-child is unsafe", () =>
          Throws(() => Check("O:SYG:SYD:(A;;0x40;;;BU)", true)));
      Run("deny rules do not authorize a writable target", () =>
          Throws(() => Check("O:SYG:SYD:(D;;FW;;;BU)(A;;FA;;;BU)", false)));
      Run("unrecognized object ACE fails closed", () =>
          Throws(() => Check(
              "O:SYG:SYD:(OA;;FA;00112233-4455-6677-8899-aabbccddeeff;;BU)", false)));
    }

    private static void TestEntryPoints(string userExe, string protectedExe) {
      foreach (bool commandLine in new[] { false, true }) {
        foreach (string path in new[] { userExe, protectedExe, null, "" }) {
          bool cli = commandLine;
          string target = path;
          Run((cli ? "command-line" : "already-elevated UI") + " enable: " + target, () => {
            var registry = new MemoryRegistry();
            int opens = 0;
            string error = null;
            Action<string> register = debugger => DebugSettings.SetPostmortemDebugger(
                debugger, enable => { opens++; return registry; });
            if (cli) {
              True(!PostmortemDebuggerCommands.ProcessCommandLine(
                  new[] { "viewer.exe", "/postmortem:True" }, () => target, register,
                  message => error = message), "The helper must exit.");
            } else {
              PostmortemDebuggerCommands.EnableFromUI(
                  true, true, () => target, register,
                  argument => { throw new Exception("Unexpected elevation."); },
                  message => error = message);
            }
            if (target == protectedExe) {
              Equal(null, error);
              Equal(1, opens);
              Equal("1", registry.Values["Auto"].Value);
            } else {
              True(!String.IsNullOrWhiteSpace(error), "Rejection must report an error.");
              Equal(0, opens);
              Equal(0, registry.Writes);
              Equal("original", registry.Values["Debugger"].Value);
            }
          });
        }
        bool disableCli = commandLine;
        Run((disableCli ? "command-line" : "already-elevated UI") + " disable", () => {
          var registry = new MemoryRegistry();
          Func<string> resolve = () => { throw new Exception("Disable must not discover."); };
          Action<string> register = path =>
              DebugSettings.SetPostmortemDebugger(path, enable => registry);
          Action<string> error = message => { throw new Exception(message); };
          if (disableCli) {
            True(!PostmortemDebuggerCommands.ProcessCommandLine(new[] { "viewer.exe", "/postmortem:False" },
                                             resolve, register, error), "The helper must exit.");
          } else {
            PostmortemDebuggerCommands.EnableFromUI(
                false, true, resolve, register, error, error);
          }
          Equal(0, registry.Values.Count);
        });
      }
      Run("unelevated UI delegates and helper revalidates its own setting", () => {
        string argument = null;
        PostmortemDebuggerCommands.EnableFromUI(
            true, false, () => protectedExe,
            path => { throw new Exception("Unexpected direct registration."); },
            value => argument = value, message => { throw new Exception(message); });
        Equal("/postmortem:True", argument);
        var registry = new MemoryRegistry();
        string error = null;
        PostmortemDebuggerCommands.ProcessCommandLine(
            new[] { "viewer.exe", argument }, () => userExe,
            path => DebugSettings.SetPostmortemDebugger(path, enable => registry),
            message => error = message);
        True(error != null, "The helper must reject a substituted setting.");
        Equal(0, registry.Writes);
      });
      Run("unrecognized command line continues interactive startup", () =>
          True(PostmortemDebuggerCommands.ProcessCommandLine(new[] { "viewer.exe", "/other" },
              () => { throw new Exception("Unexpected discovery."); },
              path => { throw new Exception("Unexpected registration."); },
              message => { throw new Exception(message); }), "Expected interactive startup."));
    }

    private static void Check(string sddl, bool directory) {
      PostmortemDebuggerTarget.CheckSecurity(new RawSecurityDescriptor(sddl), directory);
    }

    private static Task CreateTask(params NativeMethods.AuxiliaryType[] types) {
      var process = new Process(new NativeMethods.ProcessData()) { CommandLine = "fixture.exe" };
      var task = new Task(process, 0, null, false);
      task.AuxiliaryTypes.AddRange(types);
      return task;
    }

    private static void TestTaskCopy() {
      var spare = NativeMethods.AuxiliaryType.kSpareRenderer;
      var top = NativeMethods.AuxiliaryType.kTopChrome;
      Run("task copy preserves list identity and ordered union", () => {
        var target = CreateTask(spare);
        var originalList = target.AuxiliaryTypes;
        var source = CreateTask(spare, top, top);
        target.CopyFrom(source);
        True(Object.ReferenceEquals(originalList, target.AuxiliaryTypes), "List identity changed.");
        Equal(2, target.AuxiliaryTypes.Count);
        Equal(spare, target.AuxiliaryTypes[0]);
        Equal(top, target.AuxiliaryTypes[1]);
        Equal(top, target.AuxiliaryType);
        Equal(3, source.AuxiliaryTypes.Count);
      });
      Run("repeated task copies do not duplicate auxiliary types", () => {
        var target = CreateTask(spare);
        var source = CreateTask(top, top);
        target.CopyFrom(source);
        target.CopyFrom(source);
        Equal(2, target.AuxiliaryTypes.Count);
      });
      Run("task self-copy leaves auxiliary types unchanged", () => {
        var task = CreateTask(spare, top);
        task.CopyFrom(task);
        Equal(2, task.AuxiliaryTypes.Count);
        Equal(top, task.AuxiliaryType);
      });
      Run("copying empty auxiliary types preserves existing types", () => {
        var target = CreateTask(top);
        target.CopyFrom(CreateTask());
        Equal(1, target.AuxiliaryTypes.Count);
        Equal(top, target.AuxiliaryType);
      });
      Run("empty task receives distinct types in source order", () => {
        var target = CreateTask();
        target.CopyFrom(CreateTask(top, top, spare));
        Equal(2, target.AuxiliaryTypes.Count);
        Equal(top, target.AuxiliaryTypes[0]);
        Equal(spare, target.AuxiliaryTypes[1]);
        Equal(spare, target.AuxiliaryType);
      });
    }

    private static void Reject(string path) {
      int opens = 0;
      Throws(() => DebugSettings.SetPostmortemDebugger(path, enable => {
        opens++;
        return new MemoryRegistry();
      }));
      Equal(0, opens);
    }

    private static Exception Throws(Action action) {
      try {
        action();
      } catch (Exception error) {
        return error;
      }
      throw new Exception("Expected an exception.");
    }

    private static void Equal(object expected, object actual) {
      True(Object.Equals(expected, actual), "Expected " + expected + "; actual " + actual);
    }

    private static void True(bool condition, string message) {
      if (!condition) {
        throw new Exception(message);
      }
    }

    private static void Run(string name, Action test) {
      try {
        test();
        passed_++;
        Console.WriteLine("PASS " + name);
      } catch (Exception error) {
        failed_++;
        Console.Error.WriteLine("FAIL " + name + ": " + error);
      }
    }

    private sealed class MemoryRegistry : DebugSettings.IPostmortemRegistry {
      internal readonly Dictionary<string, DebugSettings.RegistryValue> Values =
          new Dictionary<string, DebugSettings.RegistryValue> {
            { "Debugger", new DebugSettings.RegistryValue("original") },
            { "Auto", new DebugSettings.RegistryValue("0") }
          };
      internal int Writes;
      internal int FailWrite;
      internal bool FailRestore;

      public DebugSettings.RegistryValue Read(string name) {
        DebugSettings.RegistryValue value;
        return Values.TryGetValue(name, out value) ? value : new DebugSettings.RegistryValue(null);
      }

      public void Write(string name, DebugSettings.RegistryValue value) {
        Writes++;
        if (Writes == FailWrite || (FailRestore && Writes > FailWrite)) {
          throw new IOException("Injected registry failure.");
        }
        if (value.Value == null) {
          Values.Remove(name);
        } else {
          Values[name] = value;
        }
      }

      public void Dispose() { }
    }

    private static int passed_;
    private static int failed_;
  }
}
