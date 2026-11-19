-- Threat: !InfrastructureShared
-- Name: 19fb3500b4be3
-- Type: 21
-- Includes: TechniqueTracker

if not this_sigattrlog[1].matched or this_sigattrlog[1].utf8p1 == nil then
  return mp.CLEAN
end
if not this_sigattrlog[4].matched or this_sigattrlog[4].utf8p1 == nil then
  return mp.CLEAN
end
bm.add_related_file(this_sigattrlog[1].utf8p1)
bm.add_related_file(this_sigattrlog[4].utf8p1)
TrackPidAndTechniqueBM("BM", "T1218.015", "ElectronLokiDeployXP")
return mp.INFECTED
