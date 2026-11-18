-- Threat: !InfrastructureShared
-- Name: 284b30abe43a7
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 150000000 then
  return mp.CLEAN
end
TrackCustomPersistContextNameByPPID("LSADumpCache", "bm", "MimikatzLsaDumpCache")
return mp.INFECTED
