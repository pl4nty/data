-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\27ab3f5365392\0x00000373_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)()
if l_0_1 == nil or l_0_1.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_1.ppid, true) then
  return mp.CLEAN
end
local l_0_2 = nil
if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil then
  l_0_2 = (string.lower)((this_sigattrlog[5]).utf8p2)
else
  if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p2 ~= nil then
    l_0_2 = (string.lower)((this_sigattrlog[6]).utf8p2)
  end
end
local l_0_3 = nil
if l_0_2 == nil then
  if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p2 ~= nil then
    l_0_2 = (string.lower)((this_sigattrlog[7]).utf8p2)
  else
    if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p2 ~= nil then
      l_0_2 = (string.lower)((this_sigattrlog[8]).utf8p2)
    end
  end
  if l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  if (this_sigattrlog[11]).matched and (this_sigattrlog[11]).utf8p1 ~= nil then
    l_0_3 = (string.lower)((this_sigattrlog[11]).utf8p1)
  else
    if (this_sigattrlog[12]).matched and (this_sigattrlog[12]).utf8p1 ~= nil then
      l_0_3 = (string.lower)((this_sigattrlog[12]).utf8p1)
    end
  end
else
  if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil then
    l_0_3 = (string.lower)((this_sigattrlog[9]).utf8p1)
  else
    if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p1 ~= nil then
      l_0_3 = (string.lower)((this_sigattrlog[10]).utf8p1)
    end
  end
end
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = (string.match)(l_0_3, "/[^/]+$")
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_2, l_0_4, 3, true) then
  TrackPidAndTechniqueBM("BM", "T1036.005", "DefenseEvasion_Masquerading_MatchLegitimateNameLocation_mv")
  addRelatedProcess()
  reportRelatedBmHits()
  local l_0_5 = l_0_3 .. "|" .. l_0_2
  ;
  (bm.add_related_string)("file_metadata", l_0_5, bm.RelatedStringBMReport)
  return mp.INFECTED
end
do
  return mp.CLEAN
end

