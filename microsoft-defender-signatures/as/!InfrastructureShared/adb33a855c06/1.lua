-- Threat: !InfrastructureShared
-- Name: adb33a855c06
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[2].utf8p2
else
  return mp.CLEAN
end
local l_0_4
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_4 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_4 = this_sigattrlog[4].utf8p2
else
  return mp.CLEAN
end
if l_0_3 == l_0_4 and SuspMacPathsToMonitor(l_0_4, true) then
  return mp.INFECTED
end
return mp.CLEAN
