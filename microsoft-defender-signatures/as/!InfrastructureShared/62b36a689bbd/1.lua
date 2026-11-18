-- Threat: !InfrastructureShared
-- Name: 62b36a689bbd
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil and this_sigattrlog[3].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_0) and (SuspMacPathsToMonitor(l_0_0, true) or string.find(l_0_0, "/Users/[^/]+/Downloads/", 1, false) or string.find(l_0_0, "/Users/[^/]+/Documents/", 1, false) or string.find(l_0_0, "/Users/[^/]+/Desktop/", 1, false)) then
  return mp.INFECTED
end
return mp.CLEAN
