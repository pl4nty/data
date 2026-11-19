-- Threat: !InfrastructureShared
-- Name: 192b381eb5b85
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p1
end
local l_0_1 = {
  "program files"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1048", "Exfiltration_Archive")
addOverallNetworkVolume()
reportSessionInformation()
return mp.INFECTED
