// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

namespace EdgeProcessViewer.Controls {
  public class ColumnDefinition {
    public ColumnDefinition(string name, string label) {
      this.name_ = name;
      this.label_ = label;
    }

    protected ColumnDefinition() {
      this.name_ = "";
      this.label_ = "";
    }

    public string Name { get { return name_; } }
    public string Label { get { return label_; } }

    protected string name_;
    protected string label_;
  }
}
