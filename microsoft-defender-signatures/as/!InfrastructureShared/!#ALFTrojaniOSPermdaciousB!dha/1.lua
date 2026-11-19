-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:iOS/Permdacious.B!dha
-- Type: 24
-- MpAttributes: ALF:Trojan:iOS/PermShutter

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("exploit", 1, true) or l_0_0:find("payloads", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
