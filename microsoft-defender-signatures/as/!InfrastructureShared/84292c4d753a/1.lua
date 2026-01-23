-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84292c4d753a\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("BM_LNK_FILE") or (mp.get_mpattribute)("PACKED_WITH:[CMDEmbedded]") then
  return mp.INFECTED
end
return mp.CLEAN

