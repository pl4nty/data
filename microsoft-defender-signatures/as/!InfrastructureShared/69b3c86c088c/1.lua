-- Threat: !InfrastructureShared
-- Name: 69b3c86c088c
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].utf8p1
end
if this_sigattrlog[3].matched then
  l_0_2 = this_sigattrlog[3].utf8p1
end
if l_0_0 == nil or l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
if l_0_1 ~= l_0_2 then
  return mp.CLEAN
end
local l_0_3, l_0_4 = l_0_0:match("(.+\\)([^\\]+)$")
local l_0_5, l_0_6 = l_0_1:match("(.+\\)([^\\]+)$")
if l_0_3 ~= l_0_5 then
  return mp.CLEAN
end
local l_0_7, l_0_8 = string.match(l_0_4, "(.+)(%.[^%.]*)")
local l_0_9, l_0_10 = string.match(l_0_6, "(.+)(%.[^%.]*)")
if l_0_7 == nil or l_0_9 == nil then
  return mp.CLEAN
end
local l_0_11 = string.match(l_0_9, "(.+)%(.+%)$")
if l_0_11 ~= l_0_7 then
  return mp.CLEAN
end
return mp.INFECTED
