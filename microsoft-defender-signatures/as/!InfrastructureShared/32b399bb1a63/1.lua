-- Threat: !InfrastructureShared
-- Name: 32b399bb1a63
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if IsTechniqueObservedGlobal("CredentialAccess_SshBruteForceIncoming", true) then
  TrackPidAndTechniqueBM("BM", "T1095", "CommandandControl_NonApplicationLayerProtocol")
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
