-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7b2b39b4f502f\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1 = nil
if (this_sigattrlog[34]).matched and (this_sigattrlog[34]).utf8p1 ~= nil then
  l_0_1 = (this_sigattrlog[34]).utf8p1
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1560", "Collection_ArchiveData")
;
(bm.add_related_file)(l_0_1)
;
(bm.add_related_string)("archivepath", l_0_1, bm.RelatedStringBMReport)
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

