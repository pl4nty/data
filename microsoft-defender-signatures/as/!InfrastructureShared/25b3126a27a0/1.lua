-- Threat: !InfrastructureShared
-- Name: 25b3126a27a0
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.command_line == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if string.find(l_0_1, "--destdir", 1, true) and string.find(l_0_1, "--providerdir", 1, true) and string.find(l_0_1, "--loglevel ", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
