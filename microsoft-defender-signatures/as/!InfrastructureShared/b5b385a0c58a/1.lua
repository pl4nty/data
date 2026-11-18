-- Threat: !InfrastructureShared
-- Name: b5b385a0c58a
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if reportGenericRansomwareRQ("genb_linux_ransom_meta") == mp.INFECTED then
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
  return mp.INFECTED
end
return mp.CLEAN
