-- Threat: !InfrastructureShared
-- Name: d6b3add6a181
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
local l_0_2 = string.lower(bm.get_imagepath())
if l_0_1 == nil or l_0_1 == "" or l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if not IsExcludedByCmdlineMacOS(l_0_1) or not IsExcludedByImagePathMacOS(l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
