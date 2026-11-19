-- Threat: !InfrastructureShared
-- Name: 205b381e0f918
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p1
else
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
if not string.find(l_0_1, "%.%.\\", 1, true) then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_1, "\\([^\\]+)$")
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_2 == "desktop.ini" or l_0_2 == "thumbs.db" or string.sub(l_0_2, -4) == ".tmp" or string.sub(l_0_2, 1, 2) == "~$" then
  return mp.CLEAN
end
local l_0_3 = bm.get_imagepath()
if not isnull(l_0_3) then
  local l_0_4 = string.lower(l_0_3)
  if string.find(l_0_4, "\\windows defender\\msmpeng.exe", 1, true) then
    return mp.CLEAN
  end
end
if mp.IsKnownFriendlyFile(l_0_1, true, false) then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_1) then
  bm.add_related_file(l_0_1)
  bm.add_threat_file(l_0_1)
end
bm.add_related_string("TraversalPath", l_0_1, bm.RelatedStringBMReport)
bm.add_related_string("TraversalType", l_0_0, bm.RelatedStringBMReport)
add_parents()
TrackFileAndTechnique(l_0_1, "T1203:cve_2025_8088_path_traversal", 1000)
TrackPidAndTechniqueBM("BM", "T1547.001", "path_traversal_persistence")
return mp.INFECTED
