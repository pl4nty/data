-- Threat: !InfrastructureShared
-- Name: 45d740968d83
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  TrackPidAndTechnique(l_0_0.ppid, "T1572", "CommandAndControl")
end
return mp.INFECTED
