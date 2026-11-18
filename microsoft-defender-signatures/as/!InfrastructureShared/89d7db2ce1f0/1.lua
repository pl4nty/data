-- Threat: !InfrastructureShared
-- Name: 89d7db2ce1f0
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  TrackPidAndTechnique(l_0_0.ppid, "T1564.002", "DefenseEvasion_HideArtifacts_HiddenUsers")
end
return mp.INFECTED
