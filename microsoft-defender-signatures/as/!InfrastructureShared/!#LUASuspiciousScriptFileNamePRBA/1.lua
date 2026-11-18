-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousScriptFileNamePRBA
-- Type: 13
-- MpAttributes: (BM_ScriptFile | SCPT:HTMLFile) & LUA:FileSizeLE40000.A

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "complaintcopy_%d%d%d%d%d%(feb01%)1%.one") ~= nil or string.find(l_0_0, " on 01feb %- copy%.one") ~= nil or string.find(l_0_0, "agreementcancelation_%d%d%d%d%d%d%(feb08%)%.one") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
