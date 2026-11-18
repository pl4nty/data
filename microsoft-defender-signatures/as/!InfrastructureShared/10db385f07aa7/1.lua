-- Threat: !InfrastructureShared
-- Name: 10db385f07aa7
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= nil and (string.find(string.lower(l_0_0), "\\windows\\", 1, true) or string.find(string.lower(l_0_0), "\\system32\\", 1, true)) then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[3].utf8p2
end
if l_0_1 ~= nil and (string.find(string.lower(l_0_1), "\\windows\\", 1, true) or string.find(string.lower(l_0_1), "\\system32\\", 1, true)) then
  return mp.CLEAN
end
return mp.INFECTED
