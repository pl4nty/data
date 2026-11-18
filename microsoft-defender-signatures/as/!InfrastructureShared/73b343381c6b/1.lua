-- Threat: !InfrastructureShared
-- Name: 73b343381c6b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil and l_0_0.command_line ~= "" then
  bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
end
return mp.INFECTED
