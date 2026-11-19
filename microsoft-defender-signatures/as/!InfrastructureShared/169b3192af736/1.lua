-- Threat: !InfrastructureShared
-- Name: 169b3192af736
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 == nil or l_0_1.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_1.ppid, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1027.002", "DefenseEvasion_ObfuscatedFilesInformation_SoftwarePacking")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
