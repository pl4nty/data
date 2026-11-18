-- Threat: !InfrastructureShared
-- Name: 6fb3a3fe0e23
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[4].matched and this_sigattrlog[4].wp2 == nil then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1018", "Discovery")
return mp.INFECTED
