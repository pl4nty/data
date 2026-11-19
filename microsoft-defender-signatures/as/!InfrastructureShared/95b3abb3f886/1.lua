-- Threat: !InfrastructureShared
-- Name: 95b3abb3f886
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.command_line then
  local l_0_1 = {
    [".one"] = true,
    [".hta"] = true
  }
  bm_AddRelatedFileFromCommandLine(l_0_0.command_line, l_0_1, nil, 6)
  return mp.INFECTED
end
return mp.CLEAN
