-- Threat: !InfrastructureShared
-- Name: 367b331adf140
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
elseif this_sigattrlog[2].matched then
  l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
elseif this_sigattrlog[3].matched then
  l_0_2 = string.lower(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched then
  l_0_3 = string.lower(this_sigattrlog[4].utf8p1)
elseif this_sigattrlog[5].matched then
  l_0_5 = string.lower(this_sigattrlog[5].utf8p1)
  l_0_0 = string.gsub(l_0_5, ".1.vb", ".0.vb")
elseif this_sigattrlog[6].matched then
  l_0_5 = string.lower(this_sigattrlog[6].utf8p1)
  l_0_1 = string.gsub(l_0_5, ".1.cs", ".0.cs")
elseif this_sigattrlog[7].matched then
  l_0_5 = string.lower(this_sigattrlog[7].utf8p1)
  l_0_2 = string.gsub(l_0_5, ".1.js", ".0.js")
end
if l_0_3 ~= nil then
  l_0_0 = string.gsub(l_0_3, ".dll", ".0.vb")
  l_0_1 = string.gsub(l_0_3, ".dll", ".0.cs")
  l_0_2 = string.gsub(l_0_3, ".dll", ".0.js")
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  local l_0_6 = sysio.GetFileSize(l_0_0)
  l_0_6 = 8192 < l_0_6 and 8192 or l_0_6
  local l_0_7 = tostring(sysio.ReadFile(l_0_0, 0, l_0_6))
  l_0_4 = string.match(l_0_7, "#ExternalChecksum%(\"([^\"]+)")
elseif l_0_1 ~= nil and sysio.IsFileExists(l_0_1) then
  local l_0_8 = sysio.GetFileSize(l_0_1)
  l_0_8 = 8192 < l_0_8 and 8192 or l_0_8
  local l_0_9 = tostring(sysio.ReadFile(l_0_1, 0, l_0_8))
  l_0_4 = string.match(l_0_9, "#pragma checksum \"([^\"]+)")
elseif l_0_2 ~= nil and sysio.IsFileExists(l_0_2) then
  local l_0_10 = sysio.GetFileSize(l_0_2)
  l_0_10 = 12288 < l_0_10 and 12288 or l_0_10
  local l_0_11 = tostring(sysio.ReadFile(l_0_2, 0, l_0_10))
  l_0_4 = string.match(l_0_11, "//@set @position%(file=\"([^\"]+%.as[hp]x)\"")
  l_0_4 = string.gsub(l_0_4, "\\\\", "\\")
end
if l_0_4 and sysio.IsFileExists(l_0_4) then
  local l_0_12 = string.sub(l_0_4, -4)
  local l_0_13 = "|.asp|aspx|ashx|asmx|"
  if string.find(l_0_13, l_0_12, 1, true) ~= nil then
    local l_0_14 = sysio.GetFileSize(l_0_4)
    l_0_14 = 512 < l_0_14 and 512 or l_0_14
    local l_0_15 = tostring(sysio.ReadFile(l_0_4, 0, l_0_14))
    local l_0_16, l_0_17 = MpCommon.StringRegExpSearch("(?i)(CodeBehind=\"|Inherits=\"|<%@ Register|CodeFile=\"|MasterPageFile=\"|WORKFLOW AUTOMATICALLY GENERATED SERVER CODE|UEditorHandler|CKEditor)", l_0_15)
    if l_0_16 then
      return mp.CLEAN
    end
    local l_0_18 = string.match(l_0_4, "(.*\\)[^\\]+$")
    if l_0_18 then
      bm.add_related_string("webshellpaths", l_0_18, bm.RelatedStringBMReport)
    end
    bm.add_threat_file(l_0_4)
    mp.ReportLowfi(l_0_4, 3765990157)
    local l_0_19, l_0_20 = pcall(reportBmInfo)
    if not l_0_19 and l_0_20 then
      bm.add_related_string("bmInfoFailReason", tostring(l_0_20), bm.RelatedStringBMReport)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
