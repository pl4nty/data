-- Threat: !InfrastructureShared
-- Name: 7fb33c811a39
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil and IsDetectionThresholdMetLinuxWrapper(l_0_0.ppid) then
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
