-- Threat: !InfrastructureShared
-- Name: 7d41d0f9b5dc
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1
end
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[6].utf8p1
end
if l_0_0 ~= nil and l_0_1 ~= nil and (l_0_0 == l_0_1 or string.match(l_0_0, "^127.") or string.match(l_0_0, "^::1*") or string.match(l_0_0, "^0.0.0.0")) then
  return mp.CLEAN
end
local l_0_2 = nri.GetURI()
if l_0_2 and IsUriKnownHostname(string.lower(l_0_2)) then
  return mp.CLEAN
end
return mp.INFECTED
