-- Threat: !InfrastructureShared
-- Name: 2bb38d893521
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil and string.match(l_0_0, "%d+%.%d+%.%d+%.%d+") then
  return mp.INFECTED
end
return mp.CLEAN
