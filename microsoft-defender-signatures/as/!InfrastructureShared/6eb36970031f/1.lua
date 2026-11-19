-- Threat: !InfrastructureShared
-- Name: 6eb36970031f
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = MpCommon.EnumThreatHistory("", 7200, crypto.bitor(MpCommon.THREAT_HISTORY_CATEGORY_ASR, MpCommon.THREAT_HISTORY_CATEGORY_NP))
for l_0_1, l_0_2 in ipairs(l_0_0) do
  if l_0_2.Severity ~= 5 then
    return mp.CLEAN
  end
  bm.add_related_string("Ransom_EnumThreatHistory", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
