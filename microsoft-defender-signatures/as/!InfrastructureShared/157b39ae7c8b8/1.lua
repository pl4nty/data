-- Threat: !InfrastructureShared
-- Name: 157b39ae7c8b8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
if not this_sigattrlog[7].matched or this_sigattrlog[7].utf8p2 == nil or this_sigattrlog[7].utf8p2 == "" then
  return mp.CLEAN
end
local l_0_3 = this_sigattrlog[7].utf8p2
if string.find(l_0_3, "/%.[^/]+$", 1, false) ~= nil and SuspMacPathsToMonitor(l_0_3, true) then
  return mp.INFECTED
end
return mp.CLEAN
