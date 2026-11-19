-- Threat: !InfrastructureShared
-- Name: 28bb3cbda4b47
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 6000000000 then
  return mp.CLEAN
end
TrackCustomPersistContextNameByPPID("set", "bm", "MimikatzTrigger")
return mp.INFECTED
