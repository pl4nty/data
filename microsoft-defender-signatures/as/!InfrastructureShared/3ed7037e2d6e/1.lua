-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3ed7037e2d6e\1.luac 

-- params : ...
-- function num : 0
TrackPidAndTechnique("CMDHSTR", "T1057", "process_discovery")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.LOWFI
end
return mp.CLEAN

