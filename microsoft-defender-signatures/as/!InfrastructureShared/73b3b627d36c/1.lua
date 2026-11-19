-- Threat: !InfrastructureShared
-- Name: 73b3b627d36c
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if string.find(l_0_1, "\\\\.*%.bat", 1, false) then
  return mp.CLEAN
end
return mp.INFECTED
