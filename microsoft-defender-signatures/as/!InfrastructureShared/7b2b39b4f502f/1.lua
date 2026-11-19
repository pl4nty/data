-- Threat: !InfrastructureShared
-- Name: 7b2b39b4f502f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[34].matched and this_sigattrlog[34].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[34].utf8p1
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1560", "Collection_ArchiveData")
bm.add_related_file(l_0_1)
bm.add_related_string("archivepath", l_0_1, bm.RelatedStringBMReport)
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
