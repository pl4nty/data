-- Threat: !InfrastructureShared
-- Name: 11eb33f63d2b8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
if not this_sigattrlog[2].matched or this_sigattrlog[2].utf8p1 == nil or this_sigattrlog[2].utf8p1 == "" then
  return mp.CLEAN
end
local l_0_3 = this_sigattrlog[2].utf8p1
if string.find(l_0_3, "/Library/LaunchDaemons/", 1, true) == 1 and sysio.IsFileExists(l_0_3) then
  return mp.INFECTED
end
return mp.CLEAN
