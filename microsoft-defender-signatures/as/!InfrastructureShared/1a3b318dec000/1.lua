-- Threat: !InfrastructureShared
-- Name: 1a3b318dec000
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if IsDiscoveryCollectionThresholdMetLinux(l_0_0.ppid) then
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
