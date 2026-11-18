-- Threat: !InfrastructureShared
-- Name: 132936886a47
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("CoreAPI.py", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
