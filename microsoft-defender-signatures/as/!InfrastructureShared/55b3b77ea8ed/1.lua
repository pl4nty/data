-- Threat: !InfrastructureShared
-- Name: 55b3b77ea8ed
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = string.lower(l_0_0.command_line)
if string.find(l_0_1, "/browser:", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
