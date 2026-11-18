-- Threat: !InfrastructureShared
-- Name: 1a3b3367a6ba8
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 == nil or l_0_1.ppid == nil or l_0_1.command_line == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_1.ppid, true) then
  return mp.CLEAN
end
if this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched then
  l_0_0 = this_sigattrlog[9].utf8p1
elseif this_sigattrlog[10].matched then
  l_0_0 = this_sigattrlog[10].utf8p1
else
  return mp.CLEAN
end
if l_0_0 ~= nil then
  bm.add_related_file(l_0_0)
  mp.ReportLowfi(l_0_0, 1690978323)
end
TrackPidAndTechniqueBM("BM", "T1574", "DefenseEvasion_HijackExecutionFlow_WWDSuspiciousModuleDrop")
return mp.INFECTED
