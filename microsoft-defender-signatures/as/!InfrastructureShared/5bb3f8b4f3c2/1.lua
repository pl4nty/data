-- Threat: !InfrastructureShared
-- Name: 5bb3f8b4f3c2
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if not isParentPackageManager(l_0_0.ppid, true) and IsDetectionThresholdMetLinux(l_0_0.ppid) then
  AddResearchData("BM", true)
  reportRelatedBmHits()
  addRelatedProcess()
  return mp.INFECTED
end
return mp.CLEAN
