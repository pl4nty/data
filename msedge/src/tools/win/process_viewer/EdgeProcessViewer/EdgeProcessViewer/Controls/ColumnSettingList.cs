// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

using System;
using System.Collections.Generic;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;

namespace EdgeProcessViewer {
  public struct ColumnSetting {
    public const int INVALID_ID = -1;

    public ColumnSetting(int id, int width, bool visible) {
      Id = id;
      Width = width;
      Visible = visible;
      Label = "";
      Name = "";
    }

    public ColumnSetting(string name, string label, int width, bool visible) {
      Name = name;
      Label = label;
      Width = width;
      Visible = visible;
      Id = INVALID_ID;
    }

    public ColumnSetting(int id, int width, bool visible, string label, string name) {
      Id = id;
      Width = width;
      Visible = visible;
      Label = label;
      Name = name;
    }

    public string Name;
    public string Label;
    public int Id;
    public int Width;
    public bool Visible;
  }

  // A list of ColumnSettings that can be serialized to/deserialized from XML.
  public class ColumnSettingList : List<ColumnSetting>, IXmlSerializable {
    public XmlSchema GetSchema() {
      return null;
    }

    // Reads ColumnSettings from an XML element and adds them to the list.
    public void ReadXml(XmlReader reader) {
      while (reader.Read()) {
        if (reader.NodeType == XmlNodeType.EndElement && reader.LocalName == GetType().Name) {
          break;
        }

        ColumnSetting columnSetting = new ColumnSetting{
          Id = Int32.Parse(reader[IdAttributeName]),
          Width = Int32.Parse(reader[WidthAttributeName]),
          Visible = Boolean.Parse(reader[VisibleAttributeName]),
          Label = reader[LabelAttributeName],
          Name = reader[NameAttributeName]
        };
        Add(columnSetting);
      }
    }

    // Writes the list of ColumnSettings to an XML element.
    public void WriteXml(XmlWriter writer) {
      foreach (ColumnSetting columnSetting in this) {
        writer.WriteStartElement(ElementName);
        writer.WriteAttributeString(IdAttributeName, columnSetting.Id.ToString());
        writer.WriteAttributeString(NameAttributeName, columnSetting.Name);
        writer.WriteAttributeString(LabelAttributeName, columnSetting.Label);
        writer.WriteAttributeString(WidthAttributeName, columnSetting.Width.ToString());
        writer.WriteAttributeString(VisibleAttributeName, columnSetting.Visible.ToString());
        writer.WriteEndElement();
      }
    }

    private const string ElementName = "ColumnSetting";
    private const string NameAttributeName = "Name";
    private const string LabelAttributeName = "Label";
    private const string IdAttributeName = "Id";
    private const string WidthAttributeName = "Width";
    private const string VisibleAttributeName = "Visible";
  }
}
