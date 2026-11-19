-- Threat: !InfrastructureShared
-- Name: 138b37a0a5d52
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
end
if l_0_0 == nil or #l_0_0 <= 4 or not StringEndsWith(l_0_0, ".exe") then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[5].utf8p2)
end
if l_0_1 == nil then
  return mp.CLEAN
end
if string.find(l_0_1, l_0_0, 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_2 = l_0_0:match("([^\\]+)$")
if l_0_2 == nil and #l_0_2 <= 4 then
  return mp.CLEAN
end
l_0_2 = " " .. l_0_2
if string.find(l_0_1, l_0_2, 1, true) ~= nil then
  AppendToRollingQueue("BmProcessSearchOrderHijackA", l_0_0, 1, 120)
  return mp.INFECTED
end
return mp.CLEAN
