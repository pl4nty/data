-- Threat: !InfrastructureShared
-- Name: 2c5b31d5fc455
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[14].matched and this_sigattrlog[14].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[14].utf8p2)
  if not string.find(l_0_0, " stop", 1, true) then
    return mp.CLEAN
  end
end
TrackPidAndTechniqueBM("BM", "T1489", "Impact_ServiceStop")
return mp.INFECTED
