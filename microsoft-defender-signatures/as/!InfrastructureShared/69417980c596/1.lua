-- Threat: !InfrastructureShared
-- Name: 69417980c596
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p1
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[5].utf8p1
end
if l_0_0 ~= nil and l_0_1 ~= nil and l_0_0 ~= nil and l_0_1 ~= nil and (l_0_0 == l_0_1 or string.match(l_0_0, "^127.") or string.match(l_0_0, "^::1*") or string.match(l_0_0, "^0.0.0.0")) then
  return mp.CLEAN
end
return mp.INFECTED
