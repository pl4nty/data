-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6eb36970031f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.EnumThreatHistory)("", 7200, (crypto.bitor)(MpCommon.THREAT_HISTORY_CATEGORY_ASR, MpCommon.THREAT_HISTORY_CATEGORY_NP))
for l_0_4,l_0_5 in ipairs(l_0_0) do
  if l_0_5.Severity ~= 5 then
    return mp.CLEAN
  end
  ;
  (bm.add_related_string)("Ransom_EnumThreatHistory", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
  do return mp.INFECTED end
end
return mp.CLEAN

