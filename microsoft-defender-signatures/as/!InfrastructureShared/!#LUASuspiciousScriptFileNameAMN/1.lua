-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousScriptFileNameAMN
-- Type: 13
-- MpAttributes: BM_RTF_FILE & LUA:RTF/PossibleMalformedRTF & AGGR:PossibleFilesCanExecute

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "www%.doc$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
