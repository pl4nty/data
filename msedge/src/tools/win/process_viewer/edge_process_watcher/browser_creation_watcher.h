// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_EDGE_PROCESS_WATCHER_BROWSER_CREATION_WATCHER_H_
#define TOOLS_WIN_PROCESS_VIEWER_EDGE_PROCESS_WATCHER_BROWSER_CREATION_WATCHER_H_

#include <windows.h>

#include "base/win/object_watcher.h"
#include "base/win/scoped_handle.h"

namespace process_viewer {

// This class watches for the creation of Edge browser processes, and notifies
// the consumer when this occurs. Creation is detected using an event that the
// Edge browser process signals during its startup.
class BrowserCreationWatcher : public base::win::ObjectWatcher::Delegate {
 public:
  using OnBrowserCreatedCallback = base::RepeatingCallback<void()>;

  BrowserCreationWatcher();
  ~BrowserCreationWatcher() override;
  BrowserCreationWatcher(const BrowserCreationWatcher&) = delete;
  BrowserCreationWatcher& operator=(const BrowserCreationWatcher&) = delete;

  bool StartWatching(OnBrowserCreatedCallback on_browser_created_callback);

  void StopWatching();

  // base::win::ObjectWatcher::Delegate:
  void OnObjectSignaled(HANDLE object) override;

 private:
  base::win::ObjectWatcher watcher_;
  base::win::ScopedHandle startup_event_;
  OnBrowserCreatedCallback on_browser_created_callback_;
};

}  // namespace process_viewer

#endif  // TOOLS_WIN_PROCESS_VIEWER_EDGE_PROCESS_WATCHER_BROWSER_CREATION_WATCHER_H_
