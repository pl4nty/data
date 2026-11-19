-- Threat: !InfrastructureShared
-- Name: b6b385ea186b
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if reportGenericRansomwareRQ("genj_linux_ransom_meta") == mp.INFECTED then
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
  return mp.INFECTED
end
return mp.CLEAN
