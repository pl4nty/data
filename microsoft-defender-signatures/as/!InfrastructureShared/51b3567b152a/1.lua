-- Threat: !InfrastructureShared
-- Name: 51b3567b152a
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].wp1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched and this_sigattrlog[3].wp1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 and string.match(l_0_0, "/%.[^/]+$") then
  return mp.INFECTED
end
return mp.CLEAN
