-- Threat: !InfrastructureShared
-- Name: 41b3a4cd9a88
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if string.find(l_0_0, "-psk", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
