-- Threat: !InfrastructureShared
-- Name: b6b392a35b78
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 100000000 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1070.006", "DefenseEvasion")
return mp.INFECTED
