-- Threat: !InfrastructureShared
-- Name: 62b3826d42b9
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil or l_0_0.command_line == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1554", "Persistence_CompromiseClientSoftwareBinary_Cron")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
