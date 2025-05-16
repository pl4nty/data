-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c5d7425ecff3\0x00000624_luac 

-- params : ...
-- function num : 0
if IsPidExcluded("CMDHSTR") then
  return mp.CLEAN
end
TrackPidAndTechnique("CMDHSTR", "T1059", "lolbin_script")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.INFECTED
end
return mp.LOWFI

