-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELTrojanWin32AdexperA\1.luac 

-- params : ...
-- function num : 0
if (mp.readu_u32)(headerpage, 1) == 762210679 and (mp.readu_u32)(headerpage, 5) == 1865245793 and (mp.readu_u16)(headerpage, 8) == 25199 then
  (mp.set_mpattribute)("BM_ADEXPER_A")
  return mp.INFECTED
end
return mp.CLEAN

