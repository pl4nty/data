// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Runtime.InteropServices;
using System.Security.AccessControl;
using System.Security.Principal;
using System.Text;
using Microsoft.Win32.SafeHandles;

namespace EdgeProcessViewer {
  // Machine-wide registration requires administrator-controlled storage, independently of
  // the user setting or the account running this process.
  internal sealed class PostmortemDebuggerTarget : IDisposable {
    private PostmortemDebuggerTarget(string path, List<SafeFileHandle> handles) {
      Path = path;
      handles_ = handles;
    }

    internal string Path { get; private set; }

    internal static PostmortemDebuggerTarget Open(string path) {
      bool drivePath = path != null && path.Length >= 3 &&
          Char.IsLetter(path[0]) && path[1] == ':' && path[2] == '\\' &&
          path.IndexOf(':', 2) < 0;
      if (String.IsNullOrWhiteSpace(path) || (!drivePath && VolumeRootLength(path) == 0) ||
          path.IndexOfAny(new[] { '"', '%', '/', '\r', '\n', '\0' }) >= 0 ||
          !path.EndsWith(".exe", StringComparison.OrdinalIgnoreCase)) {
        throw new ArgumentException(
            "Postmortem debugging requires an absolute local executable path, without arguments.");
      }

      if (drivePath) {
        path = System.IO.Path.GetFullPath(path);
        var volume = new StringBuilder(64);
        if (!GetVolumeNameForVolumeMountPoint(path.Substring(0, 3), volume, volume.Capacity)) {
          throw new Win32Exception(Marshal.GetLastWin32Error());
        }
        path = volume.ToString() + path.Substring(3);
      }

      int rootLength = VolumeRootLength(path);
      if (rootLength == 0) {
        throw new IOException("Cannot identify a local volume for the postmortem debugger.");
      }
      var handles = new List<SafeFileHandle>();
      try {
        string current = path.Substring(0, rootLength);
        OpenChecked(current, true, handles);
        string[] components = path.Substring(rootLength).Split('\\');
        for (int i = 0; i < components.Length; i++) {
          string component = components[i];
          if (component.Length == 0 || component == "." || component == ".." ||
              component.EndsWith(".") || component.EndsWith(" ")) {
            throw new ArgumentException("Unsupported postmortem debugger path component.");
          }
          bool directory = i != components.Length - 1;
          current += component;
          OpenChecked(current, directory, handles);
          if (directory) {
            current += "\\";
          }
        }

        // A volume GUID path binds registration to the resolved file's volume, not a
        // per-user drive mapping, junction, or symbolic-link spelling.
        var buffer = new StringBuilder(32768);
        uint length = GetFinalPathNameByHandle(handles[handles.Count - 1], buffer,
                                              (uint)buffer.Capacity, 1);
        if (length == 0) {
          throw new Win32Exception(Marshal.GetLastWin32Error());
        }
        string finalPath = buffer.ToString();
        if (length >= buffer.Capacity || VolumeRootLength(finalPath) == 0 ||
            !String.Equals(path, finalPath, StringComparison.OrdinalIgnoreCase)) {
          throw new IOException("Cannot identify a local volume for the postmortem debugger.");
        }
        return new PostmortemDebuggerTarget(finalPath, handles);
      } catch {
        foreach (SafeFileHandle handle in handles) {
          handle.Dispose();
        }
        throw;
      }
    }

    private static void OpenChecked(string path, bool directory, List<SafeFileHandle> handles) {
      // READ_CONTROL | FILE_READ_ATTRIBUTES; share reads only. OPEN_REPARSE_POINT
      // prevents following a link, and holding every handle prevents replacement
      // between authorization and registry writes.
      SafeFileHandle handle = CreateFile(path, 0x20080, 1, IntPtr.Zero, 3,
                                        0x02200000, IntPtr.Zero);
      handles.Add(handle);
      if (handle.IsInvalid) {
        throw new Win32Exception(Marshal.GetLastWin32Error());
      }
      FileAttributeTagInfo attributes;
      if (!GetFileInformationByHandleEx(handle, 9, out attributes, 8)) {
        throw new Win32Exception(Marshal.GetLastWin32Error());
      }
      if ((attributes.Attributes & FileAttributes.ReparsePoint) != 0 ||
          ((attributes.Attributes & FileAttributes.Directory) != 0) != directory) {
        throw new UnauthorizedAccessException(
            "The debugger path must contain ordinary directories and an executable, not links.");
      }
      CheckSecurity(ReadSecurity(handle), directory);
    }

