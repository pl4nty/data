-- Threat: !InfrastructureShared
-- Name: 20293943f4b2
-- Type: 21

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL):lower()
if not l_0_0:find("assets/", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
