-- Threat: !InfrastructureShared
-- Name: 25b3a6f39606
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
l_0_1 = string.lower(string.gsub(l_0_1, "`", ""))
local l_0_2 = string.gsub(l_0_1, " ", "")
if string.find(l_0_2, ").downloadstring(", 1, true) or string.find(l_0_2, ")).readtoend()", 1, true) or string.find(l_0_1, "[wmiclass] ", 1, true) then
  return mp.INFECTED
end
if string.len(l_0_1) > 2048 and (string.find(l_0_1, " -e ", 1, true) or string.find(l_0_1, " -ec ", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
