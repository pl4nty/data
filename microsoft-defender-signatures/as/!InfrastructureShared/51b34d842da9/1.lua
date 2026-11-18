-- Threat: !InfrastructureShared
-- Name: 51b34d842da9
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= nil and l_0_1 ~= nil and string.find(l_0_1, l_0_0, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
