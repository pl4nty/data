-- Threat: !InfrastructureShared
-- Name: 5829fbcd83e3
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("\\microsoft\\windows\\currentversion\\run\\", 1, true) or l_0_0:find("\\microsoft\\windows\\currentversion\\policies\\explorer\\run\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
