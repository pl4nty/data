-- Threat: !InfrastructureShared
-- Name: e1b3b8d9d91c
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 6000000000 then
  return mp.CLEAN
end
TrackCustomPersistContextNameByPPID("set", "bm", "MimikatzTrigger")
return mp.INFECTED
