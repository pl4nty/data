-- Threat: !InfrastructureShared
-- Name: 12a610536e920
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:find("\\temp\\", 1, true) ~= nil and l_0_0:find("\\system", 1, true) == nil then
  return mp.INFECTED
end
return mp.CLEAN
