// Copyright (C) Microsoft Corp. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef V8_V8_INSPECTOR_MSEDGE_ONLY_H_
#define V8_V8_INSPECTOR_MSEDGE_ONLY_H_

#include <stdint.h>

#include <cctype>
#include <memory>

#include "v8-isolate.h"       // NOLINT(build/include_directory)
#include "v8-local-handle.h"  // NOLINT(build/include_directory)

/**
 * This file contains interface declarations for the Edge-only Inspector
 * API additions used by DevTools "Rehydrate" functionality. This
 * feature work enables Blink/CDP to produce a log file that contains
 * metadata about code that is running in a particular tab, which can
 * allow DevTools to load performance and memory traces as if it was
 * captured in a live debugging session.
 *
 * https://microsoft.visualstudio.com/Edge/_workitems/edit/40131339
 */

namespace v8_inspector {

// Forward declares
namespace protocol {

namespace Runtime {
namespace API {
class RemoteObject;
class StackTrace;
class ExceptionDetails;
}  // namespace API
}  // namespace Runtime

class DictionaryValue;

}  // namespace protocol

class StringView;

// To be implemented by the host. Callee must copy strings out before
// returning from callback; strings will be deallocated after call.
class V8_EXPORT V8ScriptEnumerationDelegate {
 public:
  virtual void ScriptEnumerated(int scriptId, StringView url, int startLine,
                                int startColumn, int endLine, int endColumn,
                                int contextId, StringView hash,
                                StringView souceMapURL, bool hasSourceURL,
                                bool isModule, int length, int scriptLanguage,
                                StringView scriptSource) = 0;
};

// To be implemented by the host. Callee must copy strings out before
// returning from callback; strings will be deallocated after call.
class V8_EXPORT V8ExecutionContextEnumerationDelegate {
 public:
  virtual void ExecutionContextEnumerated(int id, StringView origin,
                                          StringView name,
                                          StringView uniqueId) = 0;
};

// To be implemented by the host. Callee must copy strings out before
// returning from callback; strings will be deallocated after call.
class V8_EXPORT V8RemoteObjectListEnumerationDelegate {
 public:
  virtual void OnObject(
      std::unique_ptr<protocol::Runtime::API::RemoteObject> obj) = 0;
};

// To be implemented internally to support enumerating objects.
class V8_EXPORT V8RemoteObjectListEnumerator {
 public:
  virtual void Enumerate(V8RemoteObjectListEnumerationDelegate* receiver) = 0;
  virtual ~V8RemoteObjectListEnumerator() = default;
};

// To be implemented by the host. Callee must copy strings out before
// returning from callback; strings will be deallocated after call.
class V8_EXPORT V8RuntimeMessageEnumerationDelegate {
 public:
  virtual void MessageEnumerated(
      StringView type, V8RemoteObjectListEnumerator* args,
      int executionContextId, double timestamp,
      std::unique_ptr<protocol::Runtime::API::StackTrace> stackTrace,
      StringView context) = 0;

  virtual void ExceptionThrown(
      double timestamp,
      std::unique_ptr<protocol::Runtime::API::ExceptionDetails>
          exceptionDetails) = 0;

  virtual void ExceptionRevoked(StringView reason, uint32_t exceptionId) = 0;
};

}  // namespace v8_inspector

#endif  // V8_V8_INSPECTOR_MSEDGE_ONLY_H_
