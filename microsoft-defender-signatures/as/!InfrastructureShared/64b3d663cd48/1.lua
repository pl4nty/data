-- Threat: !InfrastructureShared
-- Name: 64b3d663cd48
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 50000000 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1486", "Impact_Encryption")
return mp.INFECTED
