-- Threat: !InfrastructureShared
-- Name: 15b33455380b
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil and IsTechniqueObservedForPid(l_0_0.ppid, "T1105") and versioning.GetCloudBlockLevel() >= 4 then
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1053.003", "Persistence")
  return mp.INFECTED
end
return mp.CLEAN
