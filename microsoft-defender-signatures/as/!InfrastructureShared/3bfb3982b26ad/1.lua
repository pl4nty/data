-- Threat: !InfrastructureShared
-- Name: 3bfb3982b26ad
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = 50000000
if l_0_0 < bm.GetSignatureMatchDuration() then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1486", "Impact_Encryption")
RemediateProcessTreeForLinux()
return mp.INFECTED
