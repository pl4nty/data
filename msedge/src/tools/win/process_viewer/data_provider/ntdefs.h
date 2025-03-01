// Copyright 2019 The Chromium Authors. All rights reserved.
// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_NTDEFS_H_
#define TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_NTDEFS_H_

#include <windows.h>

#define NT_SUCCESS(Status) (((NTSTATUS)(Status)) >= 0)

#define STATUS_INFO_LENGTH_MISMATCH ((NTSTATUS)0xC0000004L)

typedef LONG KPRIORITY;
typedef LONG NTSTATUS;

typedef enum _SYSTEM_INFORMATION_CLASS {
  SystemProcessInformation = 5,
} SYSTEM_INFORMATION_CLASS;

typedef enum _PROCESSINFOCLASS {
  ProcessBasicInformation = 0,
} PROCESSINFOCLASS;

typedef struct _UNICODE_STRING {
  USHORT Length;
  USHORT MaximumLength;
  PWSTR Buffer;
} UNICODE_STRING;

typedef struct _PEB_LDR_DATA {
  BYTE Reserved1[8];
  PVOID Reserved2[3];
  LIST_ENTRY InMemoryOrderModuleList;
} PEB_LDR_DATA, *PPEB_LDR_DATA;

typedef struct _RTL_USER_PROCESS_PARAMETERS {
  BYTE Reserved1[16];
  PVOID Reserved2[10];
  UNICODE_STRING ImagePathName;
  UNICODE_STRING CommandLine;
} RTL_USER_PROCESS_PARAMETERS, *PRTL_USER_PROCESS_PARAMETERS;

typedef VOID(NTAPI* PPS_POST_PROCESS_INIT_ROUTINE)();

typedef struct _PEB {
  BYTE Reserved1[2];
  BYTE BeingDebugged;
  BYTE Reserved2[1];
  PVOID Reserved3[2];
  PPEB_LDR_DATA Ldr;
  PRTL_USER_PROCESS_PARAMETERS ProcessParameters;
  PVOID Reserved4[3];
  PVOID AtlThunkSListPtr;
  PVOID Reserved5;
  ULONG Reserved6;
  PVOID Reserved7;
  ULONG Reserved8;
  ULONG AtlThunkSListPtr32;
  PVOID Reserved9[45];
  BYTE Reserved10[96];
  PPS_POST_PROCESS_INIT_ROUTINE PostProcessInitRoutine;
  BYTE Reserved11[128];
  PVOID Reserved12[1];
  ULONG SessionId;
} PEB, *PPEB;

typedef struct _PROCESS_BASIC_INFORMATION {
  PVOID Reserved1;
  PPEB PebBaseAddress;
  PVOID Reserved2[2];
  ULONG_PTR UniqueProcessId;
  PVOID Reserved3;
} PROCESS_BASIC_INFORMATION, *PPROCESS_BASIC_INFORMATION;

typedef struct _VM_COUNTERS {
  SIZE_T PeakVirtualSize;
  SIZE_T VirtualSize;
  ULONG PageFaultCount;
  SIZE_T PeakWorkingSetSize;
  SIZE_T WorkingSetSize;
  SIZE_T QuotaPeakPagedPoolUsage;
  SIZE_T QuotaPagedPoolUsage;
  SIZE_T QuotaPeakNonPagedPoolUsage;
  SIZE_T QuotaNonPagedPoolUsage;
  SIZE_T PagefileUsage;
  SIZE_T PeakPagefileUsage;
} VM_COUNTERS;

typedef struct _CLIENT_ID {
  HANDLE UniqueProcess;
  HANDLE UniqueThread;
} CLIENT_ID;

typedef struct _SYSTEM_THREAD_INFORMATION {
  LARGE_INTEGER Reserved1[3];
  ULONG Reserved2;
  PVOID StartAddress;
  CLIENT_ID ClientId;
  KPRIORITY Priority;
  LONG BasePriority;
  ULONG Reserved3;
  ULONG ThreadState;
  ULONG WaitReason;
} SYSTEM_THREAD_INFORMATION;

// From http://alax.info/blog/1182, with corrections and modifications
// Originally from
// http://undocumented.ntinternals.net/index.html?page=UserMode%2FUndocumented%20Functions%2FSystem%20Information%2FStructures%2FSYSTEM_THREAD.html
struct SYSTEM_PROCESS_INFORMATION {
  ULONG NextEntryOffset;
  ULONG NumberOfThreads;
  // http://processhacker.sourceforge.net/doc/struct___s_y_s_t_e_m___p_r_o_c_e_s_s___i_n_f_o_r_m_a_t_i_o_n.html
  ULONGLONG WorkingSetPrivateSize;
  ULONG HardFaultCount;
  ULONG Reserved1;
  ULONGLONG CycleTime;
  ULONGLONG CreateTime;
  ULONGLONG UserTime;
  ULONGLONG KernelTime;
  UNICODE_STRING ImageName;
  KPRIORITY BasePriority;
  HANDLE ProcessId;
  HANDLE ParentProcessId;
  ULONG HandleCount;
  ULONG Reserved2[2];
  // Padding here in 64-bit
  VM_COUNTERS VirtualMemoryCounters;
  size_t Reserved3;
  IO_COUNTERS IoCounters;
  SYSTEM_THREAD_INFORMATION Threads[1];
};
#if defined(ARCH_CPU_64_BITS)
static_assert(sizeof(SYSTEM_PROCESS_INFORMATION) == 336,
              "Structure size mismatch");
#else
static_assert(sizeof(SYSTEM_PROCESS_INFORMATION) == 248,
              "Structure size mismatch");
#endif

NTSTATUS NTAPI
NtQueryInformationProcess(HANDLE ProcessHandle,
                          PROCESSINFOCLASS ProcessInformationClass,
                          PVOID ProcessInformation,
                          ULONG ProcessInformationLength,
                          PULONG ReturnLength);

NTSTATUS NTAPI
NtQuerySystemInformation(SYSTEM_INFORMATION_CLASS system_information_class,
                         PVOID system_information,
                         ULONG system_information_length,
                         PULONG return_length);

#endif  // TOOLS_WIN_PROCESS_VIEWER_DATA_PROVIDER_NTDEFS_H_
