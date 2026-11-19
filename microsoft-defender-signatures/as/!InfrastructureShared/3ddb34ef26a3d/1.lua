-- Threat: !InfrastructureShared
-- Name: 3ddb34ef26a3d
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
elseif this_sigattrlog[2].matched then
  l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
elseif this_sigattrlog[3].matched then
  l_0_2 = string.lower(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched then
  l_0_3 = string.lower(this_sigattrlog[4].utf8p1)
  l_0_0 = string.gsub(l_0_3, ".1.vb", ".0.vb")
elseif this_sigattrlog[5].matched then
  l_0_3 = string.lower(this_sigattrlog[5].utf8p1)
  l_0_1 = string.gsub(l_0_3, ".1.cs", ".0.cs")
elseif this_sigattrlog[6].matched then
  l_0_3 = string.lower(this_sigattrlog[6].utf8p1)
  l_0_2 = string.gsub(l_0_3, ".1.js", ".0.js")
end
if l_0_0 ~= nil then
  if sysio.IsFileExists(l_0_0) then
    local l_0_5 = sysio.GetFileSize(l_0_0)
    l_0_5 = 8192 < l_0_5 and 8192 or l_0_5
    local l_0_6 = tostring(sysio.ReadFile(l_0_0, 0, l_0_5))
    l_0_4 = string.match(l_0_6, "#ExternalChecksum%(\"([^\"]+)")
  end
elseif l_0_1 ~= nil then
  if sysio.IsFileExists(l_0_1) then
    local l_0_7 = sysio.GetFileSize(l_0_1)
    l_0_7 = 8192 < l_0_7 and 8192 or l_0_7
    local l_0_8 = tostring(sysio.ReadFile(l_0_1, 0, l_0_7))
    l_0_4 = string.match(l_0_8, "#pragma checksum \"([^\"]+)")
  end
elseif l_0_2 ~= nil and sysio.IsFileExists(l_0_2) then
  local l_0_9 = sysio.GetFileSize(l_0_2)
  l_0_9 = 12288 < l_0_9 and 12288 or l_0_9
  local l_0_10 = tostring(sysio.ReadFile(l_0_2, 0, l_0_9))
  l_0_4 = string.match(l_0_10, "//@set @position%(file=\"([^\"]+%.as[hp]x)\"")
  l_0_4 = string.gsub(l_0_4, "\\\\", "\\")
end
if l_0_4 and sysio.IsFileExists(l_0_4) then
  local l_0_11 = string.sub(l_0_4, -4)
  local l_0_12 = "|.asp|aspx|ashx|asmx|"
  if string.find(l_0_12, l_0_11, 1, true) ~= nil then
    local l_0_13 = sysio.GetFileSize(l_0_4)
    l_0_13 = 512 < l_0_13 and 512 or l_0_13
    local l_0_14 = tostring(sysio.ReadFile(l_0_4, 0, l_0_13))
    local l_0_15, l_0_16 = MpCommon.StringRegExpSearch("(?i)(CodeBehind=\"|Inherits=\"|<%@ Register|CodeFile=\"|MasterPageFile=\"|WORKFLOW AUTOMATICALLY GENERATED SERVER CODE|UEditorHandler)", l_0_14)
    if l_0_15 then
      return mp.CLEAN
    end
    local l_0_17 = string.match(l_0_4, "(.*\\)[^\\]+$")
    if l_0_17 then
      bm.add_related_string("webshellpaths", l_0_17, bm.RelatedStringBMReport)
    end
    mp.ReportLowfi(l_0_4, 3343198717)
    bm.add_threat_file(l_0_4)
    local l_0_18, l_0_19 = pcall(reportBmInfo)
    if not l_0_18 and l_0_19 then
      bm.add_related_string("bmInfoFailReason", tostring(l_0_19), bm.RelatedStringBMReport)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
