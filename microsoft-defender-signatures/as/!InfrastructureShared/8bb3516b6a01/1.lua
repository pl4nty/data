-- Threat: !InfrastructureShared
-- Name: 8bb3516b6a01
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" and this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[2].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[3].utf8p2
  if IsExcludedByCmdlineMacOS(this_sigattrlog[2].utf8p2) or IsExcludedByImagePathMacOS(this_sigattrlog[2].utf8p1) then
    return mp.CLEAN
  end
  if SuspMacPathsToMonitor(l_0_0, true) and IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_0) then
    bm.add_related_string("created_process", l_0_0, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
