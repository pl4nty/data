-- Threat: !InfrastructureShared
-- Name: 89b3ae610d6c
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].wp1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
end
if this_sigattrlog[3].matched and this_sigattrlog[3].wp2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].wp2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[4].utf8p2)
end
if l_0_0 ~= nil and l_0_1 ~= nil and string.find(l_0_0, l_0_1, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
