-- Threat: !InfrastructureShared
-- Name: 15b3bb119c06
-- Type: 21
-- Includes: BMLuaLib

if mp.IsHipsRuleEnabled("c1db55ab-c21a-4637-bb3f-a12568109d35") then
  local l_0_0 = bm.get_current_process_startup_info()
  if l_0_0 == nil or l_0_0.command_line == nil then
    return mp.CLEAN
  end
  bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
  local l_0_1, l_0_2 = bm.get_process_relationships()
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    bm.add_threat_process(l_0_4.ppid)
  end
  return mp.INFECTED
end
return mp.CLEAN
