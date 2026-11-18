-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/ExtractedUDFArchiveTemp
-- Type: 13
-- MpAttributes: Lua:FileInsideAppDataLocalTempFolder & RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) < 40 then
  return mp.CLEAN
end
if string.find(l_0_0, ".iso", -4, true) == nil and string.find(l_0_0, ".img", -4, true) == nil and string.find(l_0_0, ".vhd", -4, true) == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "\\appdata\\local\\temp\\temp1_.*.zip\\[^\\]+$") ~= nil or string.find(l_0_0, "\\appdata\\local\\temp.*\\rar%$[^\\]+\\[^\\]+$") ~= nil or string.find(l_0_0, "\\appdata\\local\\temp\\%w+\\[^\\]+$") ~= nil or string.find(l_0_0, "\\appdata\\local\\temp\\7z%w+\\[^\\]+$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
