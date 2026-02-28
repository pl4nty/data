local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L6_1 = this_sigattrlog
L6_1 = L6_1[1]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = string
  L6_1 = L6_1.lower
  L7_1 = this_sigattrlog
  L7_1 = L7_1[1]
  L7_1 = L7_1.utf8p1
  L6_1 = L6_1(L7_1)
  L0_1 = L6_1
else
  L6_1 = this_sigattrlog
  L6_1 = L6_1[2]
  L6_1 = L6_1.matched
  if L6_1 then
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = this_sigattrlog
    L7_1 = L7_1[2]
    L7_1 = L7_1.utf8p1
    L6_1 = L6_1(L7_1)
    L1_1 = L6_1
  else
    L6_1 = this_sigattrlog
    L6_1 = L6_1[3]
    L6_1 = L6_1.matched
    if L6_1 then
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = this_sigattrlog
      L7_1 = L7_1[3]
      L7_1 = L7_1.utf8p1
      L6_1 = L6_1(L7_1)
      L2_1 = L6_1
    else
      L6_1 = this_sigattrlog
      L6_1 = L6_1[4]
      L6_1 = L6_1.matched
      if L6_1 then
        L6_1 = string
        L6_1 = L6_1.lower
        L7_1 = this_sigattrlog
        L7_1 = L7_1[4]
        L7_1 = L7_1.utf8p1
        L6_1 = L6_1(L7_1)
        L3_1 = L6_1
      else
        L6_1 = this_sigattrlog
        L6_1 = L6_1[5]
        L6_1 = L6_1.matched
        if L6_1 then
          L6_1 = string
          L6_1 = L6_1.lower
          L7_1 = this_sigattrlog
          L7_1 = L7_1[5]
          L7_1 = L7_1.utf8p1
          L6_1 = L6_1(L7_1)
          L5_1 = L6_1
          L6_1 = string
          L6_1 = L6_1.gsub
          L7_1 = L5_1
          L8_1 = ".1.vb"
          L9_1 = ".0.vb"
          L6_1 = L6_1(L7_1, L8_1, L9_1)
          L0_1 = L6_1
        else
          L6_1 = this_sigattrlog
          L6_1 = L6_1[6]
          L6_1 = L6_1.matched
          if L6_1 then
            L6_1 = string
            L6_1 = L6_1.lower
            L7_1 = this_sigattrlog
            L7_1 = L7_1[6]
            L7_1 = L7_1.utf8p1
            L6_1 = L6_1(L7_1)
            L5_1 = L6_1
            L6_1 = string
            L6_1 = L6_1.gsub
            L7_1 = L5_1
            L8_1 = ".1.cs"
            L9_1 = ".0.cs"
            L6_1 = L6_1(L7_1, L8_1, L9_1)
            L1_1 = L6_1
          else
            L6_1 = this_sigattrlog
            L6_1 = L6_1[7]
            L6_1 = L6_1.matched
            if L6_1 then
              L6_1 = string
              L6_1 = L6_1.lower
              L7_1 = this_sigattrlog
              L7_1 = L7_1[7]
              L7_1 = L7_1.utf8p1
              L6_1 = L6_1(L7_1)
              L5_1 = L6_1
              L6_1 = string
              L6_1 = L6_1.gsub
              L7_1 = L5_1
              L8_1 = ".1.js"
              L9_1 = ".0.js"
              L6_1 = L6_1(L7_1, L8_1, L9_1)
              L2_1 = L6_1
            end
          end
        end
      end
    end
  end
end
if L3_1 ~= nil then
  L6_1 = string
  L6_1 = L6_1.gsub
  L7_1 = L3_1
  L8_1 = ".dll"
  L9_1 = ".0.vb"
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  L0_1 = L6_1
  L6_1 = string
  L6_1 = L6_1.gsub
  L7_1 = L3_1
  L8_1 = ".dll"
  L9_1 = ".0.cs"
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  L1_1 = L6_1
  L6_1 = string
  L6_1 = L6_1.gsub
  L7_1 = L3_1
  L8_1 = ".dll"
  L9_1 = ".0.js"
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  L2_1 = L6_1
end
if L0_1 ~= nil then
  L6_1 = sysio
  L6_1 = L6_1.IsFileExists
  L7_1 = L0_1
  L6_1 = L6_1(L7_1)
  if L6_1 then
    L6_1 = sysio
    L6_1 = L6_1.GetFileSize
    L7_1 = L0_1
    L6_1 = L6_1(L7_1)
    if 8192 < L6_1 then
      L7_1 = 8192
      L6_1 = L7_1 or L6_1
      if not L7_1 then
      end
    end
    L7_1 = tostring
    L8_1 = sysio
    L8_1 = L8_1.ReadFile
    L9_1 = L0_1
    L10_1 = 0
    L11_1 = L6_1
    L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L8_1(L9_1, L10_1, L11_1)
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
    L8_1 = string
    L8_1 = L8_1.match
    L9_1 = L7_1
    L10_1 = "#ExternalChecksum%(\"([^\"]+)"
    L8_1 = L8_1(L9_1, L10_1)
    L4_1 = L8_1
