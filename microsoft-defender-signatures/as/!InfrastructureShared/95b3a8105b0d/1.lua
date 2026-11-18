-- Threat: !InfrastructureShared
-- Name: 95b3a8105b0d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil or l_0_0.ppid == "" then
  return mp.CLEAN
end
if versioning.GetCloudBlockLevel() >= 4 and CheckIfProcessTreePartOfTaintExecution(l_0_0.ppid, 5, true) then
  TrackPidAndTechniqueBM("BM", "T1048", "Exfiltration_Archive")
  addRelatedProcess()
  reportRelatedBmHits()
  RemediateProcessTreeForLinux()
  return mp.INFECTED
end
return mp.CLEAN
