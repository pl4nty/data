-- Threat: !InfrastructureShared
-- Name: 4d29aa09e56c
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if string.find(l_0_0, "\\provisioning\\", 1, true) ~= nil then
  return mp.CLEAN
end
return mp.INFECTED
