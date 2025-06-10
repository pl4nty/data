// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#if !defined(COMPONENT_BUILD)

#ifdef UNSAFE_BUFFERS_BUILD
// TODO(task.ms/57672583): Remove C-library calls to fix the errors.
#pragma allow_unsafe_libc_calls
#endif  // UNSAFE_BUFFERS_BUILD

#include <Windows.h>

#include <delayimp.h>
#include <string.h>

#include <array>

#include "base/debug/alias.h"
#include "base/immediate_crash.h"

extern "C" FARPROC WINAPI
ElfDelayLoadNotifyHook(unsigned notify_type, PDelayLoadInfo delay_load_info) {
  // Note that we have to be careful about heap allocations here - since they
  // will recursively initialize the partition alloc code, causing a crash.
  if (notify_type == dliNotePreLoadLibrary) {
    // We sometimes load dbghelp from application directory.
    std::array<char, MAX_PATH> dll_name = {};
    strncpy(dll_name.data(), delay_load_info->szDll, MAX_PATH - 1);
    size_t dll_name_length = strlen(dll_name.data());
    for (size_t i = 0; i < dll_name_length; i++)
      dll_name[i] = tolower(dll_name[i]);
    if (strcmp(dll_name.data(), "dbghelp.dll") != 0) {
      // The default delayload handler will call LoadLibrary without flags, but
      // we prefer to load binaries from system32 to defeat dll sideloading.
      return reinterpret_cast<FARPROC>(::LoadLibraryExA(
          dll_name.data(), nullptr, LOAD_LIBRARY_SEARCH_SYSTEM32));
    }
  }

  return 0;
}

// Make it easier to spot and diagnose elf delayload errors.
FARPROC WINAPI ElfDelayLoadFailureHook(unsigned reason,
                                       DelayLoadInfo* delay_load_info) {
  std::array<char, MAX_PATH> dll_name = {};
  strncpy(dll_name.data(), delay_load_info->szDll, MAX_PATH - 1);
  base::debug::Alias(&dll_name);

  base::ImmediateCrash();
}

// Set the delay load notify hook for this binary. See:
// https://docs.microsoft.com/en-us/cpp/build/reference/error-handling-and-notification
extern "C" const PfnDliHook __pfnDliNotifyHook2 = ElfDelayLoadNotifyHook;

// Set the failure hook for this binary, to be called on delayload failures.
extern "C" const PfnDliHook __pfnDliFailureHook2 = ElfDelayLoadFailureHook;

#endif
