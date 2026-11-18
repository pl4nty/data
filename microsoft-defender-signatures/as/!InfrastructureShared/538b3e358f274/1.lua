-- Threat: !InfrastructureShared
-- Name: 538b3e358f274
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
if this_sigattrlog[29].matched and this_sigattrlog[29].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[29].utf8p1)
elseif this_sigattrlog[30].matched and this_sigattrlog[30].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[30].utf8p1)
end
if l_0_1 == nil or #l_0_1 < 9 then
  return mp.CLEAN
end
addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1569", "Execution_SystemServices")
bm.add_related_string("file_metadata", l_0_1, bm.RelatedStringBMReport)
return mp.INFECTED
