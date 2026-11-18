-- Threat: !InfrastructureShared
-- Name: 22cb3cc2b9481
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
local l_0_2 = string.match(l_0_1, "((%d+)%.(%d+)%.(%d+)%.(%d+))")
if l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
