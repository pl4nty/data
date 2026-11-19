-- Threat: !InfrastructureShared
-- Name: 55b30f463e75
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if l_0_0 ~= nil and not string.find(l_0_0, ".zip", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
