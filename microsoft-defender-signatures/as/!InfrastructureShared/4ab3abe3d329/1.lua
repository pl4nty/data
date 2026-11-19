-- Threat: !InfrastructureShared
-- Name: 4ab3abe3d329
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0, l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[2].utf8p2 ~= "" and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[2].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[2].utf8p2
  l_0_1 = this_sigattrlog[2].utf8p1
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  local l_0_2 = "MAC_UNS_ADHOC_PATHS"
  local l_0_3 = 86400
  if not IsKeyValuePairInRollingQueue(l_0_2, "unsigned_adhoc_items", l_0_1) then
    AppendToRollingQueue(l_0_2, "unsigned_adhoc_items", l_0_1, l_0_3)
    bm.trigger_sig("BM_UnsignedOrAdhocMacBin", l_0_1)
    return mp.INFECTED
  end
end
return mp.CLEAN
