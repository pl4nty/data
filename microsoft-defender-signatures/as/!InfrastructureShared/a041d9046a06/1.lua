-- Threat: !InfrastructureShared
-- Name: a041d9046a06
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if l_0_0 ~= nil and l_0_0:find("putty", 1, true) ~= nil then
  return mp.CLEAN
end
return mp.INFECTED
