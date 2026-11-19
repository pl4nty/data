-- Threat: !InfrastructureShared
-- Name: adb3e8ca1ec4
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1560", "data_archive")
reportSessionInformation()
return mp.INFECTED
