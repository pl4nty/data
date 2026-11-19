-- Threat: !InfrastructureShared
-- Name: 3a8d834a1df7
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if string.find(l_0_0, "cymulate", 1, true) or string.find(l_0_0, "edr_attack", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
