-- Threat: !InfrastructureShared
-- Name: 4ab32b2323dd
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[2].matched or this_sigattrlog[2].utf8p1 == nil or this_sigattrlog[2].utf8p1 == "" then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[2].utf8p1
if not SuspMacPathsToMonitor(l_0_0, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1204.002", "Execution_UserExecution_MaliciousFile")
return mp.INFECTED
