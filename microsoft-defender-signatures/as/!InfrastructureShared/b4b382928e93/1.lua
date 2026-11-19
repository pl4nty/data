-- Threat: !InfrastructureShared
-- Name: b4b382928e93
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1003.001", "credentialdumping_concrete", 86400)
else
  TrackPidAndTechniqueBM("BM", "T1003.001", "credentialdumping_concrete", 86400)
end
return mp.INFECTED
