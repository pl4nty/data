-- Threat: !InfrastructureShared
-- Name: f7b33d92b788
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if is_valid_ip(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
