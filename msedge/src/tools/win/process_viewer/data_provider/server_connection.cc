// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/data_provider/server_connection.h"

#include <windows.h>

#include <sddl.h>
#include <stdio.h>
#include <string>

#include "base/functional/bind.h"
#include "base/process/process.h"
#include "base/stl_util.h"
#include "base/strings/strcat_win.h"
#include "base/strings/string_number_conversions.h"
#include "base/strings/string_util.h"
#include "base/strings/stringprintf.h"
#include "base/strings/utf_string_conversions.h"
#include "base/win/win_util.h"
#include "mojo/public/c/system/core.h"
#include "mojo/public/cpp/system/invitation.h"

namespace process_viewer {

namespace {

// An isolated invitation has a single message pipe attached with a name of
// exactly four zero-bytes.
constexpr char kMessagePipeName[] = "\0\0\0\0";

base::win::ScopedHandle GetProcessToken(base::ProcessId server_process_id) {
  base::Process process = base::Process::Open(server_process_id);
  HANDLE process_token;
  if (!::OpenProcessToken(process.Handle(), TOKEN_QUERY, &process_token)) {
    return {};
  }
  return base::win::ScopedHandle(process_token);
}

bool GetTokenSessionId(HANDLE token, DWORD* session_id) {
  DWORD size = 0;
  return !!::GetTokenInformation(token, TokenSessionId, session_id,
                                 sizeof(*session_id), &size);
}

bool GetTokenUserSid(HANDLE token, std::wstring* user_sid) {
  uint32_t user_buffer[TOKEN_USER_MAX_SIZE];
  DWORD size = 0;
  if (!::GetTokenInformation(token, TokenUser, &user_buffer,
                             std::size(user_buffer), &size)) {
    return false;
  }

  TOKEN_USER* user = reinterpret_cast<TOKEN_USER*>(&user_buffer);
  wchar_t* user_sid_raw;
  if (!::ConvertSidToStringSid(user->User.Sid, &user_sid_raw)) {
    return false;
  }

  *user_sid = user_sid_raw;
  ::LocalFree(user_sid_raw);
  return true;
}

base::win::ScopedHandle OpenNamedPipeForChannel(
    const std::wstring& server_name) {
  base::win::ScopedHandle named_pipe;
  while (true) {
    SECURITY_ATTRIBUTES security_attributes = {sizeof(SECURITY_ATTRIBUTES),
                                               nullptr, TRUE};
    constexpr DWORD kFlags =
        SECURITY_SQOS_PRESENT | SECURITY_ANONYMOUS | FILE_FLAG_OVERLAPPED;

    named_pipe.Set(CreateFile(server_name.c_str(), GENERIC_READ | GENERIC_WRITE,
                              0, &security_attributes, OPEN_EXISTING, kFlags,
                              nullptr));
    if (named_pipe.IsValid()) {
      break;
    }

    // Exit if an error other than ERROR_PIPE_BUSY occurs.
    if (GetLastError() != ERROR_PIPE_BUSY) {
      return {};
    }

    // All pipe instances are busy, so wait for 5 seconds then try again.
    if (!WaitNamedPipe(server_name.c_str(), 5000)) {
      return {};
    }
  }
  return named_pipe;
}

}  // namespace

ServerConnection::ServerConnection(
    scoped_refptr<base::SequencedTaskRunner> task_runner,
    OnMessageReceivedCallback on_message_received_callback,
    OnConnectionClosedCallback on_connection_closed_callback)
    : task_runner_(task_runner),
      on_message_received_callback_(on_message_received_callback),
      on_connection_closed_callback_(on_connection_closed_callback),
      message_received_event_(base::WaitableEvent::ResetPolicy::AUTOMATIC),
      pipe_closed_event_(base::WaitableEvent::ResetPolicy::AUTOMATIC) {
  DETACH_FROM_SEQUENCE(sequence_checker_);

  ::ProcessIdToSessionId(GetCurrentProcessId(), &session_id_);
  base::win::GetUserSidString(&user_sid_);
}

ServerConnection::~ServerConnection() = default;

bool ServerConnection::Connect(base::ProcessId server_process_id) {
  DCHECK_CALLED_ON_VALID_SEQUENCE(sequence_checker_);

  std::wstring server_name = GetServerName(server_process_id);
  if (server_name.empty()) {
    return false;
  }
  base::win::ScopedHandle named_pipe = OpenNamedPipeForChannel(server_name);
  if (!named_pipe.IsValid()) {
    return false;
  }

  MojoPlatformHandle named_pipe_handle;
  named_pipe_handle.struct_size = sizeof(named_pipe_handle);
  named_pipe_handle.type = MOJO_PLATFORM_HANDLE_TYPE_WINDOWS_HANDLE;
  named_pipe_handle.value = reinterpret_cast<uint64_t>(named_pipe.Take());

  MojoInvitationTransportEndpoint transport_endpoint;
  transport_endpoint.struct_size = sizeof(transport_endpoint);
  transport_endpoint.type = MOJO_INVITATION_TRANSPORT_TYPE_CHANNEL;
  transport_endpoint.num_platform_handles = 1;
  transport_endpoint.platform_handles = &named_pipe_handle;

  MojoAcceptInvitationOptions options;
  options.struct_size = sizeof(options);
  options.flags = MOJO_ACCEPT_INVITATION_FLAG_ISOLATED;

  MojoHandle raw_invitation_handle;
  MojoResult result = MojoAcceptInvitation(&transport_endpoint, &options,
                                           &raw_invitation_handle);
  if (result != MOJO_RESULT_OK) {
    return false;
  }
  mojo::ScopedInvitationHandle invitation_handle{
      mojo::InvitationHandle(raw_invitation_handle)};

  MojoHandle raw_message_pipe_handle;
  result = MojoExtractMessagePipeFromInvitation(
      invitation_handle.get().value(), kMessagePipeName,
      sizeof(kMessagePipeName) - 1, nullptr, &raw_message_pipe_handle);
  if (result != MOJO_RESULT_OK) {
    return false;
  }
  message_pipe_handle_.reset(mojo::MessagePipeHandle(raw_message_pipe_handle));
  return ArmPipeReadableTrap();
}

void ServerConnection::Disconnect() {
  DCHECK_CALLED_ON_VALID_SEQUENCE(sequence_checker_);

  message_received_event_watcher_.StopWatching();
  pipe_closed_event_watcher_.StopWatching();
  trap_handle_.reset();
  message_pipe_handle_.reset();

  // Closing the trap handle will invoke the trap event handler, so reset the
  // events after that happens.
  message_received_event_.Reset();
  pipe_closed_event_.Reset();
}

bool ServerConnection::WriteMessage(const void* payload,
                                    uint32_t payload_size) {
  DCHECK_CALLED_ON_VALID_SEQUENCE(sequence_checker_);

  MojoMessageHandle message_handle;
  MojoResult result = MojoCreateMessage(nullptr, &message_handle);
  if (result == MOJO_RESULT_OK) {
    MojoAppendMessageDataOptions append_options;
    append_options.struct_size = sizeof(append_options);
    append_options.flags = MOJO_APPEND_MESSAGE_DATA_FLAG_COMMIT_SIZE;

    void* buffer;
    uint32_t buffer_size;
    result = MojoAppendMessageData(message_handle, payload_size, nullptr, 0,
                                   &append_options, &buffer, &buffer_size);
    if (result == MOJO_RESULT_OK) {
      memcpy(buffer, payload, payload_size);
      result = MojoWriteMessage(message_pipe_handle_.get().value(),
                                message_handle, nullptr);
      if (result == MOJO_RESULT_OK) {
        return true;
      }
    }
    MojoClose(message_handle);
  }
  return false;
}

std::wstring ServerConnection::GetServerName(
    base::ProcessId server_process_id) const {
  // When running via TShell, we run as Local System in Session 0. If Edge is
  // also running in Session 0, but as a different user, then we need to specify
  // a fully-qualified pipe name. This happens on WCOS.
  bool use_local_pipe_name = true;
  DWORD server_session_id = 0;
  std::wstring server_user_sid;
  if (session_id_ == 0) {
    base::win::ScopedHandle process_token = GetProcessToken(server_process_id);
    if (!process_token.IsValid()) {
      return {};
    }
    if (!GetTokenSessionId(process_token.Get(), &server_session_id)) {
      return {};
    }

    if (server_session_id == 0) {
      if (!GetTokenUserSid(process_token.Get(), &server_user_sid)) {
        return {};
      }
      if (server_user_sid != user_sid_) {
        use_local_pipe_name = false;
      }
    }
  }

  std::wstring pipe_subpath =
      use_local_pipe_name
          ? L"LOCAL"
          : base::StrCat(
                {L"Sessions\\",
                 base::ASCIIToWide(base::NumberToString(server_session_id)),
                 L"\\BaseNamedObjects\\", server_user_sid.c_str()});

  return base::StrCat(
      {L"\\\\.\\pipe\\", pipe_subpath.c_str(), L"\\mojo.external_task_manager_",
       base::ASCIIToWide(base::NumberToString(server_process_id))});
}

bool ServerConnection::ArmPipeReadableTrap() {
  DCHECK_CALLED_ON_VALID_SEQUENCE(sequence_checker_);

  MojoResult result = MOJO_RESULT_OK;
  if (!trap_handle_) {
    MojoHandle raw_trap_handle;
    result = MojoCreateTrap(&ServerConnection::TrapEventHandler, nullptr,
                            &raw_trap_handle);
    if (result != MOJO_RESULT_OK) {
      return false;
    }
    trap_handle_.reset(mojo::TrapHandle(raw_trap_handle));

    uintptr_t context = reinterpret_cast<uintptr_t>(this);
    result = MojoAddTrigger(
        trap_handle_.get().value(), message_pipe_handle_.get().value(),
        MOJO_HANDLE_SIGNAL_READABLE, MOJO_TRIGGER_CONDITION_SIGNALS_SATISFIED,
        context, nullptr);
    if (result != MOJO_RESULT_OK) {
      return false;
    }
  }

  message_received_event_watcher_.StartWatching(
      &message_received_event_,
      base::BindOnce(&ServerConnection::OnMessageReceived,
                     base::Unretained(this)),
      task_runner_);
  pipe_closed_event_watcher_.StartWatching(
      &pipe_closed_event_,
      base::BindOnce(&ServerConnection::OnPipeClosed, base::Unretained(this)),
      task_runner_);

  MojoTrapEvent trap_event;
  trap_event.struct_size = sizeof(trap_event);
  uint32_t num_blocking_events = 1;
  result = MojoArmTrap(trap_handle_.get().value(), nullptr,
                       &num_blocking_events, &trap_event);
  if (result == MOJO_RESULT_FAILED_PRECONDITION) {
    // We failed to arm the trap because the message pipe is already readable,
    // so invoke our trap event handler to read from the pipe.
    DCHECK_EQ(1u, num_blocking_events);
    DCHECK_EQ(reinterpret_cast<uintptr_t>(this), trap_event.trigger_context);
    task_runner_->PostTask(
        FROM_HERE, base::BindOnce(&ServerConnection::OnTrapEvent,
                                  base::Unretained(this), trap_event.result));
    return true;
  }
  if (result != MOJO_RESULT_OK) {
    return false;
  }
  return true;
}

// Static. This can be called on an arbitrary thread.
void ServerConnection::TrapEventHandler(const MojoTrapEvent* event) {
  ServerConnection* server_connection =
      reinterpret_cast<ServerConnection*>(event->trigger_context);
  server_connection->OnTrapEvent(event->result);
}

// This can be called on an arbitrary thread.
void ServerConnection::OnTrapEvent(MojoResult result) {
  switch (result) {
    case MOJO_RESULT_OK:
      message_received_event_.Signal();
      break;
    case MOJO_RESULT_FAILED_PRECONDITION:
    case MOJO_RESULT_CANCELLED:
    default:
      pipe_closed_event_.Signal();
      break;
  }
}

void ServerConnection::OnMessageReceived(base::WaitableEvent* waitable_event) {
  DCHECK_CALLED_ON_VALID_SEQUENCE(sequence_checker_);

  // Stop watching the other event once the trap has fired.
  pipe_closed_event_watcher_.StopWatching();

  // Read all messages in the message pipe and invoke the callback on each,
  // then re-arm the trap for new messages.
  MojoResult result = MOJO_RESULT_OK;
  while (result == MOJO_RESULT_OK) {
    MojoMessageHandle raw_message_handle;
    result = MojoReadMessage(message_pipe_handle_.get().value(), nullptr,
                             &raw_message_handle);
    if (result == MOJO_RESULT_SHOULD_WAIT) {
      ArmPipeReadableTrap();
      return;
    }
    if (result != MOJO_RESULT_OK) {
      return;
    }
    mojo::ScopedMessageHandle message_handle{
        mojo::MessageHandle(raw_message_handle)};

    void* buffer;
    uint32_t buffer_size;
    result = MojoGetMessageData(message_handle.get().value(), nullptr, &buffer,
                                &buffer_size, nullptr, nullptr);
    if (result != MOJO_RESULT_OK) {
      return;
    }
    on_message_received_callback_.Run(buffer, buffer_size);
  }
}

void ServerConnection::OnPipeClosed(base::WaitableEvent* waitable_event) {
  DCHECK_CALLED_ON_VALID_SEQUENCE(sequence_checker_);
  Disconnect();
  on_connection_closed_callback_.Run();
}

}  // namespace process_viewer
