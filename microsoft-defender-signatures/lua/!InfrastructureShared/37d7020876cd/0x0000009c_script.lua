-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\37d7020876cd\0x0000009c_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil or l_0_0.ppid == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
TrackPidAndTechnique(l_0_0.ppid, "T1087", "runs_joeware_adfind")
if IsDetectionThresholdMet(l_0_0.ppid) then
  return mp.INFECTED
end
return mp.CLEAN

