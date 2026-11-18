-- Threat: !InfrastructureShared
-- Name: 40b386208d3c
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if not isnull(l_0_0) and not isnull(l_0_0.command_line) then
  local l_0_1 = string.lower(l_0_0.command_line)
  if string.find(l_0_1, "magicinfo", 1, true) and string.find(l_0_1, "tomcat.exe", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
