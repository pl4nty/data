-- Threat: !InfrastructureShared
-- Name: 125b3ddf68726
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0, l_0_1, l_0_2, l_0_3
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[2].utf8p2 ~= "" then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil and this_sigattrlog[4].utf8p1 ~= "" then
  l_0_1 = this_sigattrlog[4].utf8p1
end
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil and this_sigattrlog[6].utf8p1 ~= "" then
  l_0_3 = this_sigattrlog[6].utf8p1
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil and this_sigattrlog[5].utf8p2 ~= "" then
  l_0_2 = this_sigattrlog[5].utf8p2
end
if not IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_3) then
  return mp.CLEAN
end
local l_0_4 = l_0_1:match("[^/]*$")
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
if string.find(l_0_2, l_0_4, 1, true) and string.find(l_0_0, l_0_4, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
