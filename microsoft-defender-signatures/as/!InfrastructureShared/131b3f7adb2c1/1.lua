-- Threat: !InfrastructureShared
-- Name: 131b3f7adb2c1
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[6].utf8p1)
end
if l_0_1 == nil then
  return mp.CLEAN
end

local function l_0_2(l_1_0)
  return l_1_0:match("^(.*)[/\\][^/\\]+$")
end

local l_0_3 = l_0_2(l_0_0)
if l_0_3 == nil or #l_0_3 <= 3 then
  return mp.CLEAN
end
local l_0_4 = l_0_2(l_0_1)
if l_0_4 == nil or #l_0_4 <= 3 then
  return mp.CLEAN
end
if l_0_3 ~= l_0_4 then
  return mp.CLEAN
end
bm.add_related_file(l_0_1)
return mp.INFECTED
