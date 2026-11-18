-- Threat: !InfrastructureShared
-- Name: 198d7d1cc07d3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  TrackPidAndTechnique(l_0_0.ppid, "T1562.001", "mptamper_av")
end
return mp.INFECTED
