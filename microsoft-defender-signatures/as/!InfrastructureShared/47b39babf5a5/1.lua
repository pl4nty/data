-- Threat: !InfrastructureShared
-- Name: 47b39babf5a5
-- Type: 21

local l_0_0 = this_sigattrlog[1]
if not l_0_0.utf8p1 or not l_0_0.utf8p2 then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p1
local l_0_2 = l_0_0.utf8p2
local l_0_3 = string.match(l_0_2, "SystemToken:\"([%a%d]+)\";")
local l_0_4 = string.match(l_0_1, "Token:\"([%a%d]+)\";")
local l_0_5 = string.match(l_0_2, "Token:\"([%a%d]+)\";")
if l_0_4 ~= l_0_5 and l_0_5 == l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
