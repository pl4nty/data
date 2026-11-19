-- Threat: !InfrastructureShared
-- Name: 2bfb3428c290b
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
elseif this_sigattrlog[2].matched then
  l_0_2 = string.lower(this_sigattrlog[2].utf8p1)
elseif this_sigattrlog[3].matched then
  l_0_1 = string.lower(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched then
  l_0_4 = string.lower(this_sigattrlog[4].utf8p1)
  l_0_0 = string.gsub(l_0_4, ".1.cs", ".0.cs")
elseif this_sigattrlog[5].matched then
  l_0_4 = string.lower(this_sigattrlog[5].utf8p1)
  l_0_1 = string.gsub(l_0_4, ".1.js", ".0.js")
end
if l_0_2 ~= nil then
  l_0_0 = string.gsub(l_0_2, ".dll", ".0.cs")
  l_0_1 = string.gsub(l_0_2, ".dll", ".0.js")
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  local l_0_5 = sysio.GetFileSize(l_0_0)
  l_0_5 = 8192 < l_0_5 and 8192 or l_0_5
  local l_0_6 = tostring(sysio.ReadFile(l_0_0, 0, l_0_5))
  l_0_3 = string.match(l_0_6, "#pragma checksum \"([^\"]+)")
elseif l_0_1 ~= nil and sysio.IsFileExists(l_0_1) then
  local l_0_7 = sysio.GetFileSize(l_0_1)
  l_0_7 = 12288 < l_0_7 and 12288 or l_0_7
  local l_0_8 = tostring(sysio.ReadFile(l_0_1, 0, l_0_7))
  l_0_3 = string.match(l_0_8, "//@set @position%(file=\"([^\"]+%.as[hp]x)\"")
  l_0_3 = string.gsub(l_0_3, "\\\\", "\\")
end
if l_0_3 and sysio.IsFileExists(l_0_3) then
  local l_0_9 = string.sub(l_0_3, -4)
  local l_0_10 = "|.asp|aspx|ashx|asmx|"
  if string.find(l_0_10, l_0_9, 1, true) ~= nil then
    local l_0_11 = sysio.GetFileSize(l_0_3)
    l_0_11 = 512 < l_0_11 and 512 or l_0_11
    local l_0_12 = tostring(sysio.ReadFile(l_0_3, 0, l_0_11))
    local l_0_13, l_0_14 = MpCommon.StringRegExpSearch("(?i)(CodeBehind=\"|Inherits=\"|<%@ Register|CodeFile=\"|MasterPageFile=\"|WORKFLOW AUTOMATICALLY GENERATED SERVER CODE|UEditorHandler|CKEditor)", l_0_12)
    if l_0_13 then
      return mp.CLEAN
    end
    local l_0_15 = string.match(l_0_3, "(.*\\)[^\\]+$")
    if l_0_15 then
      bm.add_related_string("webshellpaths", l_0_15, bm.RelatedStringBMReport)
    end
    mp.ReportLowfi(l_0_3, 2206080980)
    return mp.INFECTED
  end
end
return mp.CLEAN
