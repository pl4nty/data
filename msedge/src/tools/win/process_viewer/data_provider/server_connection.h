// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_SERVER_CONNECTION_H_
#define TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_SERVER_CONNECTION_H_

#include "base/functional/callback.h"
#include "base/process/process_handle.h"
#include "base/sequence_checker.h"
#include "base/task/sequenced_task_runner.h"
#include "base/synchronization/waitable_event.h"
#include "base/synchronization/waitable_event_watcher.h"
#include "mojo/public/cpp/system/message_pipe.h"
#include "mojo/public/cpp/system/trap.h"

namespace process_viewer {

// This class encapsulates the implementation of IPC with the Edge browser
// process. All methods must be called from the sequence corresponding to the
// SequencedTaskRunner passed to the constructor (but the constructor itself
// may be called from a different sequence).
class ServerConnection {
 public:
  // Called when a message is received over the IPC channel from the Edge
  // browser process.
  using OnMessageReceivedCallback =
      base::RepeatingCallback<void(const void* payload, uint32_t payload_size)>;

  // Called when the connection with the Edge browser process is terminated from
  // the other end or in response to an error. Not called when the connection is
  // deliberately terminated by a call to Disconnect.
  using OnConnectionClosedCallback = base::RepeatingCallback<void()>;

  explicit ServerConnection(
      scoped_refptr<base::SequencedTaskRunner> task_runner,
      OnMessageReceivedCallback on_message_received_callback,
      OnConnectionClosedCallback on_connection_closed_callback);
  ~ServerConnection();
  ServerConnection(const ServerConnection&) = delete;
  ServerConnection& operator=(const ServerConnection&) = delete;

  // Establishes a connection with the Edge browser process with the specified
  // process ID.
  bool Connect(base::ProcessId server_process_id);

  // Terminates the connection with the Edge browser process.
  void Disconnect();

  // Sends a message over the IPC channel to the Edge browser process.
  bool WriteMessage(const void* payload, uint32_t payload_size);

 private:
  // Callback invoked when the message pipe becomes readable.
  static void TrapEventHandler(const MojoTrapEvent* event);

  std::wstring GetServerName(base::ProcessId server_process_id) const;

  bool ArmPipeReadableTrap();

  void OnTrapEvent(MojoResult result);

  void OnMessageReceived(base::WaitableEvent* waitable_event);

  void OnPipeClosed(base::WaitableEvent* waitable_event);

  mojo::ScopedMessagePipeHandle message_pipe_handle_;
  mojo::ScopedTrapHandle trap_handle_;

  scoped_refptr<base::SequencedTaskRunner> task_runner_;
  OnMessageReceivedCallback on_message_received_callback_;
  OnConnectionClosedCallback on_connection_closed_callback_;

  base::WaitableEvent message_received_event_;
  base::WaitableEventWatcher message_received_event_watcher_;
  base::WaitableEvent pipe_closed_event_;
  base::WaitableEventWatcher pipe_closed_event_watcher_;

  DWORD session_id_ = 0;
  std::wstring user_sid_;

  SEQUENCE_CHECKER(sequence_checker_);
};

}  // namespace process_viewer

#endif  // TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_SERVER_CONNECTION_H_
