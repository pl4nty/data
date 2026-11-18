-- Threat: !InfrastructureShared
-- Name: 84b33a89a8db
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
local l_0_1 = bm.get_current_process_startup_info()
local l_0_2 = bm.get_imagepath()
local l_0_3 = l_0_1.command_line
if IsExcludedByCmdlineMacOS(l_0_3) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" then
  l_0_0 = this_sigattrlog[3].utf8p2
  if SuspMacPathsToMonitor(l_0_0, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
