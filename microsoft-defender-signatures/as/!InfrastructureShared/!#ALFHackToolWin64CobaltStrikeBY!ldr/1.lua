-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Win64/CobaltStrike.BY!ldr
-- Type: 13
-- MpAttributes: BM_MZ_FILE & RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if string.find(l_0_0, "sc_http", 1, true) and string.find(l_0_0, "_x64", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
