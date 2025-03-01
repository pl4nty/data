// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System.Security.Principal;

namespace EdgeProcessViewer {
  public static class Utility {
    public static bool IsElevated {
      get {
        if (isElevated_ == null) {
          WindowsPrincipal principal = new WindowsPrincipal(WindowsIdentity.GetCurrent());
          isElevated_ = principal.IsInRole(WindowsBuiltInRole.Administrator);
        }
        return (isElevated_ == true);
      }
    }

    private static bool? isElevated_ = null;
  }
}
