-- Threat: !InfrastructureShared
-- Name: 11bb3b658b7b1
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
end
l_0_1 = string.lower(this_sigattrlog[1].utf8p1)
if l_0_0 and l_0_1 and string.find(l_0_0, l_0_1, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
