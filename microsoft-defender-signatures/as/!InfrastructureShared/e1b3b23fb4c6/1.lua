-- Threat: !InfrastructureShared
-- Name: e1b3b23fb4c6
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
end
if l_0_0 ~= nil and string.find(l_0_0, "\\\\amd.com\\", 1, true) then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
local l_0_2 = l_0_1.command_line
if l_0_2 ~= nil then
  local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_2)
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
    if sysio.IsFileExists(l_0_5) then
      bm.add_related_file(l_0_5)
    end
  end
end
add_parents()
return mp.INFECTED
