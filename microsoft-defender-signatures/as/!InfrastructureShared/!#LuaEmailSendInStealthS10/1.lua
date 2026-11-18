-- Threat: !InfrastructureShared
-- Name: !#Lua:EmailSendInStealth.S10
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & AGGR:EmailFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or string.len(l_0_0) < 30 or string.len(l_0_0) > 1000 then
  return mp.CLEAN
end
if string.find(l_0_0, "\\transportroles\\pickup\\msg", 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED
