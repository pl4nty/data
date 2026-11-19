-- Threat: !InfrastructureShared
-- Name: 2f29395b213b
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0:find("kali", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
