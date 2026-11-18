-- Threat: !InfrastructureShared
-- Name: 4c6b3d82895cd
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p1
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1
end
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p1
end
local l_0_1, l_0_2 = l_0_0:match("^(.-)\\\\(.-)$")
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = GetRegistryValue(l_0_1, l_0_2)
if l_0_3 then
  local l_0_4, l_0_5 = string.find(l_0_3, "\f\000\002\000\001", 80, true)
  if not l_0_5 then
    return mp.CLEAN
  end
  if string.find(l_0_3, " \136\0034\167\003", l_0_5, true) or string.find(l_0_3, "\129\019\202\166S\214", l_0_5, true) or string.find(l_0_3, "\f\136\027gO\244", l_0_5, true) or string.find(l_0_3, "\1720*\230\248=", l_0_5, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
