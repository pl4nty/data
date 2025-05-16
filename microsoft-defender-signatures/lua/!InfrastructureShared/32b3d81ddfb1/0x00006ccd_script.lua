-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3d81ddfb1\0x00006ccd_luac 

-- params : ...
-- function num : 0
if IsDetectionThresholdMet("BM") then
  return mp.INFECTED
end
return mp.CLEAN

