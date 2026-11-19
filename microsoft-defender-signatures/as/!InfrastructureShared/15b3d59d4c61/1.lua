-- Threat: !InfrastructureShared
-- Name: 15b3d59d4c61
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
bm_AddRelatedFileFromCommandLine(l_0_1)
add_parents()
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
for l_0_3, l_0_4 in ipairs(l_0_2) do
  l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
  if sysio.IsFileExists(l_0_4) and string.sub(l_0_4, -3) == ".js" then
    bm.add_threat_file(l_0_4)
  end
end
return mp.INFECTED
