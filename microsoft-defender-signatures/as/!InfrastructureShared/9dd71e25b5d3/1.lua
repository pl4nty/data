-- Threat: !InfrastructureShared
-- Name: 9dd71e25b5d3
-- Type: 21
-- Includes: TechniqueTracker

if IsPidExcluded("CMDHSTR") then
  return mp.CLEAN
end
TrackPidAndTechnique("CMDHSTR", "T1087.002", "user_discovery")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.INFECTED
end
return mp.LOWFI
