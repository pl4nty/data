-- Threat: !InfrastructureShared
-- Name: 2a3b35d6d7439
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1562.001", "mptamper_av")
return mp.INFECTED
