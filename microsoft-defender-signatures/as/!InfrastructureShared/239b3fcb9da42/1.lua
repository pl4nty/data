-- Threat: !InfrastructureShared
-- Name: 239b3fcb9da42
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if IsDiscoveryCollectionThresholdMetLinux(l_0_0.ppid) then
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
