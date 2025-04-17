// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef CHROME_COMMON_IMPORTER_EDGE_CONTINUOUS_MIGRATION_IPC_MEMBERS_H_
#define CHROME_COMMON_IMPORTER_EDGE_CONTINUOUS_MIGRATION_IPC_MEMBERS_H_

#include "components/edge_import/core/common/edge_continuous_import_data_types.h"

namespace edge_continuous_migration {

struct ContinuousMigrationMember {
  OperationType operation_type = OperationType::ADD;
  SourceOfData source = SourceOfData::ANAHEIM;
  ContinuousMigrationMember() = default;
  ContinuousMigrationMember(OperationType type, SourceOfData source)
      : operation_type(type), source(source) {}
};
}  // namespace edge_continuous_migration

#endif  // CHROME_COMMON_IMPORTER_EDGE_CONTINUOUS_MIGRATION_IPC_MEMBERS_H_
