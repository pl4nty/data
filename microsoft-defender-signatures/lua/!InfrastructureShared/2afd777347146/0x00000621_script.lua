-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2afd777347146\0x00000621_luac 

-- params : ...
-- function num : 0
TrackPidAndTechnique("CMDHSTR", "T1497", "virtualization_evasion")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.INFECTED
end
return mp.LOWFI

