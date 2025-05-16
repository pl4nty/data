-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f5b30f7c7c7b\0x00000369_luac 

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
if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil then
  l_0_1 = (string.lower)((this_sigattrlog[5]).utf8p1)
else
  if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p1 ~= nil then
    l_0_1 = (string.lower)((this_sigattrlog[6]).utf8p1)
  end
end
if l_0_1 == nil or #l_0_1 < 2 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1036.005", "DefenseEvasion_Masquerading_MatchLegitimateNameLocation")
;
(bm.add_related_string)("file_metadata", l_0_1, bm.RelatedStringBMReport)
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

