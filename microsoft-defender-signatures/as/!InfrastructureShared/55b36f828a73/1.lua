-- Threat: !InfrastructureShared
-- Name: 55b36f828a73
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = string.lower(l_0_0.command_line)
if string.find(l_0_1, "\\program files", 1, true) or string.find(l_0_1, "windowsazure", 1, true) or string.find(l_0_1, "chocolatey.", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
