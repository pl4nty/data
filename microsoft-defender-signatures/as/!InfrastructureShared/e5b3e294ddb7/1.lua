-- Threat: !InfrastructureShared
-- Name: e5b3e294ddb7
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = bm.get_imagepath()
local l_0_2 = l_0_0.command_line
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
return mp.INFECTED
