-- Threat: !InfrastructureShared
-- Name: 7bb334a1f032
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].wp2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if string.match(l_0_0, "%d+%.%d+%.%d+%.%d+") then
  return mp.INFECTED
end
return mp.CLEAN
