-- Threat: !InfrastructureShared
-- Name: 21cb3bd0c6960
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if IsProcessExcludedFromRansomwareAnalysis() == true then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil and IsDetectionThresholdMetLinux(l_0_0.ppid) then
  AddResearchData("BM", true)
  reportRelatedBmHits()
  addRelatedProcess()
  return mp.INFECTED
end
TrackPidAndTechniqueBM("BM", "T1082", "Discovery")
return mp.CLEAN
