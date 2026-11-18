-- Threat: !InfrastructureShared
-- Name: adb37308d1f4
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
if not this_sigattrlog[3].matched or this_sigattrlog[3].utf8p2 == nil or this_sigattrlog[3].utf8p2 == "" then
  return mp.CLEAN
end
local l_0_3 = this_sigattrlog[3].utf8p2
if SuspMacPathsToMonitor(l_0_3, true) then
  TrackPidAndTechniqueBM("BM", "T1573.002", "CommandAndControl_EncryptedChannel_AsymmetricCryptography")
  return mp.INFECTED
end
return mp.CLEAN
