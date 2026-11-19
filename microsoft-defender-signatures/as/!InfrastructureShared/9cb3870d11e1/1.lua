-- Threat: !InfrastructureShared
-- Name: 9cb3870d11e1
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
local l_0_1 = {
  "program files"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1048", "Exfiltration_Archive")
return mp.INFECTED