end
else
  if L1_1 ~= nil then
    L6_1 = sysio
    L6_1 = L6_1.IsFileExists
    L7_1 = L1_1
    L6_1 = L6_1(L7_1)
    if L6_1 then
      L6_1 = sysio
      L6_1 = L6_1.GetFileSize
      L7_1 = L1_1
      L6_1 = L6_1(L7_1)
      if 8192 < L6_1 then
        L7_1 = 8192
        L6_1 = L7_1 or L6_1
        if not L7_1 then
        end
      end
      L7_1 = tostring
      L8_1 = sysio
      L8_1 = L8_1.ReadFile
      L9_1 = L1_1
      L10_1 = 0
      L11_1 = L6_1
      L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L8_1(L9_1, L10_1, L11_1)
      L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
      L8_1 = string
      L8_1 = L8_1.match
      L9_1 = L7_1
      L10_1 = "#pragma checksum \"([^\"]+)"
      L8_1 = L8_1(L9_1, L10_1)
      L4_1 = L8_1
  end
  elseif L2_1 ~= nil then
    L6_1 = sysio
    L6_1 = L6_1.IsFileExists
    L7_1 = L2_1
    L6_1 = L6_1(L7_1)
    if L6_1 then
      L6_1 = sysio
      L6_1 = L6_1.GetFileSize
      L7_1 = L2_1
      L6_1 = L6_1(L7_1)
      if 12288 < L6_1 then
        L7_1 = 12288
        L6_1 = L7_1 or L6_1
        if not L7_1 then
        end
      end
      L7_1 = tostring
      L8_1 = sysio
      L8_1 = L8_1.ReadFile
      L9_1 = L2_1
      L10_1 = 0
      L11_1 = L6_1
      L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L8_1(L9_1, L10_1, L11_1)
      L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
      L8_1 = string
      L8_1 = L8_1.match
      L9_1 = L7_1
      L10_1 = "//@set @position%(file=\"([^\"]+%.as[hp]x)\""
      L8_1 = L8_1(L9_1, L10_1)
      L4_1 = L8_1
      L8_1 = string
      L8_1 = L8_1.gsub
      L9_1 = L4_1
      L10_1 = "\\\\"
      L11_1 = "\\"
      L8_1 = L8_1(L9_1, L10_1, L11_1)
      L4_1 = L8_1
    end
  end
end
if L4_1 then
  L6_1 = sysio
  L6_1 = L6_1.IsFileExists
  L7_1 = L4_1
  L6_1 = L6_1(L7_1)
  if L6_1 then
    L6_1 = string
    L6_1 = L6_1.sub
    L7_1 = L4_1
    L8_1 = -4
    L6_1 = L6_1(L7_1, L8_1)
    L7_1 = "|.asp|aspx|ashx|asmx|"
    L8_1 = string
    L8_1 = L8_1.find
    L9_1 = L7_1
    L10_1 = L6_1
    L11_1 = 1
    L12_1 = true
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
    if L8_1 ~= nil then
      L8_1 = sysio
      L8_1 = L8_1.GetFileSize
      L9_1 = L4_1
      L8_1 = L8_1(L9_1)
      if 512 < L8_1 then
        L9_1 = 512
        L8_1 = L9_1 or L8_1
        if not L9_1 then
        end
      end
      L9_1 = tostring
      L10_1 = sysio
      L10_1 = L10_1.ReadFile
      L11_1 = L4_1
      L12_1 = 0
      L13_1 = L8_1
      L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L10_1(L11_1, L12_1, L13_1)
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
      L10_1 = MpCommon
      L10_1 = L10_1.StringRegExpSearch
      L11_1 = "(?i)(CodeBehind=\"|Inherits=\"|<%@ Register|CodeFile=\"|MasterPageFile=\"|WORKFLOW AUTOMATICALLY GENERATED SERVER CODE|UEditorHandler|CKEditor)"
      L12_1 = L9_1
      L10_1, L11_1 = L10_1(L11_1, L12_1)
      if L10_1 then
        L12_1 = mp
        L12_1 = L12_1.CLEAN
        return L12_1
      end
      L12_1 = string
      L12_1 = L12_1.match
      L13_1 = L4_1
      L14_1 = "(.*\\)[^\\]+$"
      L12_1 = L12_1(L13_1, L14_1)
      if L12_1 then
        L13_1 = bm
        L13_1 = L13_1.add_related_string
        L14_1 = "webshellpaths"
        L15_1 = L12_1
        L16_1 = bm
        L16_1 = L16_1.RelatedStringBMReport
        L13_1(L14_1, L15_1, L16_1)
      end
      L13_1 = bm
      L13_1 = L13_1.add_threat_file
      L14_1 = L4_1
      L13_1(L14_1)
      L13_1 = mp
      L13_1 = L13_1.ReportLowfi
      L14_1 = L4_1
      L15_1 = 3765990157
      L13_1(L14_1, L15_1)
      L13_1 = pcall
      L14_1 = reportBmInfo
      L13_1, L14_1 = L13_1(L14_1)
      if not L13_1 and L14_1 then
        L15_1 = bm
        L15_1 = L15_1.add_related_string
        L16_1 = "bmInfoFailReason"
        L17_1 = tostring
        L18_1 = L14_1
        L17_1 = L17_1(L18_1)
        L18_1 = bm
        L18_1 = L18_1.RelatedStringBMReport
        L15_1(L16_1, L17_1, L18_1)
      end
      L15_1 = mp
      L15_1 = L15_1.INFECTED
      return L15_1
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
