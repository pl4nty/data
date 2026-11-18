-- Threat: !InfrastructureShared
-- Name: 85b3161cbfef
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
l_0_1 = string.lower(string.gsub(l_0_1, "`", ""))
local l_0_2 = string.gsub(l_0_1, " ", "")
if string.find(l_0_2, "\\appdata\\roaming\\", 1, true) or string.find(l_0_2, "\\public\\", 1, true) or string.find(l_0_2, "\\programdata\\", 1, true) or string.find(l_0_1, "[\\start menu\\programs\\startup\\] ", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
