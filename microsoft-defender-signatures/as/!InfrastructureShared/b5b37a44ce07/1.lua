-- Threat: !InfrastructureShared
-- Name: b5b37a44ce07
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = "remote_file_created_taint"
local l_0_1
if this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].utf8p1
end
if l_0_1 ~= nil and isTainted(l_0_1, l_0_0) then
  TrackPidAndTechniqueBM("BM", "T1562.004", "DefenseEvasion")
  return mp.INFECTED
end
return mp.CLEAN
