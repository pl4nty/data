-- Threat: !InfrastructureShared
-- Name: 25b34ceaaa03
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil and not isParentPackageManager(l_0_0.ppid, true) then
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1546", "Persistence")
  return mp.INFECTED
end
return mp.CLEAN
