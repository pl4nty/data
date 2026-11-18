-- Threat: !InfrastructureShared
-- Name: 110d76e9376dd
-- Type: 21
-- Includes: TechniqueTracker

if IsPidExcluded("CMDHSTR") then
  return mp.CLEAN
end
TrackPidAndTechnique("CMDHSTR", "T1543.003", "lolbin_sc")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.INFECTED
end
return mp.LOWFI
