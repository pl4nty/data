-- Threat: !InfrastructureShared
-- Name: 91b36198d048
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = "remote_file_created_taint"
local l_0_1
local l_0_2 = bm.get_current_process_startup_info()
if this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_1 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched then
  l_0_1 = this_sigattrlog[5].utf8p1
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
