-- Threat: !InfrastructureShared
-- Name: 35b33e0a890e
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if string.len(l_0_1) < 1024 then
  return mp.CLEAN
end
return mp.INFECTED
