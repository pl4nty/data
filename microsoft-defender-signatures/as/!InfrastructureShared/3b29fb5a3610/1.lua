-- Threat: !InfrastructureShared
-- Name: 3b29fb5a3610
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("\\extensions", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("\\inetcache", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
