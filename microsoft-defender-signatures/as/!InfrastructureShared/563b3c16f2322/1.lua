-- Threat: !InfrastructureShared
-- Name: 563b3c16f2322
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = string.lower(l_0_0.command_line)
if string.find(l_0_1, "vss[\\'\"]", 1, false) == nil and string.find(l_0_1, "vss$", 1, false) == nil then
  return mp.INFECTED
end
if l_0_1 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
    if sysio.IsFileExists(l_0_4) then
      bm.add_related_file(l_0_4)
    end
  end
end
add_parents()
return mp.INFECTED
