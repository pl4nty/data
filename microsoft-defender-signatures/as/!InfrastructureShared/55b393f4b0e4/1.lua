-- Threat: !InfrastructureShared
-- Name: 55b393f4b0e4
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1003.001", "credentialdumping", 86400)
  return mp.INFECTED
end
return mp.CLEAN
