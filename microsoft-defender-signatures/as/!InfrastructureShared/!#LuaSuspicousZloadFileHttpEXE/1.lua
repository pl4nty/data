-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspicousZloadFileHttpEXE
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_MZ_FILE

local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if string.find(l_0_1, "temp\\\\http.exe", 1, true) ~= nil then
  mp.set_mpattribute("Lua:SuspiciousZloaderFileName")
end
return mp.CLEAN
