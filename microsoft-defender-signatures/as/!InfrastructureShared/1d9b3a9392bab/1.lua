-- Threat: !InfrastructureShared
-- Name: 1d9b3a9392bab
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.command_line then
  bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
  local l_0_1
  if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[5].utf8p2
  end
  if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[6].utf8p2
  end
  if l_0_1 ~= nil then
    bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
  end
  return mp.INFECTED
end
return mp.CLEAN
