-- Threat: !InfrastructureShared
-- Name: 1c5b35fa19eca
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1078.003", "Persistence")
return mp.INFECTED
