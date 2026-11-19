-- Threat: !InfrastructureShared
-- Name: 1a3b36ba2fb8a
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = 50000000
if l_0_0 < bm.GetSignatureMatchDuration() then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1486", "Impact_Encryption")
return mp.INFECTED
