-- Threat: !InfrastructureShared
-- Name: 170b3fe1e80c6
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[11].matched and this_sigattrlog[11].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[11].utf8p2
  if not string.match(l_0_0, "--status-all") then
    return mp.CLEAN
  end
end
TrackPidAndTechniqueBM("BM", "T1518", "Discovery_SoftwareDiscovery_mt2023", 300)
return mp.INFECTED
