-- Threat: !InfrastructureShared
-- Name: 178b3eefc8aea
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1562.004", "DefenseEvasion_FirewallDisable")
return mp.INFECTED
