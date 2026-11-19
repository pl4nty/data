-- Threat: !InfrastructureShared
-- Name: 6db34417c97f
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 == nil then
  return mp.CLEAN
end
if this_sigattrlog[2].matched and this_sigattrlog[2].wp2 == nil then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1021", "LateralMovement")
return mp.INFECTED
