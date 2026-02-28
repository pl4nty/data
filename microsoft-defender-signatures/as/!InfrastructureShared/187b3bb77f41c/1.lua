local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L5_1 = this_sigattrlog
L5_1 = L5_1[1]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = this_sigattrlog
  L6_1 = L6_1[1]
  L6_1 = L6_1.utf8p1
  L5_1 = L5_1(L6_1)
  L0_1 = L5_1
end
if L0_1 ~= nil then
  L5_1 = string
  L5_1 = L5_1.gsub
  L6_1 = L0_1
  L7_1 = ".dll"
  L8_1 = ".0.vb"
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  L1_1 = L5_1
  L5_1 = string
  L5_1 = L5_1.gsub
  L6_1 = L0_1
  L7_1 = ".dll"
  L8_1 = ".0.cs"
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  L2_1 = L5_1
  L5_1 = string
  L5_1 = L5_1.gsub
  L6_1 = L0_1
  L7_1 = ".dll"
  L8_1 = ".0.js"
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  L3_1 = L5_1
  L5_1 = sysio
  L5_1 = L5_1.IsFileExists
  L6_1 = L1_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L5_1 = sysio
    L5_1 = L5_1.GetFileSize
    L6_1 = L1_1
    L5_1 = L5_1(L6_1)
    if 8192 < L5_1 then
      L6_1 = 8192
      L5_1 = L6_1 or L5_1
      if not L6_1 then
      end
    end
    L6_1 = tostring
    L7_1 = sysio
    L7_1 = L7_1.ReadFile
    L8_1 = L1_1
    L9_1 = 0
    L10_1 = L5_1
    L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L7_1(L8_1, L9_1, L10_1)
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
    L7_1 = string
    L7_1 = L7_1.match
    L8_1 = L6_1
    L9_1 = "#ExternalChecksum%(\"([^\"]+)"
    L7_1 = L7_1(L8_1, L9_1)
    L4_1 = L7_1
  else
    L5_1 = sysio
    L5_1 = L5_1.IsFileExists
    L6_1 = L2_1
    L5_1 = L5_1(L6_1)
    if L5_1 then
      L5_1 = sysio
      L5_1 = L5_1.GetFileSize
      L6_1 = L2_1
      L5_1 = L5_1(L6_1)
      if 8192 < L5_1 then
        L6_1 = 8192
        L5_1 = L6_1 or L5_1
        if not L6_1 then
        end
      end
      L6_1 = tostring
      L7_1 = sysio
      L7_1 = L7_1.ReadFile
      L8_1 = L2_1
      L9_1 = 0
      L10_1 = L5_1
      L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L7_1(L8_1, L9_1, L10_1)
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
      L7_1 = string
      L7_1 = L7_1.match
      L8_1 = L6_1
      L9_1 = "#pragma checksum \"([^\"]+)"
      L7_1 = L7_1(L8_1, L9_1)
      L4_1 = L7_1
    else
      L5_1 = sysio
      L5_1 = L5_1.IsFileExists
      L6_1 = L3_1
      L5_1 = L5_1(L6_1)
      if L5_1 then
        L5_1 = sysio
        L5_1 = L5_1.GetFileSize
        L6_1 = L3_1
        L5_1 = L5_1(L6_1)
        if 12288 < L5_1 then
          L6_1 = 12288
          L5_1 = L6_1 or L5_1
          if not L6_1 then
          end
        end
        L6_1 = tostring
        L7_1 = sysio
        L7_1 = L7_1.ReadFile
        L8_1 = L3_1
        L9_1 = 0
        L10_1 = L5_1
        L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L7_1(L8_1, L9_1, L10_1)
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
        L7_1 = string
        L7_1 = L7_1.match
        L8_1 = L6_1
        L9_1 = "//@set @position%(file=\"([^\"]+%.as[hp]x)\""
        L7_1 = L7_1(L8_1, L9_1)
        L4_1 = L7_1
        L7_1 = string
        L7_1 = L7_1.gsub
        L8_1 = L4_1
        L9_1 = "\\\\"
        L10_1 = "\\"
        L7_1 = L7_1(L8_1, L9_1, L10_1)
        L4_1 = L7_1
      end
    end
  end
  if L4_1 then
    L5_1 = sysio
    L5_1 = L5_1.IsFileExists
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    if L5_1 then
      L5_1 = string
      L5_1 = L5_1.sub
      L6_1 = L4_1
      L7_1 = -4
      L5_1 = L5_1(L6_1, L7_1)
      L6_1 = "|.asp|aspx|ashx|asmx|"
      L7_1 = string
      L7_1 = L7_1.find
      L8_1 = L6_1
      L9_1 = L5_1
      L10_1 = 1
      L11_1 = true
      L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
      if L7_1 ~= nil then
        L7_1 = sysio
        L7_1 = L7_1.GetFileSize
        L8_1 = L4_1
        L7_1 = L7_1(L8_1)
        if 512 < L7_1 then
          L8_1 = 512
          L7_1 = L8_1 or L7_1
          if not L8_1 then
          end
        end
        L8_1 = tostring
        L9_1 = sysio
        L9_1 = L9_1.ReadFile
        L10_1 = L4_1
        L11_1 = 0
        L12_1 = L7_1
        L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L9_1(L10_1, L11_1, L12_1)
        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
        L9_1 = MpCommon
        L9_1 = L9_1.StringRegExpSearch
        L10_1 = "(?i)(CodeBehind=\"|Inherits=\"|<%@ Register|CodeFile=\"|MasterPageFile=\"|WORKFLOW AUTOMATICALLY GENERATED SERVER CODE|UEditorHandler|PK\\x03\\x04)"
        L11_1 = L8_1
        L9_1, L10_1 = L9_1(L10_1, L11_1)
        if L9_1 then
          L11_1 = mp
          L11_1 = L11_1.CLEAN
          return L11_1
        end
        L11_1 = string
        L11_1 = L11_1.match
        L12_1 = L4_1
        L13_1 = "(.*\\)[^\\]+$"
        L11_1 = L11_1(L12_1, L13_1)
        if L11_1 then
          L12_1 = bm
          L12_1 = L12_1.add_related_string
          L13_1 = "webshellpaths"
          L14_1 = L11_1
          L15_1 = bm
          L15_1 = L15_1.RelatedStringBMReport
          L12_1(L13_1, L14_1, L15_1)
        end
        L12_1 = mp
        L12_1 = L12_1.ReportLowfi
        L13_1 = L4_1
        L14_1 = 2156904378
        L12_1(L13_1, L14_1)
        L12_1 = mp
        L12_1 = L12_1.ReportLowfi
        L13_1 = L0_1
        L14_1 = 630796932
        L12_1(L13_1, L14_1)
        L12_1 = bm
        L12_1 = L12_1.add_threat_file
        L13_1 = L4_1
        L12_1(L13_1)
        L12_1 = bm
        L12_1 = L12_1.add_threat_file
        L13_1 = L0_1
        L12_1(L13_1)
        L12_1 = pcall
        L13_1 = reportBmInfo
        L12_1, L13_1 = L12_1(L13_1)
        if not L12_1 and L13_1 then
          L14_1 = bm
          L14_1 = L14_1.add_related_string
          L15_1 = "bmInfoFailReason"
          L16_1 = tostring
          L17_1 = L13_1
          L16_1 = L16_1(L17_1)
          L17_1 = bm
          L17_1 = L17_1.RelatedStringBMReport
          L14_1(L15_1, L16_1, L17_1)
        end
        L14_1 = mp
        L14_1 = L14_1.INFECTED
        return L14_1
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
