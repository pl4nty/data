-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousFileNameSM201222
-- Type: 13
-- MpAttributes: (BM_LNK_FILE) & (Lua:AbsentExtension)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if (mp.get_mpattribute("Lua:FileSizeLT2000") or mp.get_mpattribute("LUA:FileSizeLE1000.A")) and (string.find(l_0_0, "summary_%d%d%d%d+_%d%d%d%d+.lnk") ~= nil or string.find(l_0_0, "documentsfolder %d%d%d%d+ 12%d%d2022.lnk") ~= nil or string.find(l_0_0, "report%-%d%d%d+_%d%d%d%d+.lnk") ~= nil) then
  return mp.INFECTED
end
return mp.CLEAN
