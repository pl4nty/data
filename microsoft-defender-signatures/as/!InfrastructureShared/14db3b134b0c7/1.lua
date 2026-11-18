-- Threat: !InfrastructureShared
-- Name: 14db3b134b0c7
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 50000000 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1486", "Impact_Ransom")
return mp.INFECTED
