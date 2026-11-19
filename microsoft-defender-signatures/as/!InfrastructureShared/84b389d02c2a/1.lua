-- Threat: !InfrastructureShared
-- Name: 84b389d02c2a
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1560", "data_archive")
reportSessionInformation()
return mp.INFECTED
