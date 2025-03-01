// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/edge_process_watcher/edge_watcher_server.h"

#include <windows.h>

#include "mojo/public/cpp/platform/named_platform_channel.h"
#include "tools/win/process_viewer/common/edge_watcher_common.h"

namespace process_viewer {

EdgeWatcherServer::EdgeWatcherServer() : receiver_(this), weak_factory_(this) {}

EdgeWatcherServer::~EdgeWatcherServer() = default;

void EdgeWatcherServer::StartServer() {
  mojo::NamedPlatformChannel::Options options;
  options.server_name =
      mojo::NamedPlatformChannel::ServerNameFromUTF8(kEdgeWatcherChannelName);
  mojo::NamedPlatformChannel named_channel(options);

  mojo::PlatformChannelServerEndpoint server_endpoint(
      named_channel.TakeServerEndpoint());

  mojo_connection_ = std::make_unique<mojo::IsolatedConnection>();
  auto message_pipe = mojo_connection_->Connect(std::move(server_endpoint));

  receiver_.Bind(
    mojo::PendingReceiver<mojom::EdgeWatcher>(std::move(message_pipe)));
  receiver_.set_disconnect_handler(base::BindOnce(
      &EdgeWatcherServer::OnConnectionError, base::Unretained(this)));
}

void EdgeWatcherServer::SetClient(
    base::ProcessId client_process_id,
    mojo::PendingAssociatedRemote<mojom::EdgeWatcherClient> client) {
  client_process_handle_.Set(
      OpenProcess(PROCESS_DUP_HANDLE, FALSE, client_process_id));
  client_.Bind(std::move(client));

  // When the client first connects, send details of all current regions.
  for (const auto& element : shared_memory_regions_) {
    NotifySharedMemoryRegionChanged(element.first, *element.second);
  }
}

void EdgeWatcherServer::OnSharedMemoryRegionChanged(
    base::ProcessId browser_process_id,
    const base::ReadOnlySharedMemoryRegion& region) {
  shared_memory_regions_[browser_process_id] =
      std::make_unique<base::ReadOnlySharedMemoryRegion>(region.Duplicate());
  NotifySharedMemoryRegionChanged(browser_process_id, region);
}

void EdgeWatcherServer::NotifySharedMemoryRegionChanged(
    base::ProcessId browser_process_id,
    const base::ReadOnlySharedMemoryRegion& region) {
  if (!client_) {
    return;
  }

  // Get a handle to the region that is usable by the client.
  base::subtle::PlatformSharedMemoryRegion duplicate_region =
      base::ReadOnlySharedMemoryRegion::TakeHandleForSerialization(
          region.Duplicate());
  auto duplicate_region_handle = duplicate_region.PassPlatformHandle();

  HANDLE client_region_handle;
  if (!DuplicateHandle(GetCurrentProcess(), duplicate_region_handle.Get(),
                       client_process_handle_.Get(), &client_region_handle, 0,
                       FALSE, DUPLICATE_SAME_ACCESS)) {
    return;
  }

  // Send the new region's details to the client.
  const base::UnguessableToken& guid = region.GetGUID();
  client_->OnSharedMemoryRegionChanged(
      browser_process_id, HandleToUlong(client_region_handle), region.GetSize(),
      guid.GetHighForSerialization(), guid.GetLowForSerialization());
}

void EdgeWatcherServer::OnConnectionError() {
  client_process_handle_.Close();
  client_.reset();
  receiver_.reset();
  mojo_connection_.reset();

  // Once the connection is closed, start listening for a new connection.
  base::SequencedTaskRunner::GetCurrentDefault()->PostTask(
      FROM_HERE, base::BindOnce(&EdgeWatcherServer::StartServer,
                                weak_factory_.GetWeakPtr()));
}

}  // namespace process_viewer
