-- Threat: !InfrastructureShared
-- Name: 69b3373a4f6d
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if string.find(l_0_1, " %d%d%d?%d?%d? ", 1, false) and string.find(l_0_1, " %d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?% ", 1, false) then
  return mp.INFECTED
end
return mp.CLEAN
