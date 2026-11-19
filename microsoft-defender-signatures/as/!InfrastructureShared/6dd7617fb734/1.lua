-- Threat: !InfrastructureShared
-- Name: 6dd7617fb734
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid ~= "" then
  TrackPidAndTechnique(l_0_0.ppid, "T1490", "Impact_InhibitSystemRecovery_virsh")
end
return mp.INFECTED
