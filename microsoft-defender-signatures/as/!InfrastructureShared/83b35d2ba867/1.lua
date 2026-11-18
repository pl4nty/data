-- Threat: !InfrastructureShared
-- Name: 83b35d2ba867
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1543.003", "persistence_services_b")
  return mp.INFECTED
end
return mp.CLEAN
