-- Threat: !InfrastructureShared
-- Name: 15b37b90815d
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and l_0_0.ppid then
  TrackPidAndMultipleTechniquesBM(l_0_0.ppid, {
    T1001 = "c2_tls_masquerade",
    T1041 = "c2_tls_masquerade",
    T1571 = "c2_tls_masquerade"
  })
end
return mp.INFECTED
