-- Threat: !InfrastructureShared
-- Name: 69b303a56a66
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = "remote_file_created_taint"
local l_0_1
local l_0_2 = bm.get_current_process_startup_info()
if this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].utf8p1
end
if l_0_2 ~= nil and l_0_1 ~= nil and not isParentPackageManager(l_0_2.ppid, true) then
  TrackPidAndTechniqueBM(l_0_2.ppid, "T1562.001", "DefenseEvasion")
  if isTainted(l_0_1, l_0_0) then
    addRelatedProcess()
    reportRelatedBmHits()
    return mp.INFECTED
  end
end
return mp.CLEAN
