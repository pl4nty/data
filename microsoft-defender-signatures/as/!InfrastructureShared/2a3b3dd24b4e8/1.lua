-- Threat: !InfrastructureShared
-- Name: 2a3b3dd24b4e8
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if bm.GetSignatureMatchDuration() > 30000000 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1018", "Discovery_RemoteSystemDiscovery")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
