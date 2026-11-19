-- Threat: !InfrastructureShared
-- Name: d3b35014edee
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil and this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
  l_0_1 = this_sigattrlog[3].utf8p1
  l_0_2 = this_sigattrlog[4].utf8p1
end
if l_0_0 == nil and l_0_1 == nil and l_0_2 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
l_0_2 = string.lower(l_0_2)
l_0_1 = string.lower(l_0_1)
local l_0_3 = l_0_0:match("([^\\/:]+)%.job$")
local l_0_4 = l_0_2:match("([^\\/:]+)%.exe$")
local l_0_5 = l_0_1:match("temp\\(.-)$")
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
if l_0_4 == "" or l_0_4 == nil then
  return mp.CLEAN
end
if l_0_5 == "" or l_0_5 == nil then
  return mp.CLEAN
end
if l_0_3 == l_0_4 and l_0_5:match("([a-z0-9]+)$") then
  return mp.INFECTED
end
return mp.CLEAN
