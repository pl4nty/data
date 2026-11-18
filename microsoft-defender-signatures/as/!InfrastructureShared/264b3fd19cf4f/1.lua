-- Threat: !InfrastructureShared
-- Name: 264b3fd19cf4f
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
local l_0_1 = bm.get_current_process_startup_info()
local l_0_2 = l_0_1.command_line
local l_0_3 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_3) then
  return mp.CLEAN
end
if this_sigattrlog[4].matched and this_sigattrlog[4] ~= nil and this_sigattrlog[4] ~= "" then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
elseif this_sigattrlog[5].matched and this_sigattrlog[5] ~= nil and this_sigattrlog[5] ~= "" then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
elseif this_sigattrlog[6].matched and this_sigattrlog[6] ~= nil and this_sigattrlog[6] ~= "" then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
elseif this_sigattrlog[7].matched and this_sigattrlog[7] ~= nil and this_sigattrlog[7] ~= "" then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p2)
elseif this_sigattrlog[8].matched and this_sigattrlog[8] ~= nil and this_sigattrlog[8] ~= "" then
  l_0_0 = string.lower(this_sigattrlog[8].utf8p2)
elseif this_sigattrlog[9].matched and this_sigattrlog[9] ~= nil and this_sigattrlog[9] ~= "" then
  l_0_0 = string.lower(this_sigattrlog[9].utf8p2)
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if not string.find(l_0_0, "/system/library/launch", 1, true) and (string.find(l_0_0, "/library/launchagents", 1, true) or string.find(l_0_0, "/library/launchdaemons", 1, true) or string.find(l_0_0, "/library/preferences", 1, true)) then
  TrackPidAndTechniqueBM("BM", "T1647", "DefenseEvasion_PlutilPlistFileModification")
  mp.set_mpattribute("BM_PlistModUsingPlutil")
  return mp.INFECTED
end
return mp.CLEAN
