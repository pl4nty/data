-- Threat: !InfrastructureShared
-- Name: 14db3e88a7391
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 50000000 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1486", "Impact_Ransom")
return mp.INFECTED
