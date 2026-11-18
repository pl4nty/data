-- Threat: !InfrastructureShared
-- Name: 3fd7ebfeea6b
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid ~= "" then
  TrackPidAndTechnique(l_0_0.ppid, "T1489", "Impact_ServiceStop_Virsh")
end
return mp.INFECTED
