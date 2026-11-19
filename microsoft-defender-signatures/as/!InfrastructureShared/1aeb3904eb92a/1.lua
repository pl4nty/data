-- Threat: !InfrastructureShared
-- Name: 1aeb3904eb92a
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
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[7].utf8p1)
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[8].utf8p1)
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[9].utf8p1)
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[10].utf8p1)
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_1, "/[^/]+$")
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = {
  "/bin",
  "/usr/bin",
  "/sbin",
  "/usr/sbin"
}
for l_0_4, l_0_5 in ipairs(l_0_3) do
  local l_0_6 = l_0_5 .. l_0_2
  if l_0_6 and sysio.IsFileExists(l_0_6) then
    addRelatedProcess()
    reportRelatedBmHits()
    TrackPidAndTechniqueBM("BM", "T1036.005", "DefenseEvasion_Masquerading_MatchLegitimateNameLocation")
    local l_0_7 = l_0_1 .. "|" .. l_0_6
    bm.add_related_string("file_metadata", l_0_7, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
