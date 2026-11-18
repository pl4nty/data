-- Threat: !InfrastructureShared
-- Name: 99b38c97d937
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 150000000 then
  return mp.CLEAN
end
TrackCustomPersistContextNameByPPID("set", "bm", "MimikatzTrigger")
return mp.INFECTED
