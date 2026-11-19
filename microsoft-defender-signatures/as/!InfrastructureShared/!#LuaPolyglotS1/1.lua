-- Threat: !InfrastructureShared
-- Name: !#Lua:Polyglot.S1
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_ZIP_FILE & Lua:SingleFileInZip & Lua:SingleSuspiciousExtensionInZip & !Lua:SingleZipInZip

local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 or 5242880 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.readheader(0, 256)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if string.find(l_0_1, ".pdf", 1, true) ~= nil or string.find(l_0_1, ".doc", 1, true) ~= nil or string.find(l_0_1, ".xls", 1, true) ~= nil or string.find(l_0_1, ".htm", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
