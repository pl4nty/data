-- Threat: !InfrastructureShared
-- Name: 44292e7f9a90
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:find("udaxihh.rsa") then
  return mp.INFECTED
end
return mp.CLEAN
