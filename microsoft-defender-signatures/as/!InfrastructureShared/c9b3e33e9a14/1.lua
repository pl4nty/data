-- Threat: !InfrastructureShared
-- Name: c9b3e33e9a14
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 50000000 then
  return mp.CLEAN
end
TrackCustomPersistContextNameByPPID("set", "bm", "MimikatzTrigger")
return mp.INFECTED
