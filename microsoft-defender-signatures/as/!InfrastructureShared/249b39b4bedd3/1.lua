-- Threat: !InfrastructureShared
-- Name: 249b39b4bedd3
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p1
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[11].utf8p1
elseif this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[12].utf8p1
elseif this_sigattrlog[13].matched and this_sigattrlog[13].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[13].utf8p1
else
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
local l_0_2 = string.match(l_0_1, "\\([^\\]+)$")
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_2 == "desktop.ini" or l_0_2 == "thumbs.db" or string.sub(l_0_2, -4) == ".tmp" or string.sub(l_0_2, 1, 2) == "~$" or string.sub(l_0_2, 1, 4) == "~wrd" then
  return mp.CLEAN
end
local l_0_3 = bm.get_imagepath()
if not isnull(l_0_3) then
  local l_0_4 = string.lower(l_0_3)
  if string.find(l_0_4, "\\windows defender\\msmpeng.exe", 1, true) then
    return mp.CLEAN
  end
end
local l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_1)
if not isnull(l_0_5) then
  l_0_5 = string.lower(l_0_5)
else
  l_0_5 = l_0_1
end
if mp.IsKnownFriendlyFile(l_0_5, true, false) then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_5) then
  bm.add_related_file(l_0_5)
  bm.add_threat_file(l_0_5)
end
bm.add_related_string("DroppedFile", l_0_5, bm.RelatedStringBMReport)
bm.add_related_string("DropTarget", l_0_0, bm.RelatedStringBMReport)
add_parents()
TrackFileAndTechnique(l_0_5, "T1203:cve_2025_8088_archive_startup_drop", 1000)
TrackPidAndTechniqueBM("BM", "T1547.001", "archive_startup_persistence")
return mp.INFECTED
