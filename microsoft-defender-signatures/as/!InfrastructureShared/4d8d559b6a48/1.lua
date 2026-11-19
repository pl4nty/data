-- Threat: !InfrastructureShared
-- Name: 4d8d559b6a48
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if SuspMacPathsToMonitor(l_0_0, true) then
  return mp.INFECTED
end
return mp.CLEAN
