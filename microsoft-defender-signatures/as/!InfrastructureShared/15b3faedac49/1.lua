-- Threat: !InfrastructureShared
-- Name: 15b3faedac49
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
AddResearchData(l_0_0.ppid, true)
local l_0_1 = MpCommon.EnumThreatHistory("", 3600, crypto.bitor(MpCommon.THREAT_HISTORY_CATEGORY_ASR, MpCommon.THREAT_HISTORY_CATEGORY_NP))
if next(l_0_1) then
  bm.add_related_string("EnumThreatHistory", safeJsonSerialize(l_0_1), bm.RelatedStringBMReport)
end
return mp.INFECTED
