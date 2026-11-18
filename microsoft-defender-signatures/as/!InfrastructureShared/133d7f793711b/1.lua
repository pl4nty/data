-- Threat: !InfrastructureShared
-- Name: 133d7f793711b
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid ~= "" then
  TrackPidAndTechnique(l_0_0.ppid, "T1548.001", "PrivilegeEscalation_AbuseElevationControl_Setuid")
end
return mp.INFECTED
