-- Threat: !InfrastructureShared
-- Name: 1c292af082e7
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0 ~= "package.json" then
  return mp.CLEAN
end
return mp.INFECTED
