-- Threat: !InfrastructureShared
-- Name: 4e1b3b0246ac1
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  if isParentPackageManager(l_0_0.ppid, true) then
    return mp.CLEAN
  end
  if IsDetectionThresholdMetLinuxWrapper(l_0_0.ppid) or IsDiscoveryCollectionThresholdMetLinux(l_0_0.ppid) then
    addRelatedProcess()
    reportRelatedBmHits()
    return mp.INFECTED
  end
end
return mp.CLEAN
