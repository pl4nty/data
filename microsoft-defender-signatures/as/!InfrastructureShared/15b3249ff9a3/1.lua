-- Threat: !InfrastructureShared
-- Name: 15b3249ff9a3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and l_0_0.ppid then
  TrackPidAndMultipleTechniquesBM(l_0_0.ppid, {T1030 = "exfil_ntp", T1041 = "exfil_ntp"})
end
return mp.INFECTED
