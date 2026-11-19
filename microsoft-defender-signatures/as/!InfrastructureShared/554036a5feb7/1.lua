-- Threat: !InfrastructureShared
-- Name: 554036a5feb7
-- Type: 21

local l_0_0 = string.lower(mp.getfilename(mp.FILEPATH_QUERY_FNAME))
if l_0_0 ~= "sbiedll.dll" then
  return mp.CLEAN
end
return mp.INFECTED
