-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1e8b36f7fd863\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
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
if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p2 ~= nil then
  l_0_2 = (string.lower)((this_sigattrlog[6]).utf8p2)
else
  if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p2 ~= nil then
    l_0_2 = (string.lower)((this_sigattrlog[7]).utf8p2)
  else
    if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p2 ~= nil then
      l_0_2 = (string.lower)((this_sigattrlog[8]).utf8p2)
    end
  end
end
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil then
  l_0_3 = (string.lower)((this_sigattrlog[9]).utf8p1)
end
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_2, l_0_3, 6, true) then
  addRelatedProcess()
  reportRelatedBmHits()
  local l_0_4 = l_0_3 .. "|" .. l_0_2 .. "| exit1"
  ;
  (bm.add_related_string)("file_metadata", l_0_4, bm.RelatedStringBMReport)
  return mp.INFECTED
end
do
  local l_0_5 = (string.match)(l_0_3, "/[^/]+$")
  if l_0_5 == nil or l_0_5 == "" then
    return mp.CLEAN
  end
  if (string.find)(l_0_2, l_0_5, 6, true) then
    addRelatedProcess()
    reportRelatedBmHits()
    local l_0_6 = l_0_3 .. "|" .. l_0_2 .. "| exit2"
    ;
    (bm.add_related_string)("file_metadata", l_0_6, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
  do
    return mp.CLEAN
  end
end

