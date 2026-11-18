-- Threat: !InfrastructureShared
-- Name: 4ab3f15bc3b3
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[2].matched or this_sigattrlog[2].utf8p1 == nil or this_sigattrlog[2].utf8p1 == "" then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[2].utf8p1
if SuspMacPathsToMonitor(l_0_0, true) or string.find(l_0_0, "/Users/[^/]+/Downloads/", 1, false) or string.find(l_0_0, "/Users/[^/]+/Documents/", 1, false) or string.find(l_0_0, "/Users/[^/]+/Desktop/", 1, false) then
  TrackPidAndTechniqueBM("BM", "T1204.002", "Execution_UserExecution_MaliciousFile")
  return mp.INFECTED
end
return mp.CLEAN
