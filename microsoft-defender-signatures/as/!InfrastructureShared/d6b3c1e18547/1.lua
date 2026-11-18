-- Threat: !InfrastructureShared
-- Name: d6b3c1e18547
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3]
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4]
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5]
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p1
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if not string.find(l_0_1, ".local/share/updater", 1, true) and not string.find(l_0_1, ".config/systemd/user", 1, true) and not string.find(l_0_1, "launchagents", 1, true) then
  return mp.CLEAN
end
bm.add_related_string("ShaiWorm_C2Install", l_0_1, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1543.002", "shaiworm_c2_install")
addRelatedProcess()
reportRelatedBmHits()
local l_0_2, l_0_3 = pcall(reportBmInfo)
if not l_0_2 and l_0_3 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_3), bm.RelatedStringBMReport)
end
return mp.INFECTED
