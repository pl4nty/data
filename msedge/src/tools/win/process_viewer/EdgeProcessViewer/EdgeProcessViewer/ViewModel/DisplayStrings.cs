// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Text;

namespace EdgeProcessViewer {
  // Converts internal data into strings suitable for display to the user.
  public static class DisplayStrings {
    public static string GetProcessType(NativeMethods.ProcessType processType) {
      switch (processType) {
        case NativeMethods.ProcessType.Gpu:
          return "GPU";
        case NativeMethods.ProcessType.IEManager:
          return "IE Manager";
        case NativeMethods.ProcessType.IEContent:
          return "Content";
        default:
          return processType.ToString();
      }
    }

    public static string GetProcessId(int processId) {
      return processId.ToString();
    }

    public static string GetProcessIdHex(int processId) {
      return String.Format("0x{0:X}", processId);
    }

    public static string GetIntegrityLevel(NativeMethods.IntegrityLevel integrityLevel) {
      return integrityLevel.ToString();
    }

    public static string GetCpuUsage(int cpuUsage) {
      return cpuUsage.ToString();
    }

    public static string GetMemoryUsage(long memoryUsage) {
      long usageInKb = memoryUsage / 1024;
      return String.Format("{0:N0} K", usageInKb);
    }

    public static string GetCommandLine(string commandLine) {
      if (String.IsNullOrEmpty(commandLine)) {
        return "<Unable to get full process information>";
      } else {
        return commandLine;
      }
    }

    public static string GetEDP(string[] enterpriseIds) {
      return (enterpriseIds != null) ? "Yes" : "No";
    }

    public static string GetEnterpriseIds(string[] enterpriseIds) {
      if (enterpriseIds != null) {
        StringBuilder enterpriseIdsString = new StringBuilder(enterpriseIds[0]);
        for (int i = 1; i < enterpriseIds.Length; i++) {
          enterpriseIdsString.AppendFormat(", {0}", enterpriseIds[i]);
        }
        return enterpriseIdsString.ToString();
      } else {
        return String.Empty;
      }
    }

    public static string GetTitle(NativeMethods.ProcessType processType, string title) {
      if (processType == NativeMethods.ProcessType.IEContent) {
        return $"Tab: {title}";
      } else {
        return title;
      }
    }
  }
}