// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_EDGE_PROCESS_WATCHER_EDGE_WATCHER_H_
#define TOOLS_WIN_PROCESS_VIEWER_EDGE_PROCESS_WATCHER_EDGE_WATCHER_H_

#include <map>

#include "base/observer_list.h"
#include "chrome/common/edge_external_task_manager/external_task_manager.mojom.h"
#include "tools/win/process_viewer/data_provider/process_data_provider.h"
#include "tools/win/process_viewer/data_provider/task_manager_client.h"
#include "tools/win/process_viewer/edge_process_watcher/browser_creation_watcher.h"

namespace process_viewer {

// This class finds all existing Edge browser processes, and finds new ones as
// they are created. For each browser found, it connects with the process and
// stores snapshot updates.
class EdgeWatcher : public TaskManagerClient::Observer {
 public:
  class Observer : public base::CheckedObserver {
   public:
    virtual void OnGotSnapshot(
        ULONG process_id,
        const std::vector<external_task_manager::mojom::Task>& tasks) = 0;
  };

  EdgeWatcher();
  ~EdgeWatcher() override;
  EdgeWatcher(const EdgeWatcher&) = delete;
  EdgeWatcher& operator=(const EdgeWatcher&) = delete;

  bool StartWatching();
  void StopWatching();

  void AddObserver(Observer* observer);
  void RemoveObserver(const Observer* observer);

  // TaskManagerClient::Observer:
  void OnConnected(ULONG process_id) override;

  void OnConnectionClosed(ULONG process_id) override;

  void OnGotSnapshot(
      ULONG process_id,
      const std::vector<external_task_manager::mojom::Task>& tasks) override;

 private:
  void OnProcessCreated();

  void CheckForBrowserProcesses();

  void OnBrowserProcessFound(ULONG process_id);

  struct WatchedBrowserProcess {
    ULONG process_id;
    TaskManagerClient task_manager_client;
  };

  BrowserCreationWatcher browser_creation_watcher_;
  ProcessDataProvider process_data_provider_;
  std::map<ULONG, std::unique_ptr<WatchedBrowserProcess>> browser_processes_;
  base::ObserverList<Observer> observers_;
};

}  // namespace process_viewer

#endif  // TOOLS_WIN_PROCESS_VIEWER_EDGE_PROCESS_WATCHER_EDGE_WATCHER_H_
