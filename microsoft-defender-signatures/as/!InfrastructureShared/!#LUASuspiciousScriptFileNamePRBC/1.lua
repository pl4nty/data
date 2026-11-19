-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousScriptFileNamePRBC
-- Type: 13
-- MpAttributes: (BM_ScriptFile | SCPT:HTMLFile) & LUA:FileSizeGT40000.A

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "statusupdate %d%d%d%d%d%d apr 4%.xhtml") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
