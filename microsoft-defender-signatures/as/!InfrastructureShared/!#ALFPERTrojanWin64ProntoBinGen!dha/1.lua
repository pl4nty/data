-- Threat: !InfrastructureShared
-- Name: !#ALFPER:Trojan:Win64/ProntoBin.Gen!dha
-- Type: 10
-- MpAttributes: Lua:DATExt & LUA:FileSizeLE10M.B

if mp.get_mpattributesubstring("ProntoBin") then
  return mp.CLEAN
end
local l_0_0 = MpCommon.PathToWin32Path(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_0 ~= nil and string.find(l_0_0, "\\coding\\anti-scout\\working\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
