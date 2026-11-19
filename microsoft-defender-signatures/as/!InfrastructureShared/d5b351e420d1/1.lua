-- Threat: !InfrastructureShared
-- Name: d5b351e420d1
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and l_0_0.ppid then
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1565", "tamper_hosts_maliciousdomain")
end
return mp.INFECTED
