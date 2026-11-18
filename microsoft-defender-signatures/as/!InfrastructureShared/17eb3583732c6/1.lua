-- Threat: !InfrastructureShared
-- Name: 17eb3583732c6
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1
end
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 == nil or l_0_1.ppid == nil or l_0_1.ppid == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
TrackPidAndTechniqueBM(l_0_1.ppid, "T1560.001", "Collection_ArchiveViaUtility_TAR")
bm.trigger_sig("FileArchiving", l_0_0)
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
