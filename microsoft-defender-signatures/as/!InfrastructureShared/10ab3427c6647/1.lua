-- Threat: !InfrastructureShared
-- Name: 10ab3427c6647
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1560", "data_archive")
reportSessionInformation()
return mp.INFECTED
