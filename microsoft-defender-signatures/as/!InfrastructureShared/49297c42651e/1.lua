-- Threat: !InfrastructureShared
-- Name: 49297c42651e
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find(".url", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
