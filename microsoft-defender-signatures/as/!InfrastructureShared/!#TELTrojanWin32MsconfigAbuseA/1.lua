-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/MsconfigAbuse.A
-- Type: 13
-- MpAttributes: !BM_MZ_FILE & RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= "mscfgtlc.xml" then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if string.find(l_0_1, "\\windows\\system32", 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED
