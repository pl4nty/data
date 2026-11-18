-- Threat: !InfrastructureShared
-- Name: 49b32e2f17e3
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil and string.len(l_0_0) > 3 and (string.find(l_0_0, "-noni", 1, true) or string.find(l_0_0, "-ni", 1, true) or string.find(l_0_0, "hidden", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
