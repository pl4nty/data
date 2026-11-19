-- Threat: !InfrastructureShared
-- Name: 193d7f45f3606
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 then
  TrackPidAndTechnique(l_0_0.ppid, "T1562.001", "mptamper-titokensteal")
end
return mp.INFECTED
