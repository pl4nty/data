-- Threat: !InfrastructureShared
-- Name: 13b8d7fe81865
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("avkitroutingservice", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
