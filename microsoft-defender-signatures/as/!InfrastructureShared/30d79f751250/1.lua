-- Threat: !InfrastructureShared
-- Name: 30d79f751250
-- Type: 21
-- Includes: TechniqueTracker

if IsPidExcluded("CMDHSTR") then
  return mp.CLEAN
end
TrackPidAndTechnique("CMDHSTR", "T1218.011", "lolbin_rundll")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.LOWFI
end
return mp.LOWFI
