-- Threat: !InfrastructureShared
-- Name: 2c298850ae43
-- Type: 21

local l_0_0 = mp.getfilename():lower()
if string.find(l_0_0, ":\\users\\", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
