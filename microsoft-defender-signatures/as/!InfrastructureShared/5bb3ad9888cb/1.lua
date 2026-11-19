-- Threat: !InfrastructureShared
-- Name: 5bb3ad9888cb
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  TrackPidAndTechniqueBM("BM", "T1489", "Impact_ServiceStop_postgresql")
end
return mp.CLEAN
