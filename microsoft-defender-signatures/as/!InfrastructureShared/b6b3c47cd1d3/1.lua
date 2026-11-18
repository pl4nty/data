-- Threat: !InfrastructureShared
-- Name: b6b3c47cd1d3
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if reportGenericRansomwareRQ("gene_linux_ransom_meta") == mp.INFECTED then
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
  return mp.INFECTED
end
return mp.CLEAN
