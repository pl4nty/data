-- Threat: !InfrastructureShared
-- Name: 2fbb3873df364
-- Type: 21
-- Includes: BMLuaLib, Path

local l_0_0
if this_sigattrlog[17].matched and this_sigattrlog[17].utf8p1 ~= nil then
  l_0_0 = string.lower(normalize_path(this_sigattrlog[17].utf8p1))
end
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = string.lower(normalize_path(l_0_1))
local l_0_2 = "Posilod"
local l_0_3
local l_0_4, l_0_5 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_0_1, l_0_2, "CreatedByPPID")
if l_0_4 == true then
  l_0_3 = l_0_5.value
end
if isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_6
local l_0_7, l_0_8 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_0_0, l_0_2, "CreatedByPPID")
if l_0_7 == true then
  l_0_6 = l_0_8.value
end
if isnull(l_0_6) then
  return mp.CLEAN
end
if l_0_3 == l_0_6 then
  bm.add_related_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
