-- Threat: !InfrastructureShared
-- Name: !#LUA:OneNoteSuspiciousFileName
-- Type: 13
-- MpAttributes: BM_ONENOTE_FILE & LUA:FileSizeGE1000.A

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "kyc_gm92%(feb%d%d%)%.one$") ~= nil or string.find(l_0_0, "^document%.one$") ~= nil or string.find(l_0_0, "goods.one", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
