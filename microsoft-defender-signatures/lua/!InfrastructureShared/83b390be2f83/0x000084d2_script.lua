-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\83b390be2f83\0x000084d2_luac 

-- params : ...
-- function num : 0
if IsTacticObservedGlobal("uac_bypass") then
  AddResearchData("BM", true)
  return mp.INFECTED
end
return mp.CLEAN

