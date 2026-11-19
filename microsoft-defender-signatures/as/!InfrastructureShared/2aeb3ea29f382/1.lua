-- Threat: !InfrastructureShared
-- Name: 2aeb3ea29f382
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil and IsDetectionThresholdMetLinuxWrapper(l_0_0.ppid) then
  AddResearchData("BM", true)
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1059", "Execution_CommandandScriptingInterpreter_RemoteScriptExecution")
  return mp.INFECTED
end
return mp.CLEAN
