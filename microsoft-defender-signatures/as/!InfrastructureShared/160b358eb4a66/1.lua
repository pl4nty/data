-- Threat: !InfrastructureShared
-- Name: 160b358eb4a66
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil and (IsDetectionThresholdMetLinuxWrapper(l_0_0.ppid) or IsDiscoveryCollectionThresholdMetLinux(l_0_0.ppid)) then
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
