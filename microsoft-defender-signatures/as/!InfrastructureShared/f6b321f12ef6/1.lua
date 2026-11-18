-- Threat: !InfrastructureShared
-- Name: f6b321f12ef6
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil and IsDetectionThresholdMetLinuxWrapper(l_0_0.ppid) then
  AddResearchData("BM", true)
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1080", "LateralMovement_TaintSharedContent_ThresholdMetForMountedFile")
  return mp.INFECTED
end
return mp.CLEAN
