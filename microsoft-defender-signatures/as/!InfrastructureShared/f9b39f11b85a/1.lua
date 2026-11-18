-- Threat: !InfrastructureShared
-- Name: f9b39f11b85a
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
local l_0_1
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[4].utf8p2
end
if l_0_0 ~= nil and l_0_0 ~= "" and l_0_1 ~= nil and l_0_1 ~= "" then
  return mp.INFECTED
end
return mp.CLEAN
