-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c0b34989f90d\1.luac 

-- params : ...
-- function num : 0
if IsDetectionThresholdMet("BM") then
  TrackPidAndTechniqueBM("BM", "T1074", "DataStage")
  return mp.INFECTED
end
return mp.CLEAN

