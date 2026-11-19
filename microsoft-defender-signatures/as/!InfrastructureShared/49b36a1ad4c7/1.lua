-- Threat: !InfrastructureShared
-- Name: 49b36a1ad4c7
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if string.find(l_0_1, " %d%d%d?%d?%d? ", 1, false) then
  return mp.INFECTED
end
return mp.CLEAN
