-- Threat: !InfrastructureShared
-- Name: 128b334159ee4
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
local l_0_2 = string.lower(bm.get_imagepath())
if l_0_1 == nil or l_0_1 == "" or l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if not (IsExcludedByCmdlineMacOS(l_0_1) and IsExcludedByImagePathMacOS(l_0_2)) or string.find(l_0_2, "/applications/", 1, true) ~= 1 then
  return mp.INFECTED
end
return mp.CLEAN
