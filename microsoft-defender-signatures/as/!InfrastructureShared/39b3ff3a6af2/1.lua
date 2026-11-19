-- Threat: !InfrastructureShared
-- Name: 39b3ff3a6af2
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if string.find(l_0_1, " -l ", 1, true) and string.find(l_0_1, " -p ", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
