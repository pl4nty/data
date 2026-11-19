-- Threat: !InfrastructureShared
-- Name: c1d772336d22
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  TrackPidAndTechnique(l_0_0.ppid, "T1486", "Impact_Encryption")
end
return mp.INFECTED
