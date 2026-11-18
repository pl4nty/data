-- Threat: !InfrastructureShared
-- Name: 142b309e7832e
-- Type: 21

local l_0_0 = this_sigattrlog[3]
if l_0_0 == nil or l_0_0.matched ~= true or l_0_0.utf8p1 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.utf8p1)
local l_0_2 = string.find(l_0_1, "\\scheduledtasks\\", 1, true) or string.find(l_0_1, "\\files\\", 1, true) or string.find(l_0_1, "\\folders\\", 1, true) or string.find(l_0_1, "\\groups\\", 1, true) or string.find(l_0_1, "\\registry\\", 1, true)
if not l_0_2 then
  return mp.CLEAN
end
return mp.INFECTED
