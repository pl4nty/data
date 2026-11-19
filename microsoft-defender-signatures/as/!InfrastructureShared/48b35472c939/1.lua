-- Threat: !InfrastructureShared
-- Name: 48b35472c939
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil then
  local l_0_1 = {
    [".dat"] = true
  }
  local l_0_2 = string.lower(l_0_0.command_line)
  bm_AddRelatedFileFromCommandLine(l_0_2, l_0_1, nil, 1)
  return mp.INFECTED
end
return mp.CLEAN
