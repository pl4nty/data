-- Threat: !InfrastructureShared
-- Name: 851b353bf07c7
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[40].matched and this_sigattrlog[40].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[40].utf8p2)
elseif this_sigattrlog[41].matched and this_sigattrlog[41].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[41].utf8p2)
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[42].matched and this_sigattrlog[42].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[42].utf8p2)
elseif this_sigattrlog[43].matched and this_sigattrlog[43].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[43].utf8p2)
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if string.find(l_0_1, l_0_0, 1, true) then
  reportRelatedBmHits()
  addRelatedProcess()
  return mp.INFECTED
end
return mp.CLEAN
