-- Threat: !InfrastructureShared
-- Name: 117b358851dfa
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1]
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2]
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3]
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4]
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5]
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = "DataExfilCreatedFile"
local l_0_2 = string.lower(l_0_0.utf8p2)
local l_0_3 = IsKeyInRollingQueue("DataComTrack", l_0_1)
if l_0_3 and next(l_0_3) then
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    if contains(l_0_2, l_0_5) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
