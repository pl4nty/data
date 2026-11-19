-- Threat: !InfrastructureShared
-- Name: 566b348609d0c
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
if this_sigattrlog[26].matched and this_sigattrlog[26].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[26].utf8p1)
elseif this_sigattrlog[27].matched and this_sigattrlog[27].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[27].utf8p1)
end
if l_0_1 == nil or #l_0_1 < 9 then
  return mp.CLEAN
end
local l_0_2 = {
  "/insights-client",
  "/kdump",
  "/dracut",
  "/mdatp"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.find(l_0_1, l_0_4, 1, true) then
    return mp.CLEAN
  end
end
addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1569", "Execution_SystemServices")
bm.add_related_string("file_metadata", l_0_1, bm.RelatedStringBMReport)
return mp.INFECTED
