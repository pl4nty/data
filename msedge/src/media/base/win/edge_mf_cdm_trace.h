// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef MEDIA_BASE_WIN_EDGE_MF_CDM_TRACE_H_
#define MEDIA_BASE_WIN_EDGE_MF_CDM_TRACE_H_

#include "base/logging.h"
#include "base/trace_event/trace_event.h"

#define STR(x) #x
#define STRSTR(x) STR(x)
#define FILE_LINE __FILE__ " : " STRSTR(__LINE__)

#if defined(_MSC_VER)
#ifndef __func__
#define __func__ __FUNCTION__
#endif
#endif

// Internals.
#define MFCDM_TRACETYPE0_INTERNAL(traceType) TRACE_EVENT0(traceType, __func__)

#define MFCDM_TRACE0_INTERNAL() MFCDM_TRACETYPE0_INTERNAL("MFCdmTrace")

#define MFCDM_TRACE1_INTERNAL(arg1) \
  TRACE_EVENT1("MFCdmTrace", __func__, #arg1, arg1)

#define MFCDM_TRACE2_INTERNAL(arg1, arg2) \
  TRACE_EVENT2("MFCdmTrace", __func__, #arg1, arg1, #arg2, arg2)

// Externals.
#define MFCDM_TRACE0() \
  { DVLOG(2); }        \
  { MFCDM_TRACE0_INTERNAL(); }

#define MFCDM_TRACE1(arg1)              \
  { DVLOG(2) << #arg1 << "=" << arg1; } \
  { MFCDM_TRACE1_INTERNAL(arg1); }

#define MFCDM_TRACE2(arg1, arg2)                                       \
  { DVLOG(2) << #arg1 << "=" << arg1 << "," << #arg2 << "=" << arg2; } \
  { MFCDM_TRACE2_INTERNAL(arg1, arg2); }

#define MFCDM_TRACE3(arg1, arg2, arg3)                                     \
  {                                                                        \
    DVLOG(2) << #arg1 << "=" << arg1 << "," << #arg2 << "=" << arg2 << "," \
             << #arg3 << "=" << arg3;                                      \
  }                                                                        \
  {MFCDM_TRACE2_INTERNAL(arg1, arg2);};                                    \
  { MFCDM_TRACE1_INTERNAL(arg3); }

#define MFCDM_TRACE4(arg1, arg2, arg3, arg4)                               \
  {                                                                        \
    DVLOG(2) << #arg1 << "=" << arg1 << "," << #arg2 << "=" << arg2 << "," \
             << #arg3 << "=" << arg3 << "," << #arg4 << "=" << arg4;       \
  }                                                                        \
  {MFCDM_TRACE2_INTERNAL(arg1, arg2);};                                    \
  { MFCDM_TRACE2_INTERNAL(arg3, arg4); }

#define MFCDM_TRACE5(arg1, arg2, arg3, arg4, arg5)                         \
  {                                                                        \
    DVLOG(2) << #arg1 << "=" << arg1 << "," << #arg2 << "=" << arg2 << "," \
             << #arg3 << "=" << arg3 << "," << #arg4 << "=" << arg4 << "," \
             << #arg5 << "=" << arg5;                                      \
  }                                                                        \
  {MFCDM_TRACE4(arg1, arg2, arg3, arg4);};                                 \
  { MFCDM_TRACE1_INTERNAL(arg5); }

#define MFCDM_TRACE6(arg1, arg2, arg3, arg4, arg5, arg6)                   \
  {                                                                        \
    DVLOG(2) << #arg1 << "=" << arg1 << "," << #arg2 << "=" << arg2 << "," \
             << #arg3 << "=" << arg3 << "," << #arg4 << "=" << arg4 << "," \
             << #arg5 << "=" << arg5 << "," << #arg6 << "=" << arg6;       \
  }                                                                        \
  {MFCDM_TRACE4(arg1, arg2, arg3, arg4);};                                 \
  { MFCDM_TRACE2_INTERNAL(arg5, arg6); }

#define MFCDM_TRACE7(arg1, arg2, arg3, arg4, arg5, arg6, arg7)             \
  {                                                                        \
    DVLOG(2) << #arg1 << "=" << arg1 << "," << #arg2 << "=" << arg2 << "," \
             << #arg3 << "=" << arg3 << "," << #arg4 << "=" << arg4 << "," \
             << #arg5 << "=" << arg5 << "," << #arg6 << "=" << arg6 << "," \
             << #arg7 << "=" << arg7;                                      \
  }                                                                        \
  {MFCDM_TRACE4(arg1, arg2, arg3, arg4);};                                 \
  { MFCDM_TRACE3(arg5, arg6, arg7); }

#define MFCDM_TRACE8(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)       \
  {                                                                        \
    DVLOG(2) << #arg1 << "=" << arg1 << "," << #arg2 << "=" << arg2 << "," \
             << #arg3 << "=" << arg3 << "," << #arg4 << "=" << arg4 << "," \
             << #arg5 << "=" << arg5 << "," << #arg6 << "=" << arg6 << "," \
             << #arg7 << "=" << arg7 << "," << #arg8 << "=" << arg8;       \
  }                                                                        \
  {MFCDM_TRACE4(arg1, arg2, arg3, arg4);};                                 \
  { MFCDM_TRACE4(arg5, arg6, arg7, arg8); }

#define MFCDM_TRACE9(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) \
  {                                                                        \
    DVLOG(2) << #arg1 << "=" << arg1 << "," << #arg2 << "=" << arg2 << "," \
             << #arg3 << "=" << arg3 << "," << #arg4 << "=" << arg4 << "," \
             << #arg5 << "=" << arg5 << "," << #arg6 << "=" << arg6 << "," \
             << #arg7 << "=" << arg7 << "," << #arg8 << "=" << arg8 << "," \
             << #arg9 << "=" << arg9;                                      \
  }                                                                        \
  {MFCDM_TRACE4(arg1, arg2, arg3, arg4);};                                 \
  {MFCDM_TRACE4(arg5, arg6, arg7, arg8);};                                 \
  { MFCDM_TRACE1_INTERNAL(arg9); }

#define MFCDM_TRACE_METHOD() \
  { MFCDM_TRACE2(__func__, static_cast<void*>(this)); }

#define MFCDM_TRACE_CONST_METHOD() \
  { MFCDM_TRACE2(__func__, static_cast<const void*>(this)); }

#define MFCDM_TRACE_MESSAGE0(message)    \
  { DVLOG(2) << "message=" << message; } \
  { TRACE_EVENT0("MFCdmTrace", message); }

#define MFCDM_TRACE_MESSAGE1(message, arg1)                             \
  { DVLOG(2) << "message=" << message << "," << #arg1 << "=" << arg1; } \
  { TRACE_EVENT1("MFCdmTrace", message, #arg1, arg1); }

#define MFCDM_TRACE_MESSAGE2(message, arg1, arg2)                           \
  {                                                                         \
    DVLOG(2) << "message=" << message << "," << #arg1 << "=" << arg1 << "," \
             << #arg2 << "=" << arg2;                                       \
  }                                                                         \
  { TRACE_EVENT2("MFCdmTrace", message, #arg1, arg1, #arg2, arg2); }

#define MFCDM_WARNING0(message)               \
  { DLOG(WARNING) << "message=" << message; } \
  { TRACE_EVENT0("MFCdmWarning", message); }

#define MFCDM_WARNING1(message, arg1)                                        \
  { DLOG(WARNING) << "message=" << message << "," << #arg1 << "=" << arg1; } \
  { TRACE_EVENT1("MFCdmWarning", message, #arg1, arg1); }

#define MFCDM_ERROR0(message)               \
  { DLOG(ERROR) << "message=" << message; } \
  { TRACE_EVENT0("MFCdmError", message); }

#define MFCDM_ERROR1(message, arg1)                                        \
  { DLOG(ERROR) << "message=" << message << "," << #arg1 << "=" << arg1; } \
  { TRACE_EVENT1("MFCdmError", message, #arg1, arg1); }

#define MFCDM_ERROR2(message, arg1, arg2)                                      \
  {                                                                            \
    DLOG(ERROR) << "message=" << message << "," << #arg1 << "=" << arg1 << "," \
                << #arg2 << "=" << arg2;                                       \
  }                                                                            \
  { TRACE_EVENT2("MFCdmError", message, #arg1, arg1, #arg2, arg2); }

// FILE_LINE is needed here to differentiate which CHK failed within a function.
#define CHK(expr)                                      \
  do {                                                 \
    hr = (expr);                                       \
    if (FAILED(hr)) {                                  \
      DLOG(ERROR) << "hr=" << hr;                      \
      TRACE_EVENT1("MFCdmError", FILE_LINE, "hr", hr); \
      return hr;                                       \
    }                                                  \
  } while (0)

// TRACE_EVENT without DVLOG. __func__ is traced by the MACROs.
#define MFCDM_TRACE_EVENT0() \
  { MFCDM_TRACE0_INTERNAL(); }

#define MFCDM_TRACE_EVENT1(arg1) \
  { MFCDM_TRACE1_INTERNAL(arg1); }

#define MFCDM_TRACE_EVENT2(arg1, arg2) \
  { MFCDM_TRACE2_INTERNAL(arg1, arg2); }

#define MFCDM_TRACE_EVENT3(arg1, arg2, arg3) \
  {MFCDM_TRACE2_INTERNAL(arg1, arg2);};       \
  { MFCDM_TRACE1_INTERNAL(arg3); }

#define MFCDM_TRACE_EVENT4(arg1, arg2, arg3, arg4) \
  {MFCDM_TRACE2_INTERNAL(arg1, arg2)};             \
  { MFCDM_TRACE2_INTERNAL(arg3, arg4); }

#define MFCDM_TRACE_EVENT5(arg1, arg2, arg3, arg4, arg5) \
  {MFCDM_TRACE4(arg1, arg2, arg3, arg4)};                \
  { MFCDM_TRACE1_INTERNAL(arg5); }

#define MFCDM_TRACE_EVENT6(arg1, arg2, arg3, arg4, arg5, arg6) \
  {MFCDM_TRACE4(arg1, arg2, arg3, arg4)};                      \
  { MFCDM_TRACE2_INTERNAL(arg5, arg6); }

#define MFCDM_TRACE_EVENT7(arg1, arg2, arg3, arg4, arg5, arg6, arg7) \
  {MFCDM_TRACE4(arg1, arg2, arg3, arg4)};                            \
  { MFCDM_TRACE3(arg5, arg6, arg7); }

#define MFCDM_TRACE_EVENT8(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8) \
  {MFCDM_TRACE4(arg1, arg2, arg3, arg4)};                                  \
  { MFCDM_TRACE4(arg5, arg6, arg7, arg8); }

#define MFCDM_TRACE_EVENT9(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, \
                           arg9)                                           \
  {MFCDM_TRACE4(arg1, arg2, arg3, arg4)};                                  \
  {MFCDM_TRACE4(arg5, arg6, arg7, arg8)};                                  \
  { MFCDM_TRACE1_INTERNAL(arg9); }

// __func__ is not traced by the MACROs.
#define MFCDM_TRACE_MESSAGE_EVENT0(message) \
  {TRACE_EVENT0("MFCdmTrace", message);}

#define MFCDM_TRACE_MESSAGE_EVENT1(message, arg1) \
  { TRACE_EVENT1("MFCdmTrace", message, #arg1, arg1); }

#define MFCDM_TRACE_MESSAGE_EVENT2(message, arg1, arg2) \
  { TRACE_EVENT2("MFCdmTrace", message, #arg1, arg1, #arg2, arg2); }

#define MFCDM_WARNING_EVENT0(message)      \
  {TRACE_EVENT0("MFCdmWarning", message);}

#define MFCDM_WARNING_EVENT1(message, arg1) \
  { TRACE_EVENT1("MFCdmWarning", message, #arg1, arg1); }

#define MFCDM_ERROR_EVENT0(message)      \
  {TRACE_EVENT0("MFCdmError", message);}

#define MFCDM_ERROR_EVENT1(message, arg1) \
  { TRACE_EVENT1("MFCdmError", message, #arg1, arg1); }

#define MFCDM_ERROR_EVENT2(message, arg1, arg2) \
  { TRACE_EVENT2("MFCdmError", message, #arg1, arg1, #arg2, arg2); }

#endif  // MEDIA_BASE_WIN_EDGE_MF_CDM_TRACE_H_
