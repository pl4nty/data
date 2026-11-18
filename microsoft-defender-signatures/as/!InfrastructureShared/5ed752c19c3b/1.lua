-- Threat: !InfrastructureShared
-- Name: 5ed752c19c3b
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid ~= "" then
  TrackPidAndTechnique(l_0_0.ppid, "T1548", "PrivilegeEscalation")
end
return mp.INFECTED
