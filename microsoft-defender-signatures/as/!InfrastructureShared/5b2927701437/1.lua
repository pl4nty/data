-- Threat: !InfrastructureShared
-- Name: 5b2927701437
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find(".search-ms", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
