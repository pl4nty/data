-- Threat: !InfrastructureShared
-- Name: 113b310a996a5
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = bm.get_imagepath()
local l_0_2 = l_0_0.command_line
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
if not SuspMacPathsToMonitor(l_0_1, true) then
  return mp.CLEAN
end
if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
