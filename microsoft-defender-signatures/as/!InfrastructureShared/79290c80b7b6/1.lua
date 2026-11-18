-- Threat: !InfrastructureShared
-- Name: 79290c80b7b6
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, ".diagcab->", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
