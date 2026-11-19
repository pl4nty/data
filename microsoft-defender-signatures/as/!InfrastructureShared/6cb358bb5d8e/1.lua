-- Threat: !InfrastructureShared
-- Name: 6cb358bb5d8e
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 == nil then
  return mp.CLEAN
end
local l_0_4 = string.lower(this_sigattrlog[1].utf8p2)
l_0_1 = string.match(l_0_4, "\\([^\\]+)$")
if this_sigattrlog[1].wp1 == nil then
  return mp.CLEAN
end
local l_0_5 = string.lower(this_sigattrlog[1].utf8p1)
l_0_0 = string.match(l_0_5, "\\([^\\]+)$")
if this_sigattrlog[2].matched and this_sigattrlog[2].wp1 == nil then
  return mp.CLEAN
end
local l_0_6 = string.lower(this_sigattrlog[2].utf8p1)
l_0_2 = string.match(l_0_6, "\\([^\\]+)$")
if this_sigattrlog[3].matched and this_sigattrlog[3].wp2 == nil then
  return mp.CLEAN
end
local l_0_7 = string.lower(this_sigattrlog[3].utf8p2)
l_0_3 = string.match(l_0_7, "\\([^\\]+)$")
if l_0_1 == l_0_2 and l_0_1 ~= nil and l_0_0 == l_0_3 and l_0_0 ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
