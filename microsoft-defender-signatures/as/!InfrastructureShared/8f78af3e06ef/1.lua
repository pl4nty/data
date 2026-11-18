-- Threat: !InfrastructureShared
-- Name: 8f78af3e06ef
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if l_0_0 ~= nil and string.find(l_0_0, "\\system", 1, true) == nil and string.find(l_0_0, "program files", 1, true) == nil then
  return mp.INFECTED
end
return mp.CLEAN
