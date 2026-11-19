-- Threat: !InfrastructureShared
-- Name: 15b3a22b5713
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, " -noprofile ", 1, true) or string.find(l_0_0, " -noninteractive ", 1, true) or string.find(l_0_0, "wsmprovhost", 1, true)) then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
local l_0_2 = string.lower(l_0_1.command_line)
if string.find(l_0_2, "\\program files", 1, true) or string.find(l_0_2, "taskschedulerinvoke", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
