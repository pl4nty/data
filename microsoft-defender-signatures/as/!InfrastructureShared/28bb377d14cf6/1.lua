-- Threat: !InfrastructureShared
-- Name: 28bb377d14cf6
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 150000000 then
  return mp.CLEAN
end
TrackCustomPersistContextNameByPPID("set", "bm", "MimikatzTrigger")
return mp.INFECTED
