-- Threat: !InfrastructureShared
-- Name: 84b3ba4bd187
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if l_0_1 == nil or l_0_1 == "" or IsExcludedByCmdlineMacOS(l_0_1) then
  return mp.CLEAN
end
bm.trigger_sig("BmTraverseTreeBlockMac", "Detected")
return mp.INFECTED
