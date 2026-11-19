-- Threat: !InfrastructureShared
-- Name: 32b3a996d3c1
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil and IsDetectionThresholdMetLinuxWrapper(l_0_0.ppid) then
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_SuspiciousRemoteFileExecution")
  return mp.INFECTED
end
return mp.CLEAN