    private static int VolumeRootLength(string path) {
      const string prefix = @"\\?\Volume{";
      Guid volume;
      int end = path == null ? -1 : path.IndexOf(@"}\", StringComparison.Ordinal);
      if (path == null || !path.StartsWith(prefix, StringComparison.OrdinalIgnoreCase) ||
          end < prefix.Length ||
          !Guid.TryParseExact(path.Substring(prefix.Length, end - prefix.Length), "D", out volume) ||
          path.IndexOf(':') >= 0) {
        return 0;
      }
      return end + 2;
    }

    private static RawSecurityDescriptor ReadSecurity(SafeFileHandle handle) {
      IntPtr owner, group, dacl, sacl, descriptor;
      uint result = GetSecurityInfo(handle, 1, 5, out owner, out group, out dacl,
                                   out sacl, out descriptor);
      if (result != 0) {
        throw new Win32Exception((int)result);
      }
      try {
        byte[] bytes = new byte[GetSecurityDescriptorLength(descriptor)];
        Marshal.Copy(descriptor, bytes, 0, bytes.Length);
        return new RawSecurityDescriptor(bytes, 0);
      } finally {
        LocalFree(descriptor);
      }
    }

    internal static void CheckSecurity(RawSecurityDescriptor security, bool directory) {
      if (!IsPrivileged(security.Owner) || security.DiscretionaryAcl == null) {
        throw new UnauthorizedAccessException(
            "The debugger and its parent directories must be owned by administrators or Windows.");
      }

      // Creating a sibling directory does not replace an existing protected child.
      // Deleting children, changing ACLs, or writing directory data does.
      int unsafeRights = (int)(FileSystemRights.WriteData | FileSystemRights.WriteAttributes |
                               FileSystemRights.WriteExtendedAttributes | FileSystemRights.Delete |
                               FileSystemRights.ChangePermissions | FileSystemRights.TakeOwnership);
      unsafeRights |= directory ? (int)FileSystemRights.DeleteSubdirectoriesAndFiles
                                : (int)FileSystemRights.AppendData;
      unsafeRights |= unchecked((int)0x50000000);  // GENERIC_WRITE and GENERIC_ALL.
      foreach (GenericAce entry in security.DiscretionaryAcl) {
        if ((entry.AceFlags & AceFlags.InheritOnly) != 0) {
          continue;
        }
        CommonAce ace = entry as CommonAce;
        if (ace == null || ace.IsCallback ||
            (ace.AceQualifier != AceQualifier.AccessAllowed &&
             ace.AceQualifier != AceQualifier.AccessDenied)) {
          throw new UnauthorizedAccessException("Unsupported debugger access-control entry.");
        }
        // Deny entries cannot grant authority. Conservatively reject unsafe grants even
        // when a deny entry might cancel them for a particular token.
        if (ace.AceQualifier == AceQualifier.AccessAllowed &&
            (ace.AccessMask & unsafeRights) != 0 && !IsPrivileged(ace.SecurityIdentifier)) {
          throw new UnauthorizedAccessException(
              "The debugger or a parent directory can be modified without administrator rights.");
        }
      }
    }

    private static bool IsPrivileged(SecurityIdentifier sid) {
      return sid != null &&
          (sid.IsWellKnown(WellKnownSidType.LocalSystemSid) ||
           sid.IsWellKnown(WellKnownSidType.BuiltinAdministratorsSid) ||
           sid.Value == TrustedInstallerSid);
    }

    public void Dispose() {
      foreach (SafeFileHandle handle in handles_) {
        handle.Dispose();
      }
    }

    [StructLayout(LayoutKind.Sequential)]
    private struct FileAttributeTagInfo {
      internal FileAttributes Attributes;
      internal uint ReparseTag;
    }

    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    private static extern uint GetFinalPathNameByHandle(
        SafeFileHandle file, StringBuilder path, uint pathLength, uint flags);

    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    private static extern bool GetVolumeNameForVolumeMountPoint(
        string mountPoint, StringBuilder volumeName, int length);

    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    private static extern SafeFileHandle CreateFile(
        string path, uint access, uint share, IntPtr security, uint disposition,
        uint flags, IntPtr template);

    [DllImport("kernel32.dll", SetLastError = true)]
    private static extern bool GetFileInformationByHandleEx(
        SafeFileHandle handle, int informationClass, out FileAttributeTagInfo information,
        uint size);

    [DllImport("advapi32.dll")]
    private static extern uint GetSecurityInfo(
        SafeFileHandle handle, int objectType, uint securityInfo, out IntPtr owner, out IntPtr group,
        out IntPtr dacl, out IntPtr sacl, out IntPtr descriptor);

    [DllImport("advapi32.dll")]
    private static extern uint GetSecurityDescriptorLength(IntPtr descriptor);

    [DllImport("kernel32.dll")]
    private static extern IntPtr LocalFree(IntPtr memory);

    private const string TrustedInstallerSid =
        "S-1-5-80-956008885-3418522649-1831038044-1853292631-2271478464";
    private readonly List<SafeFileHandle> handles_;
  }
}
