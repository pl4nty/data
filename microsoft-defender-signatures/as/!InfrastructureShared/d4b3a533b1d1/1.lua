-- Threat: !InfrastructureShared
-- Name: d4b3a533b1d1
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
if not this_sigattrlog[2].matched or this_sigattrlog[2].utf8p1 == nil or this_sigattrlog[2].utf8p1 == "" or this_sigattrlog[2].utf8p2 == nil or this_sigattrlog[2].utf8p2 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(this_sigattrlog[2].utf8p2) or IsExcludedByImagePathMacOS(this_sigattrlog[2].utf8p1) then
  return mp.CLEAN
end
l_0_0 = this_sigattrlog[2].utf8p1
if SuspMacPathsToMonitor(l_0_0, true) and IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
