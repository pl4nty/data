-- Threat: !InfrastructureShared
-- Name: 2dfb3a7847f86
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
local l_0_1 = string.match(l_0_0, "%S+%s+%S+")
if l_0_1 == nil then
  return mp.INFECTED
end
return mp.CLEAN
