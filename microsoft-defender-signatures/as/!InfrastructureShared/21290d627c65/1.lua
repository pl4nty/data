-- Threat: !InfrastructureShared
-- Name: 21290d627c65
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, ".json") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
