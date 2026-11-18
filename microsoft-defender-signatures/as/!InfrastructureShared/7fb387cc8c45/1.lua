-- Threat: !InfrastructureShared
-- Name: 7fb387cc8c45
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[1].utf8p1
  l_0_0 = this_sigattrlog[1].utf8p2
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_2 = string.match(this_sigattrlog[2].utf8p2, "TargetPPID:(%d+):")
end
if l_0_0 == nil or l_0_2 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_3, l_0_4 = pcall(mp.GetPPidFromPid, l_0_2)
if l_0_3 == false or l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = IsPEBSpoofed(l_0_4, l_0_1, l_0_0)
if l_0_5 == true then
  return mp.INFECTED
end
return mp.CLEAN
