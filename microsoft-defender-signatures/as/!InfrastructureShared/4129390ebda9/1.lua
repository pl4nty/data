-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4129390ebda9\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("BM_LNK_FILE") or (mp.get_mpattribute)("PACKED_WITH:[CMDEmbedded]") or (mp.get_mpattribute)("LNK_Classifier:IsUnicode") or (mp.get_mpattribute)("LNK_Classifier:RunMinimize") or (mp.get_mpattribute)("LNK_Classifier:HasArguments") then
  return mp.INFECTED
end
return mp.CLEAN

