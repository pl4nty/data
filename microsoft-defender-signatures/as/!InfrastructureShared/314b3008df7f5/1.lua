-- Threat: !InfrastructureShared
-- Name: 314b3008df7f5
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = 50000000
if l_0_0 < bm.GetSignatureMatchDuration() then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1552.001", "CredentialAccess")
return mp.INFECTED
