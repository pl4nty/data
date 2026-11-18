-- Threat: !InfrastructureShared
-- Name: bbb3db38ca4a
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0, l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
  l_0_1 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
  l_0_1 = this_sigattrlog[3].utf8p1
end
local l_0_2 = false
if l_0_0 == "THREAT" then
  l_0_2 = true
end
local l_0_3 = l_0_0 == "THREAT" and 5 or 1
AppendToRollingQueue("RecentThreatsOnMachine", l_0_1, l_0_3, 1800, 100)
local l_0_4 = MpCommon.PathToWin32Path(bm.get_imagepath())
if l_0_4 == nil then
  return mp.CLEAN
end
if sysio.IsPathAVExcluded(l_0_4, false) == true then
  bm.add_related_string("isBMConcrete", tostring(l_0_2), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
