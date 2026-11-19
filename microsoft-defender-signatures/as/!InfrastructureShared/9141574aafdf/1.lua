-- Threat: !InfrastructureShared
-- Name: 9141574aafdf
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil and this_sigattrlog[6].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[6].utf8p1
end
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil and this_sigattrlog[7].utf8p1 ~= "" then
  l_0_1 = this_sigattrlog[7].utf8p1
end
if l_0_0 ~= nil and l_0_1 ~= nil and (l_0_0 == l_0_1 or string.match(l_0_0, "^127.") or string.match(l_0_0, "^::1*") or string.match(l_0_0, "^0.0.0.0")) then
  return mp.CLEAN
end
return mp.INFECTED
