-- Threat: !InfrastructureShared
-- Name: 15b3159661a4
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, ":\\program files", 1, true) or string.find(l_0_1, "\\windows defender advanced threat", 1, true) or string.find(l_0_1, "\\microsoft intune management", 1, true) or string.find(l_0_1, "\\iscvx\\", 1, true) or string.find(l_0_1, "healthcheck", 1, true) or string.find(l_0_1, "\\datacollection\\", 1, true) then
  return mp.CLEAN
end
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
bm.add_action("EmsScan", 5000)
return mp.INFECTED
