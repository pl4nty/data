-- Threat: !InfrastructureShared
-- Name: 47b38cdeaae1
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = GetRollingQueueKeyValue("IsExchgServerTainted", "MpEnableTaintTracking")
if l_0_0 ~= nil then
  local l_0_1
  if this_sigattrlog[1].matched then
    l_0_1 = this_sigattrlog[1].utf8p2
  end
  if l_0_1 ~= nil then
    bm.add_related_string("FTATAdpativeServerTool", l_0_1, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
