-- Threat: !InfrastructureShared
-- Name: 55b3deaba1fb
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "Capfetox", "Capfetox_tagged")
return mp.INFECTED
