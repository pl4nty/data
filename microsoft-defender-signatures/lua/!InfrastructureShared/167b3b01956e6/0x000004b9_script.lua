-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\167b3b01956e6\0x000004b9_luac 

-- params : ...
-- function num : 0
if IsDetectionThresholdMet("BM") then
  return mp.INFECTED
end
return mp.CLEAN

