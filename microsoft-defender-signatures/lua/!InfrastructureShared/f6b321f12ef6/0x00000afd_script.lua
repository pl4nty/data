-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f6b321f12ef6\0x00000afd_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 ~= nil and l_0_0.ppid ~= nil and IsDetectionThresholdMetLinuxWrapper(l_0_0.ppid) then
  AddResearchData("BM", true)
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1080", "LateralMovement_TaintSharedContent_ThresholdMetForMountedFile")
  return mp.INFECTED
end
return mp.CLEAN

