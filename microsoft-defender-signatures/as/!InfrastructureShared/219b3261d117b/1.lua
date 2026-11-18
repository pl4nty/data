-- Threat: !InfrastructureShared
-- Name: 219b3261d117b
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
local l_0_2 = string.match(l_0_1, "((%d+)%.(%d+)%.(%d+)%.(%d+))")
local l_0_3 = string.match(l_0_1, "[http://][https://][http://www.][https://www.]+%w+%.%w+[/%w%.]+")
if l_0_2 or l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
