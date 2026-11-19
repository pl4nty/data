-- Threat: !InfrastructureShared
-- Name: 1229e8f7f0a0
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "kendo", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
