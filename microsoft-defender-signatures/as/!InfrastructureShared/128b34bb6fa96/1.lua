-- Threat: !InfrastructureShared
-- Name: 128b34bb6fa96
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1027.008", "DefenseEvasion_ObfuscatedFilesInformation_StrippedPayloads")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
