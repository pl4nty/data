-- Threat: !InfrastructureShared
-- Name: bb78f35eb449
-- Type: 21

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FNAME):lower()
if l_0_0:find("blackbone", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
