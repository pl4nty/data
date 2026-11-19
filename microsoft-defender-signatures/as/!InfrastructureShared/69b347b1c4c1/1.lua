-- Threat: !InfrastructureShared
-- Name: 69b347b1c4c1
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
  l_0_1 = this_sigattrlog[2].ppid
else
  return mp.CLEAN
end
if isParentPackageManager(l_0_1) then
  return mp.CLEAN
end
if l_0_0 then
  bm.add_related_file(l_0_0)
end
if l_0_1 ~= nil then
  TrackPidAndTechniqueBM(l_0_1, "T1053.003", "Persistence")
end
reportRelatedBmHits()
addRelatedProcess()
return mp.INFECTED
