-- Threat: !InfrastructureShared
-- Name: 542941d71d57
-- Type: 21

local l_0_0 = mp.getfilename():lower()
if string.find(l_0_0, ":\\users\\", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
