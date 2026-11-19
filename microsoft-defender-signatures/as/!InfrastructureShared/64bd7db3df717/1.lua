-- Threat: !InfrastructureShared
-- Name: 64bd7db3df717
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if l_0_0 ~= nil then
  TrackPidAndTechnique(l_0_0, "ttexclusion", "ttexclusion_cmdhstr")
end
return mp.CLEAN
