-- Threat: !InfrastructureShared
-- Name: 121d73031b9a8
-- Type: 21
-- Flags: 1
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  TrackPidAndTechnique(l_0_0.ppid, "T1562.001", "DefenseEvasion")
end
return mp.LOWFI
