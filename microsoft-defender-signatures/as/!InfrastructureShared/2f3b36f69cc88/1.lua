-- Threat: !InfrastructureShared
-- Name: 2f3b36f69cc88
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
elseif this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
elseif this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  local l_0_2 = sysio.GetFileSize(l_0_0)
  l_0_2 = 8192 < l_0_2 and 8192 or l_0_2
  local l_0_3 = tostring(sysio.ReadFile(l_0_0, 0, l_0_2))
  l_0_1 = string.match(l_0_3, "assembly=\"(App_Web_[^\"]+)\"")
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_4, l_0_5, l_0_6, l_0_7
local l_0_8 = string.match(l_0_0, "\\([^\\]+)$")
if l_0_8 ~= nil then
  l_0_4 = string.gsub(l_0_0, l_0_8, l_0_1 .. ".0.vb")
  l_0_5 = string.gsub(l_0_0, l_0_8, l_0_1 .. ".0.cs")
  l_0_6 = string.gsub(l_0_0, l_0_8, l_0_1 .. ".0.js")
end
if l_0_4 ~= nil and sysio.IsFileExists(l_0_4) then
  local l_0_9 = sysio.GetFileSize(l_0_4)
  l_0_9 = 8192 < l_0_9 and 8192 or l_0_9
  local l_0_10 = tostring(sysio.ReadFile(l_0_4, 0, l_0_9))
  l_0_7 = string.match(l_0_10, "#ExternalChecksum%(\"([^\"]+)")
elseif l_0_5 ~= nil and sysio.IsFileExists(l_0_5) then
  local l_0_11 = sysio.GetFileSize(l_0_5)
  l_0_11 = 8192 < l_0_11 and 8192 or l_0_11
  local l_0_12 = tostring(sysio.ReadFile(l_0_5, 0, l_0_11))
  l_0_7 = string.match(l_0_12, "#pragma checksum \"([^\"]+)")
elseif l_0_6 ~= nil and sysio.IsFileExists(l_0_6) then
  local l_0_13 = sysio.GetFileSize(l_0_6)
  l_0_13 = 12288 < l_0_13 and 12288 or l_0_13
  local l_0_14 = tostring(sysio.ReadFile(l_0_6, 0, l_0_13))
  l_0_7 = string.match(l_0_14, "//@set @position%(file=\"([^\"]+%.as[hp]x)\"")
  l_0_7 = string.gsub(l_0_7, "\\\\", "\\")
end
if l_0_7 and sysio.IsFileExists(l_0_7) then
  local l_0_15 = string.sub(l_0_7, -4)
  local l_0_16 = "|.asp|aspx|ashx|asmx|"
  if string.find(l_0_16, l_0_15, 1, true) ~= nil then
    local l_0_17 = sysio.GetFileSize(l_0_7)
    l_0_17 = 512 < l_0_17 and 512 or l_0_17
    local l_0_18 = tostring(sysio.ReadFile(l_0_7, 0, l_0_17))
    local l_0_19, l_0_20 = MpCommon.StringRegExpSearch("(?i)(CodeBehind=\"|Inherits=\"|<%@ Register|CodeFile=\"|MasterPageFile=\"|WORKFLOW AUTOMATICALLY GENERATED SERVER CODE|UEditorHandler)", l_0_18)
    if l_0_19 then
      return mp.CLEAN
    end
    local l_0_21 = string.match(l_0_7, "(.*\\)[^\\]+$")
    if l_0_21 then
      bm.add_related_string("webshellpaths", l_0_21, bm.RelatedStringBMReport)
    end
    mp.ReportLowfi(l_0_7, 2714789737)
    return mp.INFECTED
  end
end
return mp.CLEAN
