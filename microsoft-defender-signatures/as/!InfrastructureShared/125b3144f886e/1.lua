-- Threat: !InfrastructureShared
-- Name: 125b3144f886e
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
if 80 < #l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
