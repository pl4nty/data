-- Threat: !InfrastructureShared
-- Name: 5a293f89e93d
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if string.find(l_0_0, "\\dboconfig", 1, true) ~= nil or string.find(l_0_0, "\\provisioning\\", 1, true) ~= nil then
  return mp.CLEAN
end
return mp.INFECTED
