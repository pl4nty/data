-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15b3faedac49\0x0000043a_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
AddResearchData(l_0_0.ppid, true)
local l_0_1 = (MpCommon.EnumThreatHistory)("", 3600, (crypto.bitor)(MpCommon.THREAT_HISTORY_CATEGORY_ASR, MpCommon.THREAT_HISTORY_CATEGORY_NP))
if next(l_0_1) then
  (bm.add_related_string)("EnumThreatHistory", safeJsonSerialize(l_0_1), bm.RelatedStringBMReport)
end
return mp.INFECTED

