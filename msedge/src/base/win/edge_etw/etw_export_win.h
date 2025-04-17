// Copyright 2023 The Chromium Authors
// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef BASE_WIN_EDGE_ETW_ETW_EXPORT_WIN_H_
#define BASE_WIN_EDGE_ETW_ETW_EXPORT_WIN_H_

#include <stdint.h>

#include "base/synchronization/waitable_event.h"

// Forward declaration
class TlmInt64Field;
class TlmUInt64Field;
class TlmMbcsStringField;

namespace base {

namespace trace_event {
class TraceArguments;
}

namespace tracing {

// Enables exporting of track events to ETW in the current process.
BASE_EXPORT void EnableETWExport();
BASE_EXPORT void SetETWProvider(const wchar_t* base_app_id,
                                bool log_ETW_directly = false);
BASE_EXPORT void SetStartupTraceConfig(const char* config_json);
BASE_EXPORT void SetETWRundown(
    void (*rundown_function)(base::WaitableEvent* sync));

BASE_EXPORT bool IsEtwEventEnabled(uint64_t keyword);

BASE_EXPORT void AddRqvDurationEventETW(const char* name, int64_t duration);
BASE_EXPORT void AddEtwDurationEventETW(const char* category_group,
                                        const char* name,
                                        int64_t duration,
                                        int64_t ms_since_done,
                                        const char* domain);
BASE_EXPORT void AddEtwEvent(const char* category_group,
                             const char* name,
                             const TlmInt64Field& event_field);
BASE_EXPORT void AddEtwEvent(const char* category_group,
                             const char* name,
                             const TlmUInt64Field& event_field);

BASE_EXPORT void AddEtwEventDirectly(
    uint64_t keyword,
    const char* name,
    const base::trace_event::TraceArguments* args);

BASE_EXPORT void AddEtwEvent(const char* category_group,
                             const char* name,
                             const TlmMbcsStringField& event_field);
BASE_EXPORT void AddEtwEvent(const char* category_group,
                             const char* name,
                             const TlmMbcsStringField& event_field1,
                             const TlmMbcsStringField& event_field2);
BASE_EXPORT void AddEtwEvent(const char* category_group,
                             const char* name,
                             const TlmMbcsStringField& event_field,
                             const TlmInt64Field& event_field2);

}  // namespace tracing
}  // namespace base
#endif  // BASE_WIN_EDGE_ETW_ETW_EXPORT_WIN_H_
