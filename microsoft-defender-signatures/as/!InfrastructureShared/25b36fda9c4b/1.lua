-- Threat: !InfrastructureShared
-- Name: 25b36fda9c4b
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if mp.IsHipsRuleEnabled("c1db55ab-c21a-4637-bb3f-a12568109d35") then
  local l_0_0 = bm.get_current_process_startup_info()
  if l_0_0 ~= nil and l_0_0.command_line ~= nil then
    local l_0_1 = string.lower(l_0_0.command_line)
    if l_0_1:find("windows\\ccm", 1, true) then
      return mp.CLEAN
    end
    bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
    AddResearchData(l_0_0.ppid, true)
  end
  return mp.INFECTED
end
return mp.CLEAN
