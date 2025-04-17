// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef BASE_ALLOCATOR_PARTITION_ALLOCATOR_SRC_PARTITION_ALLOC_POINTERS_EDGE_RAW_PTR_UTILS_H_
#define BASE_ALLOCATOR_PARTITION_ALLOCATOR_SRC_PARTITION_ALLOC_POINTERS_EDGE_RAW_PTR_UTILS_H_

// See `docs/dangling_ptr.md`
// Annotates downstream only known dangling raw_ptr. Those haven't been triaged
// yet. All the occurrences are meant to be removed.
#define EDGE_DANGLING_UNTRIAGED(vsts_bug_id) DanglingUntriaged

#endif  // BASE_ALLOCATOR_PARTITION_ALLOCATOR_SRC_PARTITION_ALLOC_POINTERS_EDGE_RAW_PTR_UTILS_H_
