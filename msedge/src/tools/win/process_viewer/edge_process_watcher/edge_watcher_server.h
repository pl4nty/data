// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_EDGE_PROCESS_WATCHER_EDGE_WATCHER_SERVER_H_
#define TOOLS_WIN_PROCESS_VIEWER_EDGE_PROCESS_WATCHER_EDGE_WATCHER_SERVER_H_

#include <memory>

#include "base/memory/read_only_shared_memory_region.h"
#include "base/memory/weak_ptr.h"
#include "base/process/process_handle.h"
#include "mojo/public/cpp/bindings/receiver.h"
#include "mojo/public/cpp/system/isolated_connection.h"
#include "mojo/public/cpp/bindings/associated_remote.h"
#include "tools/win/process_viewer/common/edge_watcher.mojom.h"
#include "tools/win/process_viewer/edge_process_watcher/edge_watcher.h"

namespace process_viewer {

// This class acts as the server side of an isolated Mojo connection, and will
// notify the client of all shared memory regions containing the tasks from Edge
// browser processes.
class EdgeWatcherServer : public mojom::EdgeWatcher,
                          public EdgeWatcher::Observer {
 public:
  EdgeWatcherServer();
  ~EdgeWatcherServer() override;
  EdgeWatcherServer(const EdgeWatcherServer&) = delete;
  EdgeWatcherServer& operator=(const EdgeWatcherServer&) = delete;

  void StartServer();

  // mojom::EdgeWatcher:
  void SetClient(
      base::ProcessId client_process_id,
      mojo::PendingAssociatedRemote<mojom::EdgeWatcherClient> client) override;

  // EdgeWatcher::Observer:
  void OnSharedMemoryRegionChanged(
      ULONG browser_process_id,
      const base::ReadOnlySharedMemoryRegion& region) override;

 private:
  void NotifySharedMemoryRegionChanged(
      ULONG browser_process_id,
      const base::ReadOnlySharedMemoryRegion& region);

  void OnConnectionError();

  std::unique_ptr<mojo::IsolatedConnection> mojo_connection_;
  mojo::Receiver<mojom::EdgeWatcher> receiver_;
  mojo::AssociatedRemote<mojom::EdgeWatcherClient> client_;
  base::win::ScopedHandle client_process_handle_;
  std::map<ULONG, std::unique_ptr<base::ReadOnlySharedMemoryRegion>>
      shared_memory_regions_;

  base::WeakPtrFactory<EdgeWatcherServer> weak_factory_;
};

}  // namespace process_viewer

#endif  // TOOLS_WIN_PROCESS_VIEWER_EDGE_PROCESS_WATCHER_EDGE_WATCHER_SERVER_H_
