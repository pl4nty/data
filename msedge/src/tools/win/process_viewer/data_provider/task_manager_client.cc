// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "tools/win/process_viewer/data_provider/task_manager_client.h"

#include <windows.h>

#include "base/functional/bind.h"
#include "base/pickle.h"
#include "base/strings/utf_string_conversions.h"
#include "base/task/sequenced_task_runner.h"
#include "chrome/common/edge_external_task_manager_shared.h"
#include "device/base/synchronization/one_writer_seqlock.h"
#include "third_party/abseil-cpp/absl/types/optional.h"
#include "tools/win/process_viewer/data_provider/server_connection.h"

namespace process_viewer {

using edge_external_task_manager::MessageIdFromClient;
using edge_external_task_manager::MessageIdFromServer;

namespace {

// Once the IPC channel has been established, communication between the client
// (this process) and the server (the Edge browser process) occurs by sending
// messages. All messages have the following format:
//   1. Message ID
//   2. Message-specific payload
//
// With their initial messages, the server and client will inform each other
// which version of the communication protocol they're using. Both client and
// server should maintain backward compatibility by only sending message data
// expected by the protocol version supported by the other process.

constexpr int kInvalidProtocolVersion = 0;
constexpr int kProtocolVersion = 1;

void SetMessageHeader(MessageIdFromClient message_id, base::Pickle* payload) {
  payload->WriteInt(static_cast<int>(message_id));
}

bool DeserializeTaskData(base::PickleIterator* iter, std::vector<Task>* tasks) {
  uint32_t task_count;
  if (!iter->ReadUInt32(&task_count)) {
    return false;
  }

  tasks->resize(task_count);
  for (uint32_t i = 0; i < task_count; i++) {
    int64_t task_id;
    if (!iter->ReadInt64(&task_id)) {
      return false;
    }
    tasks->at(i).task_id = task_id;

    int process_id;
    if (!iter->ReadInt(&process_id)) {
      return false;
    }
    tasks->at(i).process_id = process_id;

    std::u16string title;
    if (!iter->ReadString16(&title)) {
      return false;
    }
    tasks->at(i).title = base::UTF16ToWide(title);
  }
  return true;
}

}  // namespace

TaskManagerClient::TaskManagerClient()
    : TaskManagerClient(base::SequencedTaskRunner::GetCurrentDefault()) {}

TaskManagerClient::TaskManagerClient(
    scoped_refptr<base::SequencedTaskRunner> task_runner) {
  DCHECK(task_runner);
  task_runner_ = task_runner;

  server_connection_ = std::make_unique<ServerConnection>(
      task_runner_,
      base::BindRepeating(&TaskManagerClient::OnMessageReceived,
                          base::Unretained(this)),
      base::BindRepeating(&TaskManagerClient::OnConnectionClosed,
                          base::Unretained(this)));
}

TaskManagerClient::~TaskManagerClient() = default;

bool TaskManagerClient::ConnectToServer(ULONG process_id) {
  DCHECK(task_runner_->RunsTasksInCurrentSequence());
  if (!server_connection_ || IsConnected()) {
    return false;
  }
  if (!server_connection_->Connect(process_id)) {
    return false;
  }
  process_id_ = process_id;
  return true;
}

void TaskManagerClient::Disconnect() {
  DCHECK(task_runner_->RunsTasksInCurrentSequence());
  server_connection_->Disconnect();
  process_id_ = 0;
  SetServerProtocolVersion(kInvalidProtocolVersion);
  shared_memory_mapping_ = {};
  shared_memory_region_ = {};
}

bool TaskManagerClient::RequestSnapshot() {
  DCHECK(task_runner_->RunsTasksInCurrentSequence());
  if (!IsConnected()) {
    return false;
  }
  WriteMessage(MessageIdFromClient::kGetSnapshot);
  return true;
}

bool TaskManagerClient::StartMonitoring() {
  DCHECK(task_runner_->RunsTasksInCurrentSequence());
  if (!IsConnected()) {
    return false;
  }
  WriteMessage(MessageIdFromClient::kStartUpdatingInSharedMemory);
  return true;
}

bool TaskManagerClient::StopMonitoring() {
  DCHECK(task_runner_->RunsTasksInCurrentSequence());
  if (!IsConnected()) {
    return false;
  }
  WriteMessage(MessageIdFromClient::kStopUpdatingInSharedMemory);
  return true;
}

bool TaskManagerClient::GetMonitoredTasks(std::vector<Task>* tasks) {
  DCHECK(task_runner_->RunsTasksInCurrentSequence());
  if (!shared_memory_mapping_.IsValid()) {
    return false;
  }
  return GetMonitoredDataFromBuffer(shared_memory_mapping_.memory(),
                                    shared_memory_mapping_.size(), tasks);
}

void TaskManagerClient::AddObserver(Observer* observer) {
  DCHECK(task_runner_->RunsTasksInCurrentSequence());
  observers_.AddObserver(observer);
}

void TaskManagerClient::RemoveObserver(const Observer* observer) {
  DCHECK(task_runner_->RunsTasksInCurrentSequence());
  observers_.RemoveObserver(observer);
}

bool TaskManagerClient::GetMonitoredDataFromBuffer(const void* buffer,
                                                   size_t buffer_size,
                                                   std::vector<Task>* tasks) {
  if (!buffer) {
    return false;
  }

  const device::OneWriterSeqLock* shared_memory_seqlock =
      static_cast<const device::OneWriterSeqLock*>(buffer);

  const void* shared_memory_data =
      static_cast<const char*>(buffer) + sizeof(*shared_memory_seqlock);
  size_t shared_memory_data_size = buffer_size - sizeof(*shared_memory_seqlock);

  // Try to copy the data buffer from shared memory. In the case of contention
  // with the browser process, limit the number of tries to avoid long blocking.
  constexpr int kMaxTries = 5;
  int try_count = 0;
  base::subtle::Atomic32 version;
  auto copied_buffer = std::make_unique<char[]>(shared_memory_data_size);
  do {
    if (try_count == kMaxTries) {
      return false;
    }
    try_count++;
    version = shared_memory_seqlock->ReadBegin();
    memcpy(copied_buffer.get(), shared_memory_data, shared_memory_data_size);
  } while (shared_memory_seqlock->ReadRetry(version));

  // We successfully copied the shared memory buffer, now read out the tasks.
  const base::Pickle::Header* header =
      reinterpret_cast<const base::Pickle::Header*>(copied_buffer.get());
  if (shared_memory_data_size < sizeof(*header) ||
      header->payload_size > shared_memory_data_size - sizeof(*header)) {
    return false;
  }

  base::Pickle pickle =
      base::Pickle::WithData(base::byte_span_from_ref(copied_buffer.get()));
  base::PickleIterator iter(pickle);
  if (!DeserializeTaskData(&iter, tasks)) {
    return false;
  }
  return true;
}

void TaskManagerClient::WriteMessage(MessageIdFromClient message_id) {
  base::Pickle pickle;
  SetMessageHeader(message_id, &pickle);
  server_connection_->WriteMessage(pickle.data(), pickle.size());
}

void TaskManagerClient::OnMessageReceived(const void* payload,
                                          uint32_t payload_size) {
  DCHECK(task_runner_->RunsTasksInCurrentSequence());
  base::Pickle pickle =
      base::Pickle::WithData(base::byte_span_from_ref(payload));
  base::PickleIterator iter(pickle);

  int message_id;
  if (!iter.ReadInt(&message_id)) {
    return;
  }

  switch (static_cast<MessageIdFromServer>(message_id)) {
    case MessageIdFromServer::kVersion:
      HandleVersionMessage(&iter);
      break;
    case MessageIdFromServer::kSnapshotResult:
      HandleSnapshotMessage(&iter);
      break;
    case MessageIdFromServer::kUpdatedSharedMemoryLocation:
      HandleUpdatedSharedMemoryLocationMessage(&iter);
      break;
  }
}

void TaskManagerClient::OnConnectionClosed() {
  DCHECK(task_runner_->RunsTasksInCurrentSequence());
  Disconnect();
  for (Observer& observer : observers_) {
    observer.OnConnectionClosed(process_id_);
  }
}

void TaskManagerClient::HandleVersionMessage(base::PickleIterator* iter) {
  // Ignore any version message after the first.
  if (IsConnected()) {
    return;
  }

  int version;
  if (!iter->ReadInt(&version)) {
    return;
  }
  SetServerProtocolVersion(version);

  // Inform the server of the protocol version we'll be using.
  base::Pickle pickle;
  SetMessageHeader(MessageIdFromClient::kConnected, &pickle);
  pickle.WriteInt(kProtocolVersion);
  pickle.WriteInt(GetCurrentProcessId());
  server_connection_->WriteMessage(pickle.data(), pickle.size());

  for (Observer& observer : observers_) {
    observer.OnConnected(process_id_);
  }
}

void TaskManagerClient::HandleSnapshotMessage(base::PickleIterator* iter) {
  if (!IsConnected()) {
    return;
  }

  std::vector<Task> tasks;
  if (!DeserializeTaskData(iter, &tasks)) {
    return;
  }

  for (Observer& observer : observers_) {
    observer.OnGotSnapshot(process_id_, tasks);
  }
}

void TaskManagerClient::HandleUpdatedSharedMemoryLocationMessage(
    base::PickleIterator* iter) {
  uint32_t shared_memory_handle_raw;
  if (!iter->ReadUInt32(&shared_memory_handle_raw)) {
    return;
  }
  base::win::ScopedHandle shared_memory_handle(
      ULongToHandle(shared_memory_handle_raw));
  if (!shared_memory_handle.IsValid()) {
    return;
  }
  uint64_t shared_memory_size;
  if (!iter->ReadUInt64(&shared_memory_size)) {
    return;
  }
  uint64_t guid_high;
  if (!iter->ReadUInt64(&guid_high)) {
    return;
  }
  uint64_t guid_low;
  if (!iter->ReadUInt64(&guid_low)) {
    return;
  }
  if (guid_high == 0 && guid_low == 0) {
    // Invalid UnguessableToken.
    return;
  }

  // Ignore the message if we're not connected, but only after we've read out
  // the shared memory handle, so that we don't leak it.
  if (!IsConnected()) {
    return;
  }

  constexpr auto kMode =
      base::subtle::PlatformSharedMemoryRegion::Mode::kReadOnly;
  std::optional<base::UnguessableToken> guid =
      base::UnguessableToken::Deserialize(guid_high, guid_low);
  if (!guid.has_value()) {
    return;
  }
  auto shared_memory_region = base::ReadOnlySharedMemoryRegion::Deserialize(
      base::subtle::PlatformSharedMemoryRegion::Take(
          std::move(shared_memory_handle), kMode, shared_memory_size, guid.value()));
  if (!shared_memory_region.IsValid()) {
    return;
  }

  auto shared_memory_mapping = shared_memory_region.Map();
  if (!shared_memory_mapping.IsValid()) {
    return;
  }

  shared_memory_region_ = std::move(shared_memory_region);
  shared_memory_mapping_ = std::move(shared_memory_mapping);

  for (Observer& observer : observers_) {
    observer.OnSharedMemoryRegionChanged(process_id_, shared_memory_region_);
  }
}

bool TaskManagerClient::IsConnected() {
  return server_protocol_version_ != kInvalidProtocolVersion;
}

void TaskManagerClient::SetServerProtocolVersion(int version) {
  // Don't allow changing from one valid version to another.
  DCHECK(version == kInvalidProtocolVersion ||
         server_protocol_version_ == kInvalidProtocolVersion);
  server_protocol_version_ = version;
}

}  // namespace process_viewer
