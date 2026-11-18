-- Threat: !InfrastructureShared
-- Name: 15b3f7890ac5
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and l_0_0.ppid then
  TrackPidAndMultipleTechniquesBM(l_0_0.ppid, {T1030 = "exfil_bgp", T1041 = "exfil_bgp"})
end
return mp.INFECTED
