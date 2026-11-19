-- Threat: !InfrastructureShared
-- Name: 2b7b31f74006c
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_imagepath()
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.command_line
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
if string.find(l_0_2, string.rep("\n", 11), 1, false) or string.find(l_0_2, string.rep("%s", 100), 1, false) then
  return mp.INFECTED
end
return mp.CLEAN
