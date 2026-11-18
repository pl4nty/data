-- Threat: !InfrastructureShared
-- Name: 11fb341a179bc
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = 30000000
if l_0_0 < bm.GetSignatureMatchDuration() then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1552.003", "CredentialAccess")
addRelatedProcess()
return mp.INFECTED
