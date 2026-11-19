-- Threat: !InfrastructureShared
-- Name: 4fd7a84e069a
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  TrackPidAndTechnique(l_0_0.ppid, "T1572", "CommandAndControl")
end
return mp.INFECTED
