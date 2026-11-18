-- Threat: !InfrastructureShared
-- Name: 398b3e9844b67
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
if not this_sigattrlog[16].matched or this_sigattrlog[16].utf8p1 == nil or this_sigattrlog[16].utf8p1 == "" then
  return mp.CLEAN
end
local l_0_3 = this_sigattrlog[16].utf8p1
if sysio.IsFileExists(l_0_3) and SuspMacPathsToMonitor(string.lower(l_0_3), true) then
  TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_Http.A")
  return mp.INFECTED
end
return mp.CLEAN
