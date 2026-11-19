-- Threat: !InfrastructureShared
-- Name: 7ab311b35d24
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = string.match(l_0_1, "[^ ]+%s->%s-\\\\%.\\pipe\\[^ ]+$")
if l_0_2 ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
