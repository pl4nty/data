-- Threat: !InfrastructureShared
-- Name: 15b33e3e6729
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = string.lower(l_0_0.command_line)
if string.find(l_0_1, "\\program files", 1, true) or string.find(l_0_1, "gizmoinvoker", 1, true) or string.find(l_0_1, "monitorworkeragent", 1, true) or string.find(l_0_1, "\\programdata\\microsoft\\windows defender advanced threat protection", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
