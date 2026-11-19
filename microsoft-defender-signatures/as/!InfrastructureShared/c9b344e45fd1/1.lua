-- Threat: !InfrastructureShared
-- Name: c9b344e45fd1
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 150000000 then
  return mp.CLEAN
end
TrackCustomPersistContextNameByPPID("set", "bm", "MimikatzTrigger")
return mp.INFECTED
