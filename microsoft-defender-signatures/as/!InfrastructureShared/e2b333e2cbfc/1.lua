-- Threat: !InfrastructureShared
-- Name: e2b333e2cbfc
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if l_0_1 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
    if sysio.IsFileExists(l_0_4) then
      bm.add_related_file(l_0_4)
    end
  end
end
reportSessionInformation()
add_parents()
return mp.INFECTED
