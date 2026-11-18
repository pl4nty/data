-- Threat: !InfrastructureShared
-- Name: !#LUA:Win32/SuspiciousFilePR
-- Type: 13
-- MpAttributes: BM_MZ_FILE & LUA:FileSizeGT20000.A & Lua:OverSizedLnkFile

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "eazyonezz.dll", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
