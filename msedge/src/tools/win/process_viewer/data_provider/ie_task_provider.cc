// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/data_provider/ie_task_provider.h"

#include <windows.h>
#include "base/stl_util.h"
#include "base/strings/string_util.h"

#include <string>

namespace process_viewer {

namespace {

constexpr wchar_t kEdgeWindowClassNamePrefix[] = L"Chrome_WidgetWin_";
constexpr wchar_t kFrameTabClassName[] = L"Frame Tab";
constexpr wchar_t kBrowserTabClassName[] = L"TabWindowClass";

// Calls the specified function that takes an HWND and writes into a WCHAR
// buffer, and converts the output to a wstring.
template <typename Func>
bool GetWindowString(HWND hwnd, Func func, std::wstring* value) {
  constexpr int kMaxLength = 128;
  wchar_t buffer[kMaxLength];
  if (func(hwnd, buffer, std::size(buffer)) == 0) {
    return false;
  }
  *value = buffer;
  return true;
}

// Adds any child windows that represent IE tasks (e.g. a browsertab window) to
// the list of tasks.
BOOL CALLBACK EnumChildWindowsProc(HWND hwnd, LPARAM lparam) {
  std::wstring class_name;
  if (!GetWindowString(hwnd, &::GetClassName, &class_name)) {
    return TRUE;
  }
  if (class_name != kBrowserTabClassName) {
    return TRUE;
  }

  // Ignore failure here, we'll just use the empty string as the title.
  std::wstring title;
  GetWindowString(hwnd, &::GetWindowText, &title);

  DWORD process_id = 0;
  DWORD thread_id = GetWindowThreadProcessId(hwnd, &process_id);

  std::vector<IETask>* ie_tasks =
      reinterpret_cast<std::vector<IETask>*>(lparam);
  ie_tasks->push_back({process_id, thread_id, std::move(title)});
  return TRUE;
}

// Finds all top-level windows that can have a child window we're interested in,
// and enumerates their child windows.
BOOL CALLBACK EnumTopLevelWindowsProc(HWND hwnd, LPARAM lparam) {
  std::wstring class_name;
  if (!GetWindowString(hwnd, &::GetClassName, &class_name)) {
    return TRUE;
  }

  // Normally IE browsertab windows are children of an Edge window, but when
  // they're detached due to a tab hang, they're children of a top-level
  // FrameTab window, so we need to check for both.
  if (base::StartsWith(class_name, kEdgeWindowClassNamePrefix,
                       base::CompareCase::SENSITIVE) ||
      class_name == kFrameTabClassName) {
    EnumChildWindows(hwnd, EnumChildWindowsProc, lparam);
  }
  return TRUE;
}

}  // namespace

IETaskProvider::IETaskProvider() = default;

IETaskProvider::~IETaskProvider() = default;

bool IETaskProvider::GetTasks(std::vector<IETask>* tasks) {
  std::vector<IETask> ie_tasks;
  if (!EnumWindows(EnumTopLevelWindowsProc,
                   reinterpret_cast<LPARAM>(&ie_tasks))) {
    return false;
  }
  *tasks = std::move(ie_tasks);
  return true;
}

}  // namespace process_viewer
