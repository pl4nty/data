-- Threat: !InfrastructureShared
-- Name: b4b308c1e8a1
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if string.find(l_0_0, "c:\\programdata\\package cache\\{", 1, true) or string.find(l_0_0, " /burn.runonce", 1, true) then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = string.match(l_0_1, "\\([^\\]+)$")
if l_0_2 ~= nil and string.find(l_0_0, l_0_2, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
