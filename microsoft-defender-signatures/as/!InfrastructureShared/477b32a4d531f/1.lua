-- Threat: !InfrastructureShared
-- Name: 477b32a4d531f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1485", "Impact_DataDestruction_10dd")
return mp.INFECTED
