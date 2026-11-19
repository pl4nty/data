-- Threat: !InfrastructureShared
-- Name: a8bb3260eaca5
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[46].matched then
  l_0_0 = this_sigattrlog[46].ppid
end
if l_0_0 ~= nil and not isParentPackageManager(l_0_0, true) then
  TrackPidAndTechniqueBM(l_0_0, "T1546.004", "Persistence")
  return mp.INFECTED
end
return mp.CLEAN
